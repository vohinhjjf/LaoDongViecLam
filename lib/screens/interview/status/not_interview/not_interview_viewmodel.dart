import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class NotInterviewedViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  NotInterviewedViewModel(this._sPrefAppModel, this._executeDatabase);
  List<BangKeCsModel> data = [];

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    //fetchData();
  }

  /*void fetchData() async {
    await _executeDatabase.getDanhSachBangKeCs(1, '').then((value) => data= value);
  }

  Future<List<BangKeCsModel>> searchData(String name) =>
      _executeDatabase.getDanhSachBangKeCs(1, name);*/

  void notInterviewed(BangKeCsModel bangKeCsModel) async {
    /*List<PhieuTonGiaoModel> listPhieuModel = [];
    listPhieuModel.add(PhieuTonGiaoModel(
        id: bangKeCsModel.id!,
        maCS: bangKeCsModel.maCS!,
        tenCS: bangKeCsModel.tenCS!,
        tinh: bangKeCsModel.tinh!,
        huyen: bangKeCsModel.huyen!,
        xa: bangKeCsModel.xa!,
        thon: bangKeCsModel.diaChi!,
        dienThoai: bangKeCsModel.dienThoai!,
        email: bangKeCsModel.email!,
        tinhtrang_DT: 1
    ));
    await _executeDatabase.setListPhieu(listPhieuModel).then((value) async {
      await _executeDatabase.setTinhTrangDT(2, bangKeCsModel.id!);
      await _sPrefAppModel.setIdCs(bangKeCsModel.id!);
      await _executeDatabase.setTimeBD(DateTime.now().toString(), bangKeCsModel.id!);
    });*/
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void notInterviewedBack() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}