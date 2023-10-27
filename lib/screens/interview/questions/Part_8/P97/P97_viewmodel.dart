import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P97ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P97ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P97Back() async {
    NavigationServices.instance.navigateToP96(context);
  }

  void P97Next(DichVuTaiChinhModel data) async {
    _executeDatabase.update("SET c97_A = ${data.c97_A}, c97_B = ${data.c97_B}, "
        "c97_C = ${data.c97_C}, c97_D = ${data.c97_D}, c97_E = ${data.c97_E}, "
        "c97_F = ${data.c97_F}, c97_G = ${data.c97_G}, c97_H = ${data.c97_H}, "
        "c97_I = ${data.c97_I}, c97_J = ${data.c97_J} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP98(context);
  }
}