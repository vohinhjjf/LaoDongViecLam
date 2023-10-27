import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class NotInterviewedViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  NotInterviewedViewModel(this._sPrefAppModel, this._executeDatabase);
  List<BangKeCsModel> data = [];
  List<BangKeThangDTModel> bangKeThangDTModel = [];

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String iddb = _sPrefAppModel.IDDB;
    String month = _sPrefAppModel.month;
    await _executeDatabase.getHouseHold(iddb).then((value) => data= value);
    await _executeDatabase.getBangKe_ThangDT(month).then((value) {
      bangKeThangDTModel= value;
    });
  }

  /*Future<List<BangKeCsModel>> searchData(String name) =>
      _executeDatabase.getDanhSachBangKeCs(1, name);*/

  void notInterviewed(BangKeCsModel bangKeCsModel) async {
    await _sPrefAppModel.setIdHo(bangKeCsModel.idho!);
    await _executeDatabase.getBangKe_ThangDT(_sPrefAppModel.month).then((value) async {
      if(value.where((e) => e.idhO_BKE == bangKeCsModel.idho).isEmpty){
        await _executeDatabase.setTrangThai(
            BangKeThangDTModel(
                idhO_BKE: bangKeCsModel.idho,
                thangDT: int.parse(_sPrefAppModel.month),
                namDT: DateTime.now().year,
                trangThai: 2
            )
        );
      }
    });
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void notInterviewedBack() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}