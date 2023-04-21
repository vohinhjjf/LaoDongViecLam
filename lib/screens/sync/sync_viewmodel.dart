import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class SyncViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  SyncViewModel(this._executeDatabase, this._sPrefAppModel, this._syncServices);
  //List<BangKeCsModel> data = [];
  String userName ="";

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
  }

  /*Future<List<BangKeCsModel>> fetchData() async {
    return await _executeDatabase.getDongBo();
  }*/

  void syncBack() {
    NavigationServices.instance.navigateToHome(context);
  }

  /*Future<String> Dongbo() async {
    List<PhieuDieuTraModel> listphieuDieuTra = [];
    List<BangKeCsModel> list_BangKe = await _executeDatabase.getDongBo();
    String token = _sPrefAppModel.accessToken;
    for(int i=0; i<list_BangKe.length; i++){
      listphieuDieuTra.add(PhieuDieuTraModel(
          id: list_BangKe[i].id,
          tenCS_BK: list_BangKe[i].tenCS,
          diaChi_BK: list_BangKe[i].diaChi,
          tinhTrang_DTBK: list_BangKe[i].tinhTrangDT,
          tinhTrang_HDBK: list_BangKe[i].tinhTrangHD,
          phieuTonGiao: await _executeDatabase.getPhieutongiao(
              list_BangKe[i].id!),
          lst_PhieuTonGiao_A43: await _executeDatabase.getListPhieutongiaoA43(
              list_BangKe[i].id!)
      ));
    }
    return await _syncServices.Sync(token, listphieuDieuTra, _executeDatabase);
  }*/


}