// ignore_for_file: unused_field, unused_local_variable, avoid_print, unnecessary_null_comparison, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn_second/auth/storage.dart';
import 'package:e_learn_second/models/users.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<model.Users> getUserDetials() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _store.collection("users").doc(currentUser.uid).get();

    return model.Users.fromSnap(snap);
  }

  Future<String> signUpPage({
    required String email,
    required String password,
    required String user,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error ocurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          user.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl =
            await StorageMethod().uploadImageToStorage("profilePics", file);
        model.Users users = model.Users(
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          username: user,
          bio: bio,
          favorite: [],
          likes: [],
        );
        print(cred.user!.uid);
        await _store
            .collection("users")
            .doc(cred.user!.uid)
            .set(users.toJson());

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        res = "The email is badly formatted";
      } else if (err.code == "weak-password") {
        res = "password should be at least 6 characters";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    String res = "Some Error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please Enter all the field";
      }
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        res = "Email is Wrong";
      } else if (e.code == "wrong-password") {
        res = "Password is Wrong";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signOut() async {
    String res = "Error";
    try {
      await _auth.signOut();
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
