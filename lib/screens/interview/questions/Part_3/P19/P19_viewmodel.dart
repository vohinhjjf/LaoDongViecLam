import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P19ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P19ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P19Back(thongTinThanhVienModel data) async {
    if(data.c15A != null){
      NavigationServices.instance.navigateToP17(context);
    } else {
      NavigationServices.instance.navigateToP18(context);
    }
  }

  void P19Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c17 = ${data.c17} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c17 == 1){
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP20_22(context);
    }
  }
}