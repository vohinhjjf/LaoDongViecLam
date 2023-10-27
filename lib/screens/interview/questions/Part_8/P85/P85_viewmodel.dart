import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P85ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P85ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P85Back() async {
    NavigationServices.instance.navigateToP84(context);
  }

  void P85Next(DichVuTaiChinhModel data) async {
    _executeDatabase.update("SET c85_A = ${data.c85_A}, c85_B = ${data.c85_B}, "
        "c85_C = ${data.c85_C}, c85_D = ${data.c85_D}, c85_E = ${data.c85_E}, "
        "c85_F = ${data.c85_F}, c85_G = ${data.c85_G}, c85_H = ${data.c85_H}, "
        "c85_I = ${data.c85_I} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP86_87(context);
  }
}