import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'api_constants.dart';

class AuthServices {
  final Dio _dio;

  AuthServices(this._dio);

  Future<dynamic> login(String userName, String password) async {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.contentType =
        'application/x-www-form-urlencoded;charset=utf-8';
    var diges = md5.convert(utf8.encode(password)).toString().toLowerCase();
    Response? response;
    try {
      response = await _dio.post(ApiConstants.login, data: {
        'grant_type': 'password',
        'username': userName,
        'password': diges
      });
    } catch (e) {
      print(e.toString());
    }

    return response?.data;
  }
}
