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

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }
}
