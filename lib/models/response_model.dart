import 'dart:developer';

import 'package:http/http.dart';

class ResponseModel<T> {
  int? statusCode;
  String? message;
  T? body;

  ResponseModel({this.statusCode, this.body});

  ResponseModel.withError(Response? response) {
    String? message;
    int? statusCode;
    log("=========== ERROR ===========");
    if (response != null) {
      log("=========== statusCode ===========");
      log("${response.statusCode}");
      statusCode = response.statusCode;
      log("=========== data ===========");
      log("${response.body}");
      message = '';
      // message = response.body['Message']?? response.body;
    } else {
      statusCode = 500;
      log("=========== message ===========");
      message = "Không thể kết nối đến máy chủ!";
    }
    this.message = message;
    this.statusCode = statusCode;
    body = null;
  }

  ResponseModel.withDisconnect() {
    log("=========== DISCONNECT ===========");
    message = "Disconnect";
    statusCode = -1;
    body = null;
  }

  bool get isSuccess => statusCode == 200 ? true : false;
}
