import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scoremaster/src/models/user_model.dart';

class UserService {
  UserService._();

  static final UserService _instance = UserService._();

  static UserService get instance => _instance;

  Future<List<UserModel>> fetchUsers() async {
    String data = await rootBundle.loadString('assets/mock/data/users.json');

    List<dynamic> json = jsonDecode(data);

    return json.map((entry) => UserModel.fromJson(entry)).toList();
  }
}
