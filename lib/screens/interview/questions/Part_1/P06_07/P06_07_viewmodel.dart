import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P06_07ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P06_07ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();

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

  void P06_07Back(int? c04A) async {
    if(c04A == null ){
      NavigationServices.instance.navigateToP01_04(context);
    }else {
      NavigationServices.instance.navigateToP05(context);
    }
  }

  void P06_07Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c05 = ${data.c05}, c06 = ${data.c06} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP08_09(context);
  }
}