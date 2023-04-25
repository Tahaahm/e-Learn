// ignore_for_file: equal_keys_in_map

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List favorite;
  final List likes;

  Users(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.favorite,
      required this.likes});
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "photoUrl": photoUrl,
        "username": username,
        "bio": bio,
        "favorite": favorite,
        "likes": likes,
      };

  static Users fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return Users(
      username: snapShot['username'],
      email: snapShot['email'],
      uid: snapShot['uid'],
      photoUrl: snapShot['photoUrl'],
      bio: snapShot['bio'],
      favorite: snapShot['favorite'],
      likes: snapShot['likes'],
    );
  }
}
