import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P15ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P15ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P15Back() async {
    NavigationServices.instance.navigateToP13_14(context);
  }

  void P15Next(thongTinThanhVienModel data) async {
    _executeDatabase.updateC00("SET c13 = ? WHERE idho = ? AND idtv = ?",
        [data.c13,data.idho,data.idtv]);
    if(data.c13 == 1){
      _executeDatabase.updateC00("SET c14A = ?, c14B = ?, c14C = ?, c14D = ?, "
          "c14E = ?, c14F = ?, c15A = ?, c15C = ? WHERE idho = ? AND idtv = ?",
          [data.c14A,data.c14B,data.c14C,data.c14D,data.c14E,data.c14F,data.c15A,data.c15C,data.idho,data.idtv]);
      NavigationServices.instance.navigateToP18(context);
    }else {
      NavigationServices.instance.navigateToP16(context);
    }
  }
}