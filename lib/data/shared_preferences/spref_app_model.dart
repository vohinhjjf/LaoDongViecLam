import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import 'spref_constants.dart';

class SPrefAppModel {
  static final SPrefAppModel _instance = SPrefAppModel._internal();

  SPrefAppModel._internal();

  static SPrefAppModel get instance => _instance;
  late SharedPreferences _sharedPref;

  Future<void> onInit() async {
    _sharedPref = await SharedPreferences.getInstance();
  }
  //Access Token
  String get accessToken {
    return _sharedPref.getString(SPrefConstants.accessTokenKey) ?? '';
  }
  Future<void> setAccessToken(String accessToken) async {
    await _sharedPref.setString(SPrefConstants.accessTokenKey, accessToken);
  }

  //Month
  Future<void> setMonth(String month) async {
    await _sharedPref.setString(SPrefConstants.month, month);
  }
  String get month {
    return _sharedPref.getString(SPrefConstants.month) ?? '';
  }

  //IDDB
  Future<void> setIDDB(String iddb) async {
    await _sharedPref.setString(SPrefConstants.iddb, iddb);
  }
  String get IDDB {
    return _sharedPref.getString(SPrefConstants.iddb) ?? '';
  }

  //IDTV
  Future<void> setIDTV(int idtv) async {
    await _sharedPref.setInt(SPrefConstants.idtv, idtv);
  }
  int get IDTV {
    return _sharedPref.getInt(SPrefConstants.idtv) ?? 0;
  }

  //Auto sync
  bool isAutoSync() {
    return _sharedPref.getBool(SPrefConstants.isAutoSyncKey) ?? false;
  }
  Future<void> setAutoSync(bool isAutoSync) async {
    await _sharedPref.setBool(SPrefConstants.isAutoSyncKey, isAutoSync);
  }

  //user
  UserModel get userModel {
    String user = _sharedPref.getString(SPrefConstants.userModelKey) ?? '';
    if (user.isEmpty) {
      return UserModel();
    }
    final userDecode = jsonDecode(user) as Map<String, dynamic>;
    return UserModel.fromJson(userDecode);
  }

  Future<void> setUserModel(UserModel userModel) async {
    String userEncode = jsonEncode(userModel.toJson());
    await _sharedPref.setString(SPrefConstants.userModelKey, userEncode);
  }

  int get interviewStatus {
    return _sharedPref.getInt(SPrefConstants.interviewStatusKey) ?? 0;
  }

  Future<void> setInterviewStatus(int interviewStatus) async {
    await _sharedPref.setInt(SPrefConstants.interviewStatusKey, interviewStatus) ;
  }

  Future<void> setIdHo(String stt) async {
    await _sharedPref.setString(SPrefConstants.id_ho, stt);
  }

  String get getIdHo {
    return _sharedPref.getString(SPrefConstants.id_ho) ?? '';
  }

  Future<void> setUserName(String mansd) async {
    await _sharedPref.setString(SPrefConstants.userName, mansd);
  }
  Future<void> setPassWord(String password) async {
    await _sharedPref.setString(SPrefConstants.passWord, password);
  }
  String get getUserName {
    return _sharedPref.getString(SPrefConstants.userName) ?? '';
  }

  String get getPassword {
    return _sharedPref.getString(SPrefConstants.passWord) ?? '';
  }
}
