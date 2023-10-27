import 'package:flutter/material.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P39_42ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P39_42ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P39_42Back(thongTinThanhVienModel thanhVienModel) async {
    if(thanhVienModel.c17 == 1){
      NavigationServices.instance.navigateToP19(context);
    }
    else if (thanhVienModel.c25 == 4){
      NavigationServices.instance.navigateToP27(context);
    }
    else if (thanhVienModel.c26 == 1 || thanhVienModel.c26 == 2){
      NavigationServices.instance.navigateToP28(context);
    }
    else /*if (thanhVienModel.c27 == 2 || thanhVienModel.c28 == 1)*/{
      NavigationServices.instance.navigateToP29_30(context);
    }
  }

  void P39_42Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c34 = '${data.c34}', c35A = '${data.c35A}', "
        "c36 = '${data.c36}', c37A = '${data.c37A}' "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP43(context);
  }
}