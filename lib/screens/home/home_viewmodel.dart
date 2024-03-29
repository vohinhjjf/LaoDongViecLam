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
import '../../models/bangke_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class HomeViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  HomeViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  Future<void> updateBangke() async {
    String thangDT = await _sPrefAppModel.month;
    int namDT = DateTime.now().year;
    final fetchResponse =
    await _syncServices.fetchHouseHold(_sPrefAppModel.accessToken, thangDT);
    if (fetchResponse.toString().isNotEmpty) {
      List listBangKeServer = fetchResponse != null
          ? fetchResponse.map((c) => BangKeCsModel.fromJson(c)).toList()
          : [];

      for (int i = 0; i < listBangKeServer.length; i++) {
        await _executeDatabase.updateHoDuPhong(
            listBangKeServer[i].nhom,
            listBangKeServer[i].hoDuPhong,
            listBangKeServer[i].idho,
            int.parse(thangDT),
            namDT);
      }
    }
  }


  void interview() async {
    updateBangke().then((value) {
      print("object");
      NavigationServices.instance.navigateToArea(context);
    });
  }

  void sync() async {
    NavigationServices.instance.navigateToSync(context);
  }

  void progress() async {
    NavigationServices.instance.navigateToProgress(context);
  }

  void areaReplace() async {
    NavigationServices.instance.navigateToAreaReplace(context);
  }

  void download() async {
    await _executeDatabase.deleteDatabase().then((value) {
      _sPrefAppModel.setAccessToken('');
      _sPrefAppModel.setUserName('');
      _sPrefAppModel.setPassWord('');
      _sPrefAppModel.setIdHo("");
      NavigationServices.instance.navigateToLogin(context);
    });
  }

  Future checkUpdateApp() async {
    //mainMenuController.setLoading(true);
    if (Platform.isIOS) {}
    final newVersion = NewVersionPlus(
      //iOSId: AppValues.bundleIdIos,
      androidId: AppValues.bundleIdAndroid, // for test
    );

    VersionStatus? status = await newVersion.getVersionStatus();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    log('----- Check version store --------');
    log('releaseNotes: $appName');
    log('localVersion: $packageName');
    log('storeVersion: $version');
    log('appStoreLink: $buildNumber');
    log('-----+++++++++++++++++++++--------');

    /// True if the there is a more recent version of the app in the store.
    bool isNewVersion = status != null && status.canUpdate;
    //mainMenuController.setLoading(false);

    if (isNewVersion) {
      log('----- Check version store --------');
      log('releaseNotes: ${status.releaseNotes}');
      log('localVersion: ${status.localVersion}');
      log('storeVersion: ${status.storeVersion}');
      log('appStoreLink: ${status.appStoreLink}');
      log('-----+++++++++++++++++++++--------');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: UIText(
              text: 'Đã có phiên bản mới\n'
                  'Chọn "Đồng ý" để cập nhật phiên bản mới nhất (${status.storeVersion})',
              textColor: Colors.black,
              textAlign: TextAlign.center,
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
                      child: const Text('Bỏ qua',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                  ),
                  MaterialButton(
                      height: 60,
                      minWidth: (MediaQuery.of(context).size.width-80)/2,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black,width: 0.1)
                      ),
                      child: const Text('Đồng ý',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        SystemNavigator.pop();
                        //linking.launch(status.appStoreLink);
                        // await getData();
                        // await postData();
                      }
                  )
                ],
              ),
            ),
          )
      );
    } else if (Platform.isIOS && version != '0.0.1') {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: const UIText(
              text: 'Đã có phiên bản mới\n'
                  'Chọn "Đồng ý" để cập nhật phiên bản mới nhất (0.0.1)',
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
                      child: const Text('Bỏ qua',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                  ),
                  MaterialButton(
                      height: 60,
                      minWidth: (MediaQuery.of(context).size.width-80)/2,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black,width: 0.1)
                      ),
                      child: const Text('Đồng ý',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        //linking.launch(AppValues.urlStore);
                        // await getData();
                        // await postData();
                      }
                  )
                ],
              ),
            ),
          )
      );
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: const UIText(
              text: 'update_app_title: '
                  'Bạn đang sử dụng phiên bản mới nhất',
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
                      /*shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black,width: 0.1)
                      ),*/
                      child: const Text('Đóng',
                          style: TextStyle(
                              color: mPrimaryColor, fontSize: fontMedium)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                  ),
                ],
              ),
            ),
          )
      );
    }
  }
}
