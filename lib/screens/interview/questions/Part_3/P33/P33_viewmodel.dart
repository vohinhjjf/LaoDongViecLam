import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P33ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P33ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P33Back() async {
    NavigationServices.instance.navigateToP31_32(context);
  }

  void P33Next(thongTinThanhVienModel data) async {
    _executeDatabase.updateC00("SET c30_A = ?, c30_B = ?, c30_C = ?, c30_D = ?, "
        "c30_E = ?, c30_F = ?, c30_G = ?, c30_H = ?, c30_I = ?, c30_IK = ?, "
        "c30A = ?, c31= ?, c31K = ? WHERE idho = ? AND idtv = ?",
        [data.c30_A,data.c30_B,data.c30_C,data.c30_D,data.c30_E,data.c30_F,data.c30_G,
          data.c30_H,data.c30_I,data.c30_IK,data.c30A,data.c31,data.c31K,data.idho,data.idtv]);
    NavigationServices.instance.navigateToP36_37(context);
  }
}