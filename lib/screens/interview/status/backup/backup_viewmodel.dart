import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class BackupViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  BackupViewModel(this._sPrefAppModel, this._executeDatabase);
  List<BangKeCsModel> data = [];

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String iddb = _sPrefAppModel.IDDB;
    await _executeDatabase.getHouseHold(iddb).then((value) => data= value.where((e) => e.hoDuPhong == 1).toList());
  }

  /*Future<List<BangKeCsModel>> searchData(String name) =>
      _executeDatabase.getDanhSachBangKeCs(1, name);*/

  void Backup() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }

  void BackupBack() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}