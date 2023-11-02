import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../models/phieudieutra_model.dart';
import '../../models/response_model.dart';
import '../sqlite/execute_database.dart';
import 'api_constants.dart';

class SyncServices {
  final Dio _dio;

  SyncServices(this._dio);

  Future<int> syncData(String accessToken, String month) async {
    int statusCode = 500;
    await http.get (Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.fetchHouseHold}/$month/2023'),
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
  }

  Future<dynamic> fetchArea(String accessToken, String month) async {
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

  Future<dynamic> fetchHouseHold(String accessToken, String month) async {
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

  Future<dynamic> fetchBangkeThangDT(String accessToken, String month) async {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    final header = {
      'content-type': 'application/json',
      'authorization': 'Bearer $accessToken'
    };
    _dio.options.headers = header;
    Response response = await _dio.get("${ApiConstants.fetchBangkeThangDT}/$month/2023");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      log('error: ${response.data}');
      return ResponseModel.withError(response.data);
    }
  }

  Future<dynamic> getEnquiry(String accessToken, String thangDT, String namDT, String id)async{
    _dio.options.baseUrl = ApiConstants.baseUrl;
    final header = {
      'content-type': 'application/json',
      'authorization': 'Bearer $accessToken'
    };
    _dio.options.headers = header;
    Response? response;
    try {
      response = await _dio.get('api/phieudieutra2022/$thangDT/$namDT/$id');
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

  Future<String> Sync(String token, List<PhieuDieuTraModel> listphieuDieuTra, ExecuteDatabase _executeDatabase) async {
    var tempt =0;
    for(int i = 0 ; i < listphieuDieuTra.length; i++) {
      http.Response response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}api/phieudieutra2024'),
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
        await _executeDatabase.updateTrangThai(
            listphieuDieuTra[i].bangKeThangDT!.idhO_BKE!, 9,
            listphieuDieuTra[i].bangKeThangDT!.thangDT!,
            listphieuDieuTra[i].bangKeThangDT!.namDT!
        );
        await _executeDatabase.updateSync(
            listphieuDieuTra[i].bangKeThangDT!.idhO_BKE!, 1,
            listphieuDieuTra[i].bangKeThangDT!.thangDT!,
            listphieuDieuTra[i].bangKeThangDT!.namDT!
        );
      } else {
        print('Fail!1');
        print(response.statusCode);
      }
    }
    return '$tempt/${listphieuDieuTra.length}';
  }

  Future<int> ThayTheHo(String token, List<Map<String, dynamic>> data, ExecuteDatabase _executeDatabase) async {
    var tempt =0;
    for(int i = 0 ; i < data.length; i++) {
      var envelope = {
        "idho": data[i]['idho'],
        "tenChuHo":data[i]['tenChuHo'],
        "diaChi":data[i]['diaChi'],
        "tsKhau":data[i]['tsKhau'],
        "tsNu":data[i]['tsNu'],
        "trangthai":data[i]['trangthai'],
        "hoDuPhong":data[i]['hoDuPhong'],
        "nhom":data[i]['nhom'],
      };
      http.Response response = await http.put(
        Uri.parse('${ApiConstants.baseUrl}api/thaytheho'),
        body: jsonEncode(envelope),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
      );
      log(data[i].toString());
      if (response.statusCode == 200) {
        print("Success!1");
        tempt++;
        await _executeDatabase.updateHoDuPhong(data[i]['nhom'], data[i]['hoDuPhong'], data[i]['idho'], data[i]['thangDT'], data[i]['namDT']);
      }
      else {
        print('Fail!1');
        print(response.statusCode);
      }
    }
    return tempt;
  }
}
