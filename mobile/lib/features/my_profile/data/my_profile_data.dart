import 'package:flutter/material.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/core/database/database_helper.dart';
import 'dart:convert';

class MyProfileDataProvider {
  final String _baseUrl = "https://dating-backend-sf1t.onrender.com/api/v1";
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Future<ProfileModel> getMyProfile() async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.get(
        Uri.parse("$_baseUrl/auth/me"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to load profile");
      }

      await Future.delayed(const Duration(seconds: 2));

      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> profile = data['data']['user'];
      debugPrint("Profile: $profile");

      return ProfileModel.fromJson(profile);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileModel> updateMyProfile(ProfileModel profile) async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.patch(

        Uri.parse("$_baseUrl/user"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(profile.toJson()),
      );

      debugPrint("Response: ${response.body}");

      final Map<String, dynamic> data = json.decode(response.body);

      return ProfileModel.fromJson(data['data']['user']);
    } catch (e) {
      rethrow;
    }
  }
}
