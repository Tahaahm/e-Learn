// ignore_for_file: unused_field, unused_local_variable

import 'package:e_learn_second/auth/auth_method.dart';
import 'package:e_learn_second/models/users.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Users? _users;
  final AuthMethod _authMethod = AuthMethod();

  Users get getUser => _users!;
  Future<void> refreshUser() async {
    Users users = await _authMethod.getUserDetials();
    _users = users;
    notifyListeners();
  }
}
