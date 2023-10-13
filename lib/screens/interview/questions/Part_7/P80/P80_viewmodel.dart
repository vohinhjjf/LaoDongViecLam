import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P80ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P80ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();

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

  void P80Back() async {
    NavigationServices.instance.navigateToP79(context);
  }

  void P80Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M5A = ${data.c62_M5A}, c62_M5B = ${data.c62_M5B}, "
        "c62_M5C = ${data.c62_M5C}, c62_M5D = ${data.c62_M5D}, c62_M5E = ${data.c62_M5E}, "
        "c62_M5F = ${data.c62_M5F}, c62_M5G = ${data.c62_M5G}, c62_M5H = ${data.c62_M5H}, "
        "c62_M5I = ${data.c62_M5I}, c62_M5IK = ${data.c62_M5IK} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP81(context);
  }
}