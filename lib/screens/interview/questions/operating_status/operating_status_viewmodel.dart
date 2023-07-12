
import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class OperatingStatusViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  OperatingStatusViewModel(this._sPrefAppModel, this._executeDatabase);
  int status = 1;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    //fetchData();
  }

  /*void fetchData() async {
    String id = await _sPrefAppModel.getIdCs;
    await _executeDatabase.getTinhTrangCs(id).then((value) => status = value);
  }*/

  void operatingStatus(int status) {
    //String id = await _sPrefAppModel.getIdCs;
    //_executeDatabase.setTinhTrangCs(status, id);
    if(status == 1) {
      _executeDatabase.setHo(thongTinHoModel(idho: "99991001003",
          hoSo: "003"));
    }else {
      //_executeDatabase.setTinhTrangDT(9, id);
      NavigationServices.instance.navigateToInterviewStatus(context);
    }
    NavigationServices.instance.navigateToHouseHold(context);
  }

  void operatingStatusBack() {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}