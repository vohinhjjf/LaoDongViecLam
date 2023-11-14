import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P20_22ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P20_22ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P20_22Back() async {
    NavigationServices.instance.navigateToP19(context);
  }

  void P20_22Next(thongTinThanhVienModel data) async {
    _executeDatabase.updateC00("SET c18 = ?, c19 = ?, c20 = ? WHERE idho = ? AND idtv = ?",
        [data.c18,data.c19,data.c20,data.idho,data.idtv]);

    if(data.c18 == 1 || data.c19 ==1){
      _executeDatabase.updateC00("SET c21 = ?, c21K = ?, c22 = ?, c23 = ?, c24 = ? WHERE idho = ? AND idtv = ?",
          [data.c21,data.c21K,data.c22,data.c23,data.c24,data.idho,data.idtv]);
      NavigationServices.instance.navigateToP27(context);
    }
    else if(data.c20 == 2){
      _executeDatabase.updateC00("SET c21 = ?, c21K = ?, c22 = ?, c23 = ? WHERE idho = ? AND idtv = ?",
          [data.c21,data.c21K,data.c22,data.c23,data.idho,data.idtv]);
      NavigationServices.instance.navigateToP26(context);
    }
    else {
      NavigationServices.instance.navigateToP23(context);
    }
  }
}