import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P38ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P38ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P38Back(thongTinThanhVienModel data) async {
    if(data.c30A == 2){
      NavigationServices.instance.navigateToP34(context);
    } else {
      NavigationServices.instance.navigateToP36_37(context);
    }
  }

  void P38Next(thongTinThanhVienModel data) async {
    await _executeDatabase.update("SET c33A = ${data.c33A}, c33AK = '${data.c33AK}', "
        "c34 = ${data.c34.toString()}, c35A = ${data.c35A.toString()}, "
        "c36 = ${data.c36.toString()}, c37A = ${data.c37A.toString()}, "
        "c38 = ${data.c38}, c39 = ${data.c39}, c40 = ${data.c40.toString()}, "
        "c40A = ${data.c40A}, c41 = ${data.c41}, c42 = ${data.c42.toString()}, "
        "c43 = ${data.c43}, c44 = ${data.c44}, c45 = ${data.c45}, c46 = ${data.c46}, "
        "c47 = ${data.c47}, c48 = ${data.c48}, c49 = ${data.c49.toString()}, "
        "c50A = ${data.c50A.toString()}, c51 = ${data.c51.toString()}, "
        "c52A = ${data.c52A.toString()}, c53 = ${data.c53.toString()}, "
        "c54 = ${data.c54}, c55 = ${data.c55.toString()}, c56 = ${data.c56}, "
        "c57= ${data.c57.toString()}, c58 = ${data.c58.toString()}, "
        "c59 = ${data.c59.toString()}, c60 = ${data.c60}, c61 = ${data.c61}, "
        "c62 = ${data.c62} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP69(context);
  }
}