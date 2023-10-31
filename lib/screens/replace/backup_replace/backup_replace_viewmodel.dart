import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class BackupReplaceViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  BackupReplaceViewModel(this._sPrefAppModel, this._executeDatabase);
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

  void BackupReplace(BangKeCsModel bangKeCsModel) async {
    await _executeDatabase.updateHoDuPhong(_sPrefAppModel.getNhom, 1, bangKeCsModel.idho!, bangKeCsModel.thangDT!, bangKeCsModel.namDT!);
    await _executeDatabase.updateHoDuPhong(99, 0, _sPrefAppModel.getIdHo, bangKeCsModel.thangDT!, bangKeCsModel.namDT!);
    await _sPrefAppModel.setIdHo(bangKeCsModel.idho!);
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void BackupReplaceBack() async {
    NavigationServices.instance.navigateToHouseHoldReplace(context);
  }
}