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
    _executeDatabase.updateC00("SET c07 = ?, c08 = ? WHERE idho = ? AND idtv = ?",
        [data.c07, data.c08,data.idho,data.idtv]);
    if(data.c08 == 5){
      _executeDatabase.updateC00("SET c09 = ?, c09A = ?, c09B = ?, "
          "c10 = ?, c10M = ?, c10_MK = ? WHERE idho = ? AND idtv = ?",
          [data.c09,data.c09A,data.c09B,data.c10,data.c10M,data.c10_MK,data.idho,data.idtv]);
      NavigationServices.instance.navigateToP13_14(context);
    }else {
      NavigationServices.instance.navigateToP10_12(context);
    }
  }
}