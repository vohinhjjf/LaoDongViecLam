import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/models/area_model.dart';

import '../../../base/base_viewmodel.dart';
import '../../../components/navigation/navigation_service.dart';
import '../../../data/shared_preferences/spref_app_model.dart';
import '../../../models/bangke_model.dart';
import '../../../services/sqlite/execute_database.dart';

class AreaViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  AreaViewModel(this._sPrefAppModel, this._executeDatabase);
  List<AreaModel> list_area = [];
  List<BangKeCsModel> list_household = [];
  String? userName, month;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    userName = _sPrefAppModel.userModel.userName;
    month = _sPrefAppModel.month;
    getArea();
  }

  getArea() async {
    String month = await _sPrefAppModel.month;
    int namDT = DateTime.now().year;
    print("$month , $namDT");
    await _executeDatabase.getArea(int.parse(month), namDT).then((value1) async {
      list_area = value1;
    });
    QueryBangke();
  }

  QueryBangke() async {
    int thangdt = int.parse(_sPrefAppModel.month);
    String condition = "";
    int namdt = DateTime.now().year;
    if ((thangdt == 1 || thangdt == 2 || thangdt == 3) && namdt == 2023) {
      condition = "(trangThai_BK == 1 OR trangThai_BK == 5 OR trangThai_BK == 6) AND (nhom = 9 OR nhom = 10 OR nhom = 13 OR nhom = 14) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 4 || thangdt == 5 || thangdt == 6) && namdt == 2023) {
      condition = "(trangThai_BK == 1 OR trangThai_BK == 5 OR trangThai_BK == 6) AND (nhom = 10 OR nhom = 11 OR nhom = 14 OR nhom = 15) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 7 || thangdt == 8 || thangdt == 9) && namdt == 2023) {
      condition = "(trangThai_BK == 1 OR trangThai_BK == 5 OR trangThai_BK == 6) AND (nhom = 11 OR nhom = 12 OR nhom = 15 OR nhom = 16) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 10 || thangdt == 11 || thangdt == 12) && namdt == 2023) {
      condition = "(trangThai_BK == 1 OR trangThai_BK == 5 OR trangThai_BK == 6) AND (nhom = 12 OR nhom = 13 OR nhom = 16 OR nhom = 17) AND thangDT = $thangdt AND namDT = $namdt";
    }
    await _executeDatabase.getHouseHold(condition).then((value) => list_household= value);
  }

  AreaNext(String iddb) async {
    await _sPrefAppModel.setIDDB(iddb);
    NavigationServices.instance.navigateToInterviewStatus(context);
  }

  void AreaBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }
}