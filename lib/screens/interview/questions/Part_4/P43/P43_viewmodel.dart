import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P43ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P43ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P43Back() async {
    NavigationServices.instance.navigateToP39_42(context);
  }

  void P43Next(thongTinThanhVienModel data) async {
    if(data.c38! >= 4 && data.c38! <= 12){
      _executeDatabase.update("SET c38 = ${data.c38}, c39 = ${data.c39} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    } else {
      _executeDatabase.update("SET c38 = ${data.c38} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    }
    NavigationServices.instance.navigateToP44_46(context);
  }
}