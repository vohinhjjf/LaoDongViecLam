import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P17ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P17ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P17Back() async {
    NavigationServices.instance.navigateToP16(context);
  }

  void P17Next(thongTinThanhVienModel data) async {
    _executeDatabase.updateC00("SET c15A = ?, c15C = ?, "
        "c16A = ?, c16B = ?, c16C = ? WHERE idho = ? AND idtv = ?",
        [data.c15A,data.c15C,data.c16A,data.c16B,data.c16C,data.idho,data.idtv]);
    NavigationServices.instance.navigateToP19(context);
  }
}