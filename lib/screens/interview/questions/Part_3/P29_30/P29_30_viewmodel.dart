import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P29_30ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P29_30ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P29_30Back() async {
    NavigationServices.instance.navigateToP28(context);
  }

  void P29_30Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c27 = ${data.c27}, c28 = ${data.c28} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c27 == 2 || data.c28 == 1){
      _executeDatabase.update("SET c29 = ${data.c29}, c30 = ${data.c30}, "
          "c30_A = ${data.c30_A}, c30_B = ${data.c30_B}, c30_C = ${data.c30_C}, "
          "c30_D = ${data.c30_D}, c30_E = ${data.c30_E}, c30_F = ${data.c30_F}, "
          "c30_G = ${data.c30_G}, c30_H = ${data.c30_H}, c30_I = ${data.c30_I}, "
          "c30_IK = ${data.c30_IK.toString()}, c30A = ${data.c30A}, c31= ${data.c31}, c31K = ${data.c31K.toString()}, "
          "c32 = ${data.c32}, c33 = ${data.c33}, c33A = ${data.c33A}, c33AK = ${data.c33AK.toString()} "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP31_32(context);
    }
  }
}