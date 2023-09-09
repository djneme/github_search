import 'dart:convert';

import 'package:github_search/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<UserModel> getUsers(String userName) async {
    final existingData = _getUserData();


    http.Response response =
        await http.get(Uri.parse("https://api.github.com/users/$userName"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      _saveUserData(UserModel.fromJson(result));
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//save to share preference
Future<bool> _saveUserData(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();

  return await prefs.setString('userData', jsonEncode(user));
}

// Get user info from SharedPreferences
Future<UserModel?> _getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final userDataString = prefs.getString('userData');
  if (userDataString != null) {
    final userData = jsonDecode(userDataString);
    return UserModel.fromJson(userData);
  }
  return null;
}

final userProvider = Provider<ApiService>((ref) => ApiService());
