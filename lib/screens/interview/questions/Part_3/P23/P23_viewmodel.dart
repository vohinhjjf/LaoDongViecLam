import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P23ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P23ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P23Back() async {
    NavigationServices.instance.navigateToP20_22(context);
  }

  void P23Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c21 = ${data.c21}, c21K = ${data.c21K} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c21 == 1 || data.c21 == 3){
      _executeDatabase.update("SET c22 = ${data.c22}, c23 = ${data.c23} "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP26(context);
    }else if(data.c21 == 4){
      _executeDatabase.update("SET c22 = ${data.c22}, c23 = ${data.c23}, "
          "c24 = ${data.c24} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP27(context);
    }else {
      NavigationServices.instance.navigateToP24_25(context);
    }
  }
}