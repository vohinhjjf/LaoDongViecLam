import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P52_54ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P52_54ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P52_54Back() async {
    NavigationServices.instance.navigateToP50_51(context);
  }

  void P52_54Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c46 = ${data.c46}, c47 = ${data.c47}, c48 = ${data.c48} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c48 == 2){
      _executeDatabase.update("SET c49 = ${data.c49.toString()}, c50A = ${data.c50A.toString()}, "
          "c51 = ${data.c51.toString()}, c52A = ${data.c52A.toString()}, "
          "c53 = ${data.c53}, c54 = ${data.c54}, c55 = ${data.c55.toString()}, "
          "c56 = ${data.c56}, c57 = ${data.c57.toString()}, c58 = ${data.c58.toString()}, "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP65_66(context);
    } else {
      NavigationServices.instance.navigateToP55_59(context);
    }
  }
}