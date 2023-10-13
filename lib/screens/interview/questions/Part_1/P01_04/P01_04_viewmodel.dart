import 'package:flutter/material.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P01_04ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P01_04ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.getTTTV(idho, idtv).then((value) {
      thanhvien = value;
    });
  }

  void P01_04Back() async {
    NavigationServices.instance.navigateToQ7(context);
  }

  void P01_04Next(thongTinThanhVienModel data) async {
    await _executeDatabase.update("SET c00 = '${data.c00}', c01 = ${data.c01}"
        ", c01K = '${data.c01K}', c02 = ${data.c02}, c03A = '${data.c03A}'"
        ", c03B = ${data.c03B}, c04 = ${data.c04} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c04! >= 25 && data.c04! <= 49) {
      NavigationServices.instance.navigateToP05(context);
    } else {
      if(data.c04! >= 15) {
        NavigationServices.instance.navigateToP06_07(context);
      } else {
        NavigationServices.instance.navigateToP93_94(context);
      }
    }
  }
}