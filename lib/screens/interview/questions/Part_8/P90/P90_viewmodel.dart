import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P90ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P90ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  var dichVuTaiChinhModel = DichVuTaiChinhModel();

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

  void P90Back() async {
    NavigationServices.instance.navigateToP89(context);
  }

  void P90Next(DichVuTaiChinhModel data) async {
    _executeDatabase.update("SET c90_A = ${data.c90_A}, c90_B = ${data.c90_B}, "
        "c90_C = ${data.c90_C}, c90_D = ${data.c90_D}, c90_E = ${data.c90_E}, "
        "c90_F = ${data.c90_F}, c90_G = ${data.c90_G}, c90_H = ${data.c90_H}, "
        "c90_I = ${data.c90_I}, c90_J = ${data.c90_J} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP91_92(context);
  }
}