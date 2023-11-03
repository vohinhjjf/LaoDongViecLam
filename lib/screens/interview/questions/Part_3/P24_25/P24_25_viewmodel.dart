import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P24_25ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P24_25ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P24_25Back() async {
    NavigationServices.instance.navigateToP23(context);
  }

  void P24_25Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c22 = ${data.c22}, c23 = ${data.c23} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c22 == 1 || data.c23 == 1) {
      _executeDatabase.update("SET c24 = ${data.c24} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP27(context);
    }
    else {
      NavigationServices.instance.navigateToP26(context);
    }
  }
}