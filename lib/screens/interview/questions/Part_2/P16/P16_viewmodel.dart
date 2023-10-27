import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P16ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P16ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P16Back() async {
    NavigationServices.instance.navigateToP14_15(context);
  }
  void P16Next(thongTinThanhVienModel data) async {
    await _executeDatabase.update("SET c14A = ${data.c14A}, c14B = ${data.c14B}"
        ", c14C = ${data.c14C}, c14D = ${data.c14D}, c14E = ${data.c14E}, c14F = ${data.c14F} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c14A == 1 || data.c14B == 1 || data.c14C == 1 ||data.c14D == 1 || data.c14E == 1 || data.c14F == 1) {
      NavigationServices.instance.navigateToP17(context);
    } else {
      await _executeDatabase.update("SET c15A = ${null}, c15B = ${null}, c15C = ${null} "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP18(context);
    }
  }
}