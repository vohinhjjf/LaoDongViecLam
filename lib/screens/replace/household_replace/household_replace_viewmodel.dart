import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class HouseholdReplaceViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  HouseholdReplaceViewModel(this._sPrefAppModel, this._executeDatabase);
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
    String condition = "";
    if ((thangdt == 1 || thangdt == 2 || thangdt == 3) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (trangThai_BK == 2 OR trangThai_BK == 3 OR trangThai_BK == 4) AND (nhom = 9 OR nhom = 10 OR nhom = 13 OR nhom = 14) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 4 || thangdt == 5 || thangdt == 6) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (trangThai_BK == 2 OR trangThai_BK == 3 OR trangThai_BK == 4) AND (nhom = 10 OR nhom = 11 OR nhom = 14 OR nhom = 15) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 7 || thangdt == 8 || thangdt == 9) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (trangThai_BK == 2 OR trangThai_BK == 3 OR trangThai_BK == 4) AND (nhom = 11 OR nhom = 12 OR nhom = 15 OR nhom = 16) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 10 || thangdt == 11 || thangdt == 12) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (trangThai_BK == 2 OR trangThai_BK == 3 OR trangThai_BK == 4) AND (nhom = 12 OR nhom = 13 OR nhom = 16 OR nhom = 17) AND thangDT = $thangdt AND namDT = $namdt";
    }
    await _executeDatabase.getHouseHold(condition).then((value) => data = value);
  }

  Future<List<BangKeCsModel>> searchData(String name) async {
    String iddb = _sPrefAppModel.IDDB;
    int thangdt = int.parse(_sPrefAppModel.month);
    int namdt = DateTime.now().year;
    String condition = "iddb = $iddb AND HoDuPhong = 0 AND (trangThai_BK == 2 OR trangThai_BK == 3 OR trangThai_BK == 4) AND thangDT = $thangdt AND namDT = $namdt AND tenChuHo LIKE '$name%'";

    return _executeDatabase.getHouseHold(condition);
  }

  void HouseholdReplaceNext(int nhom, String idho) async {
    await _sPrefAppModel.setIdHo(idho);
    await _sPrefAppModel.setNhom(nhom);
    NavigationServices.instance.navigateToBackupReplace(context);
  }

  void HouseholdReplaceBack() async {
    NavigationServices.instance.navigateToAreaReplace(context);
  }
}