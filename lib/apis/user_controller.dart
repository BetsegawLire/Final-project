import 'dart:convert';
import 'dart:async';
import 'package:amrpfe/models/userdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  // log-in
  Future<dynamic> login(
      String phone, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse("https://armada-server.glitch.me/api/auth/login"),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
      body: jsonEncode(
        // <String, String>{"username": username, "password": password},
        <String, String>{"phone": phone, "password": password},
      ),
    );

    return response.statusCode;
  }

  // sign-up
  Future<dynamic> signup(UserData userData, BuildContext context) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('https://armada-server.glitch.me/api/auth/register'));

    // Add user data as a field
    request.fields['userData'] = jsonEncode(userData.toJson());

    final response = await request.send();

    return response.statusCode;
  }

  // verify-otp
  Future<dynamic> verifyOtp(
      String phone, String otp, BuildContext context) async {
    final response = await http.post(
      Uri.parse("https://armada-server.glitch.me/api/auth/verify"),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
      body: jsonEncode(
        // <String, String>{"username": username, "password": password},
        <String, String>{"phone": phone, "otp": otp},
      ),
    );

    return response.statusCode;
  }

  // log-out
  Future<dynamic> logout(BuildContext context) async {
    final response = await http.delete(
      Uri.parse("https://armada-server.glitch.me/api/auth/delete"),
    );

    return response.statusCode;
  }
}
