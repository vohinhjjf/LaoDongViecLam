import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P61_62ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P61_62ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P61_62Back() async {
    NavigationServices.instance.navigateToP60(context);
  }

  void P61_62Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c55 = ${data.c55}, c56 = ${data.c56} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c56 == 2){
      _executeDatabase.update("SET c57 = ${data.c57.toString()}, c58 = ${data.c58.toString()} "
          "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
      NavigationServices.instance.navigateToP65_66(context);
    } else {
      NavigationServices.instance.navigateToP63_64(context);
    }
  }
}