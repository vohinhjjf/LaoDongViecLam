import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P98ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P98ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P98Back() async {
    NavigationServices.instance.navigateToP97(context);
  }

  void P98Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c98_A = ${data.c98_A}, c98_B = ${data.c98_B}, "
        "c98_C = ${data.c98_C}, c98_D = ${data.c98_D}, c98_E = ${data.c98_E}, "
        "c98_F = ${data.c98_F}, c98_G = ${data.c98_G}, c98_H = ${data.c98_H}, "
        "c98_I = ${data.c98_I} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP99(context);
  }
}