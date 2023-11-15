import 'package:flutter/material.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P55_59ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P55_59ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P55_59Back() async {
    NavigationServices.instance.navigateToP52_54(context);
  }

  void P55_59Next(thongTinThanhVienModel data) async {
    _executeDatabase.updateC00("SET c49 = ?, c50A = ?, "
        "c51 = ?, c52A = ?, c53 = ? WHERE idho = ? AND idtv = ?",
        [data.c49, data.c50A, data.c51, data.c52A, data.c53, data.idho, data.idtv]);
    NavigationServices.instance.navigateToP60(context);
  }
}