import 'package:flutter/material.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class MyProfileDataProvider {
  final dio = Dio();

  final DatabaseHelper databaseHelper = DatabaseHelper();

  Future<ProfileModel> getMyProfile() async {
    try {
      final String? token = await databaseHelper.getToken();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(Constants.get_me_url);
      final body = response.data;
      if (response.statusCode != 200) {
        throw Exception(body["message"]);
      }

      final Map<String, dynamic> data = response.data;
      final Map<String, dynamic> profile = data['data']['user'];

      return ProfileModel.fromJson(profile);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileModel> updateMyProfile(ProfileModel profile) async {
    try {
      final String? token = await databaseHelper.getToken();
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.patch(
        Constants.update_profile_url,
        data: json.encode(profile.toJson()),
      );

      debugPrint("Response: ${response.data}");

      final Map<String, dynamic> data = response.data;

      return ProfileModel.fromJson(data['data']['user']);
    } catch (e) {
      rethrow;
    }
  }
}
