import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/error/exception.dart';
import 'package:qismati/core/network/network_info.dart';
import 'package:qismati/core/utils/location.dart';

class NearYouDataProvier {
  final String _baseUrl = "https://dating-backend-sf1t.onrender.com/api/v1";
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final location = LocationImpl(Geolocator());
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  Future<List<ProfileModel>> getNearYou({required int page}) async {
    try {
      final networkInfo =
          await NetworkInfoImpl(internetConnectionChecker).isConnected;

      if (!networkInfo) {
        throw NetworkException();
      }

      final currLocation = await location.getLocation();

      final String? token = await databaseHelper.getToken();
      final response = await http.get(
        Uri.parse(
          "$_baseUrl/user/nearme?latitude=${currLocation.latitude}&longitude=${currLocation.longitude}&distance=100&page=$page",
        ),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 500) {
        throw ServerException(data["message"]);
      }

      debugPrint("Near You: $data");

      if (response.statusCode != 200) {
        throw Exception("Failed to load near you");
      }

      final List<dynamic> users = data["data"]["users"];

      final List<ProfileModel> profiles =
          users.map((e) => ProfileModel.fromJson(e)).toList();
      debugPrint("Near You: $profiles");

      return profiles;
    } catch (e) {
      rethrow;
    }
  }
}
