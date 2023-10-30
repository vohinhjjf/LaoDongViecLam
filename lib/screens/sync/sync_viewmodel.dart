import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../models/bangkeThangDT_model.dart';
import '../../models/phieudieutra_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class SyncViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  SyncViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);
  //List<BangKeCsModel> data = [];
  String userName ="";

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
  }

  Future<List<BangKeThangDTModel>> fetchData() async {
    return await _executeDatabase.getDongBo(_sPrefAppModel.month);
  }

  void syncBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }

  Future<String> Dongbo() async {
    String month = await _sPrefAppModel.month;
    List<PhieuDieuTraModel> listphieuDieuTra = [];
    List<BangKeThangDTModel> list_BangKeThangDT = await _executeDatabase.getDongBo(month);
    String token = _sPrefAppModel.accessToken;
    for(int i=0; i < list_BangKeThangDT.length; i++){
      String idho = "${list_BangKeThangDT[i].idhO_BKE}$month";
      listphieuDieuTra.add(PhieuDieuTraModel(
          bangKeThangDT: list_BangKeThangDT[i],
          thongTinHo: await _executeDatabase.getHo(idho),
          thongTinHoNKTT: await _executeDatabase.getHoNKTT(idho),
          lst_thongTinThanhVienNKTT: await _executeDatabase.getNKTT(0, '', idho),
          lst_thongTinThanhVien: await _executeDatabase.getListTTTV(idho),
          DoiSongHo: await _executeDatabase.getDoiSongHo(idho)
      ));
    }
    return await _syncServices.Sync(token, listphieuDieuTra, _executeDatabase);
  }


}