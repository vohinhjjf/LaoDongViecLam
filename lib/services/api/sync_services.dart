import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../models/response_model.dart';
import 'api_constants.dart';

class SyncServices {
  final Dio _dio;

  SyncServices(this._dio);

  /*Future<int> syncData(String accessToken) async {
    int statusCode = 500;
    await http.get (Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.fetchHouseHold}'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $accessToken"
        },
    ).then((value) => {
          statusCode = value.statusCode
    }).catchError((err) {
      statusCode = err.toString() as int; // Prints 401.
    }, test: (error) {
      //statusCode = i;
      return error is int && error >= 400;
    });
    return statusCode;
  }*/

  Future<dynamic> fetchArea(String accessToken, int month) async {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    final header = {
      'content-type': 'application/json',
      'authorization': 'Bearer $accessToken'
    };
    _dio.options.headers = header;
    Response response = await _dio.get("${ApiConstants.fetchArea}/$month/2023");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      log('error: ${response.data}');
      return ResponseModel.withError(response.data);
    }
  }

  Future<dynamic> fetchHouseHold(String accessToken, int month) async {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    final header = {
      'content-type': 'application/json',
      'authorization': 'Bearer $accessToken'
    };
    _dio.options.headers = header;
    Response response = await _dio.get("${ApiConstants.fetchHouseHold}/$month/2023");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      log('error: ${response.data}');
      return ResponseModel.withError(response.data);
    }
  }

  Future<dynamic> getEnquiry(String accessToken, String id)async{
    _dio.options.baseUrl = ApiConstants.baseUrl;
    final header = {
      'content-type': 'application/json',
      'authorization': 'Bearer $accessToken'
    };
    _dio.options.headers = header;
    Response? response;
    try {
      response = await _dio.get('api/enquiry/$id');
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String?> DoiMatKhau(String token, String mansd, String matkhau) async {
    var envelope = {
      "mansd": mansd,
      "matkhau":matkhau
    };
    http.Response response = await http.put (Uri.parse(
        '${ApiConstants.baseUrl}api/user/doimatkhau'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(envelope)
    );
    print(jsonEncode(envelope));
    if (response.statusCode == 200) {
      print("success");
      return response.body;
    } else {
      return null;
    }
  }

  /*Future<String> Sync(String token, List<PhieuDieuTraModel> listphieuDieuTra, ExecuteDatabase _executeDatabase) async {
    var tempt =0;
    for(int i = 0 ; i < listphieuDieuTra.length; i++) {
      if(listphieuDieuTra[i].tinhTrang_HDBK == 1){
        http.Response response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}api/phieudieutra'),
          body: listphieuDieuTra[i].toJson(),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );
        log(listphieuDieuTra[i].toJson().toString());
        if (response.statusCode == 200) {
          print("Success!1");
          tempt++;
          _executeDatabase.updateTTBK(1, listphieuDieuTra[i].id!);
        } else {
          print('Fail!1');
          print(response.statusCode);
        }
      }
      else {
        var envelope = {
          "id": listphieuDieuTra[i].id,
          "tenCS":listphieuDieuTra[i].tenCS_BK,
          "diaChi": listphieuDieuTra[i].diaChi_BK,
          "tinhTrangDT": listphieuDieuTra[i].tinhTrang_DTBK,
          "tinhTrangHD": listphieuDieuTra[i].tinhTrang_HDBK,
        };
        http.Response response = await http.put (Uri.parse(
            '${ApiConstants.baseUrl}api/bangkecs'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer $token"
            },
            body: jsonEncode(envelope)
        );
        if (response.statusCode == 200) {
          print("Success!2");
          tempt++;
          _executeDatabase.updateTTBK(1, listphieuDieuTra[i].id!);
        } else {
          print('Fail!2');
          print(jsonEncode(envelope));
        }
      }
    }
    return '$tempt/${listphieuDieuTra.length}';
  }*/
}
