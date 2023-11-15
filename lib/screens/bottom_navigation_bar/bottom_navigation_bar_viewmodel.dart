import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../components/ui_colors.dart';
import '../../components/ui_styles.dart';
import '../../components/ui_text.dart';
import '../../components/ui_values.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../models/area_model.dart';
import '../../models/bangkeThangDT_model.dart';
import '../../models/bangke_model.dart';
import '../../models/response_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class BottomNavigationViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  String? userName, month;
  bool isAutoSync = false;
  final versionApp = '';
  Map body = {};
  BottomNavigationViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);
  bool loading = false;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    userName = _sPrefAppModel.getUserName;
    month = _sPrefAppModel.month;
    // call api lan dau dang nhap
    isAutoSync = _sPrefAppModel.isAutoSync();
    showDialog(
        context: context,
        builder: (context1){
          if (isAutoSync) {
            print("Mới đăng nhập");
            fetchData(context1);
          } else {
            print("Đã đăng nhập");
            postData(context1);
          }
          return const Center(child: CircularProgressIndicator());
        }
    );
  }

  Future<void> fetchData(BuildContext context) async {
    String month = await _sPrefAppModel.month;
    int namDT = DateTime.now().year;
    final fetchResponse1 = await _syncServices.fetchHouseHold(_sPrefAppModel.accessToken, month);
    final fetchResponse2 = await _syncServices.fetchArea(_sPrefAppModel.accessToken, month);
    final fetchResponse3 = await _syncServices.fetchBangkeThangDT(_sPrefAppModel.accessToken, month);
    print("Token: "+fetchResponse1.toString());
    if (fetchResponse1.toString().isNotEmpty && fetchResponse2.toString().isNotEmpty && fetchResponse3.toString().isNotEmpty) {
      List listBangKeCsModel = fetchResponse1.map((c) => BangKeCsModel.fromJson(c)).toList();
      List listAreaModel = fetchResponse2.map((c) => AreaModel.fromJson(c)).toList();
      List listBangKeThangDTModel = fetchResponse3.map((c) => BangKeThangDTModel.fromJson(c)).toList();
      //
      await _executeDatabase.getArea(int.parse(month), namDT).then((value) async {
        print("Check: ${value.length}");
        if(value.isEmpty){
          // set bangkehomodel
          await _executeDatabase.setBangKeHo(listBangKeCsModel, int.parse(month), namDT);
          //set Area
          await _executeDatabase.setArea(listAreaModel);
          //set Bk_TDT
          await _executeDatabase.setListBangKeThangDTModel(listBangKeThangDTModel);
        }
      });
      _sPrefAppModel.setAutoSync(false);
    }
    Navigator.of(context).pop();
  }

  void logout() async {
    _sPrefAppModel.setAccessToken('');
    NavigationServices.instance.navigateToLogin(context);
  }

  Future postData(BuildContext context) async {
    var errorMessage = '', message = '';
    bool isSuccess = false;
    log('BODY: ${jsonEncode(body)}');
    /*final _request = await _syncServices.syncData(_sPrefAppModel.accessToken, _sPrefAppModel.month);
    if (_request == 200) {
      log("=========== SUCCESS ===========");
    }
    else if (_request == 401) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: const UIText(
              text: 'Tài khoản đã hết hạn, vui lòng đăng nhập và đồng bộ lại!',
              textColor: Colors.black,
              textFontSize:fontLarge,
              isBold: false,
            ),
            content: Container(
              height: 60,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      height: 60,
                      shape: const RoundedRectangleBorder(
                          //side: BorderSide(color: Colors.black,width: 0.1)
                      ),
                      child: const Text('Đăng nhập',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        logout();
                      }
                  ),
                ],
              ),
            ),
          )
      );
    }
    else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: const UIText(
              text: "Đã có lỗi xảy ra, vui lòng kiểm tra kết nối internet và thử lại!",
              textColor: Colors.black,
              textFontSize:fontLarge,
              isBold: false,
            ),
            content: Container(
              height: 60,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      height: 60,
                      minWidth: (MediaQuery.of(context).size.width-80)/2,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black,width: 0.1)
                      ),
                      child: const Text('Đăng nhập',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        logout();
                      }
                  ),
                ],
              ),
            ),
          ));
    }*/
    Navigator.of(context).pop();
  }
}
