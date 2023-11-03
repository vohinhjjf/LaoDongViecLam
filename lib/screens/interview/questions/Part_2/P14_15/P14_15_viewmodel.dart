import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P14_15ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P14_15ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P14_15Back() async {
    NavigationServices.instance.navigateToP13(context);
  }

  void P14_15Next(thongTinThanhVienModel data) async {
    await _executeDatabase.update("SET c12 = ${data.c12}, c13 = ${data.c13} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c13 == 1){
      await _executeDatabase.update("SET c14A = ${data.c14A}, c14B = ${data.c14B}"
          ", c14C = ${data.c14C}, c14D = ${data.c14D}, c14E = ${data.c14E}, "
          "c14F = ${data.c14F}, c15A = '', c15C = '' "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP18(context);
    }else {
      NavigationServices.instance.navigateToP16(context);
    }
  }
}