import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P19ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P19ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P19Back(thongTinThanhVienModel data) async {
    if(data.c15C != null){
      NavigationServices.instance.navigateToP17(context);
    } else {
      NavigationServices.instance.navigateToP18(context);
    }
  }

  void P19Next(thongTinThanhVienModel data) async {
     _executeDatabase.updateC00("SET c17 = ? WHERE idho = ? AND idtv = ?",
        [data.c17,data.idho,data.idtv]);
    if(data.c17 == 1){
       _executeDatabase.updateC00("SET c18 = ?, c19 = ?, "
          "c20 = ?, c21 = ?, c21K = ?, c22 = ?, c23 = ?, c24 = ?, c25 = ?, "
          "c26 = ?, c27 = ?, c28 = ?, c29 = ?, c30 = ?, c30_A = ?, c30_B = ?, "
          "c30_C = ?, c30_D = ?, c30_E = ?, c30_F = ?, c30_G = ?, c30_H = ?, "
          "c30_I = ?, c30_IK = ?, c30A = ?, c31= ?, c31K = ?, c32 = ?, "
          "c33 = ?, c33A = ?, c33AK = ? WHERE idho = ? AND idtv = ?",
          [data.c18,data.c19,data.c20,data.c21,data.c21K,data.c22,data.c23,data.c24,
            data.c25,data.c26,data.c27,data.c28,data.c29,data.c30,data.c30_A,data.c30_B,
            data.c30_C,data.c30_D,data.c30_E,data.c30_F,data.c30_G,data.c30_H,data.c30_I,data.c30_IK,
            data.c30A,data.c31,data.c31K,data.c32,data.c33,data.c33A,data.c33AK,data.idho,data.idtv]);
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP20_22(context);
    }
  }
}