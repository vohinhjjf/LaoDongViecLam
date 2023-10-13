import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P28ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P28ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P28Back(int? c24) async {
    if(c24 == 1){
      NavigationServices.instance.navigateToP26(context);
    }else {
      NavigationServices.instance.navigateToP27(context);
    }
  }

  void P28Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c26 = ${data.c26} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c26 == 1 || data.c26 == 2){
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP29_30(context);
    }
  }
}