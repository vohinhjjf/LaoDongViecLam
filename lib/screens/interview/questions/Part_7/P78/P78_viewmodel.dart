import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P78ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P78ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P78Back() async {
    NavigationServices.instance.navigateToP76_77(context);
  }

  void P78Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M3A = ${data.c62_M3A}, c62_M3B = ${data.c62_M3B}, "
        "c62_M3C = ${data.c62_M3C}, c62_M3D = ${data.c62_M3D}, c62_M3E = ${data.c62_M3E}, "
        "c62_M3F = ${data.c62_M3F}, c62_M3G = ${data.c62_M3G}, c62_M3H = ${data.c62_M3H}, "
        "c62_M3I = ${data.c62_M3I}, c62_M3IK = ${data.c62_M3IK} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP79(context);
  }
}