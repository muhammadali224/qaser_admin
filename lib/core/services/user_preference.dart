import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/admin_model/admin_model.dart';

class UserPreferences extends GetxService {
  AdminModel? _user;

  AdminModel get user => _user!;

  set user(AdminModel userVal) {
    _user = userVal;
  }

  static const String _userKey = 'user';

  Future<void> setUser(AdminModel userVal) async {
    user = userVal;
    await _saveUser(userVal);
  }

  Future<void> clearUser() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Future<void> changeUser(UserModel user) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_userKey, json.encode(user.toJson()));
  // }

  Future<void> _saveUser(AdminModel userVal) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = userVal.toJson();
    print(userJson);
    await prefs.setString(_userKey, jsonEncode(userJson));
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    print(userJson);
    if (userJson != null) {
      user = AdminModel.fromJson(jsonDecode(userJson));
    }
  }

  Future<void> initUser() async {
    await getUser();
  }

  @override
  void onInit() async {
    await initUser();
    super.onInit();
  }
}
