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
    String month = _sPrefAppModel.month;
    await _executeDatabase.getArea(month).then((value1) async {
      list_area = value1;
      await _executeDatabase.getHouseHold(list_area[0].iddb!).then((value2) {
        list_household = value2;
      });
    });
  }

  void AreaNext(String iddb) {
    _sPrefAppModel.setIDDB(iddb);
    NavigationServices.instance.navigateToInterviewStatus(context);
  }

  void AreaBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }
}