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
    _executeDatabase.update("SET c18 = ${data.c18}, c19 = ${data.c19}, c20 = ${data.c20} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c18 == 1 || data.c19 ==1){
      _executeDatabase.update("SET c21 = ${data.c21}, c21K = ${data.c21K.toString()}, c22 = ${data.c22}, "
          "c23 = ${data.c23}, c24 = ${data.c24} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP27(context);
    }
    else if(data.c20 == 2){
      _executeDatabase.update("SET c21 = ${data.c21}, c21K = ${data.c21K.toString()}, c22 = ${data.c22}, "
          "c23 = ${data.c23} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP26(context);
    }
    else {
      NavigationServices.instance.navigateToP23(context);
    }
  }
}