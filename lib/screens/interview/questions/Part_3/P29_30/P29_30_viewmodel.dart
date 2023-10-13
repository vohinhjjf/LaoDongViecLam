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
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP31_32(context);
    }
  }
}