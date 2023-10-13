import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P08_09ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P08_09ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P08_09Back() async {
    NavigationServices.instance.navigateToP06_07(context);
  }

  void P08_09Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c07 = ${data.c07}, c08 = ${data.c08} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c08 == 5){
      NavigationServices.instance.navigateToP13(context);
    }else {
      NavigationServices.instance.navigateToP10_12(context);
    }
  }
}