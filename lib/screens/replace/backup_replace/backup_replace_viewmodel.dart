import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';
import '../../../components/uis.dart';
import '../../../services/api/sync_services.dart';

class BackupReplaceViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  BackupReplaceViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);
  List<BangKeCsModel> data = [];

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String iddb = _sPrefAppModel.IDDB;
    int thangdt = int.parse(_sPrefAppModel.month);
    int namdt = DateTime.now().year;
    String condition = "iddb = $iddb AND HoDuPhong = 1 AND nhom = 99 AND thangDT = $thangdt AND namDT = $namdt";
    await _executeDatabase.getHouseHold(condition).then((value) => data= value);
  }

  Future<List<BangKeCsModel>> searchData(String name) async {
    String iddb = _sPrefAppModel.IDDB;
    int thangdt = int.parse(_sPrefAppModel.month);
    int namdt = DateTime.now().year;
    String condition = "iddb = $iddb AND HoDuPhong = 1 AND nhom = 99 AND thangDT = $thangdt AND namDT = $namdt AND tenChuHo LIKE '$name%'";

    return _executeDatabase.getHouseHold(condition);
  }

  void BackupReplace(BangKeCsModel hoDuPhong) async {
    List<BangKeCsModel> list = [];
    String token = _sPrefAppModel.accessToken;
    int thangdt = await int.parse(_sPrefAppModel.month);
    String iddb = _sPrefAppModel.IDDB;
    String condition = "";
    int namdt = DateTime.now().year;
    if ((thangdt == 1 || thangdt == 2 || thangdt == 3) && namdt == 2023) {
      condition = "iddb = $iddb AND (nhom = 9 OR nhom = 10 OR nhom = 13 OR nhom = 14) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 4 || thangdt == 5 || thangdt == 6) && namdt == 2023) {
      condition = "iddb = $iddb AND (nhom = 10 OR nhom = 11 OR nhom = 14 OR nhom = 15) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 7 || thangdt == 8 || thangdt == 9) && namdt == 2023) {
      condition = "iddb = $iddb AND (nhom = 11 OR nhom = 12 OR nhom = 15 OR nhom = 16) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 10 || thangdt == 11 || thangdt == 12) && namdt == 2023) {
      condition = "iddb = $iddb AND (nhom = 12 OR nhom = 13 OR nhom = 16 OR nhom = 17) AND thangDT = $thangdt AND namDT = $namdt";
    }
    await _executeDatabase.getHouseHold(condition).then((value) => list = value);
    print('${hoDuPhong.namDT}, ${hoDuPhong.thangDT}');
    BangKeCsModel hoBiThay = list.where((e) => e.idho == _sPrefAppModel.getIdHo
        && e.thangDT == hoDuPhong.thangDT && e.namDT == hoDuPhong.namDT).first;
    List<Map<String, dynamic>> data = [
      {
        "idho": hoDuPhong.idho!,
        "tenChuHo": hoDuPhong.tenChuHo!,
        "diaChi": hoDuPhong.diaChi!,
        "tsKhau": hoDuPhong.tsKhau!,
        "tsNu": hoDuPhong.tsNu!,
        "trangthai": hoDuPhong.trangthai!,
        "hoDuPhong": 0,
        "nhom": hoBiThay.nhom!,
        "thangDT":hoDuPhong.thangDT!,
        "namDT": hoDuPhong.namDT!,
      },
      {
        "idho": hoBiThay.idho!,
        "tenChuHo": hoBiThay.tenChuHo!,
        "diaChi": hoBiThay.diaChi!,
        "tsKhau": hoBiThay.tsKhau!,
        "tsNu": hoBiThay.tsNu!,
        "trangthai": hoBiThay.trangthai!,
        "hoDuPhong": 1,
        "nhom": hoBiThay.nhom!,
        "thangDT":hoBiThay.thangDT!,
        "namDT": hoBiThay.namDT!,
      }
    ];

    await _syncServices.ThayTheHo(token, data, _executeDatabase).then((value) {
      if(value == 2) {
        _sPrefAppModel.setIdHo(hoDuPhong.idho!);
        NavigationServices.instance.navigateToOperatingStatus(context);
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              Future.delayed(const Duration(seconds: 2), () => {
                Navigator.of(context).pop()
              });
              return AlertDialog(
                titlePadding: const EdgeInsets.all(20),
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: const UIText(
                  text:
                  'Thay hộ thất bại',
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  isBold: false,
                  textAlign: TextAlign.center,
                ),
              );
            });
      }
    });
  }

  void BackupReplaceBack() async {
    NavigationServices.instance.navigateToHouseHoldReplace(context);
  }
}