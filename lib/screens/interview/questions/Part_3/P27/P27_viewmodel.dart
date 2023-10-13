import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P27ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P27ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P27Back(thongTinThanhVienModel thanhVienModel) async {
    if(thanhVienModel.c18 == 1 || thanhVienModel.c19 == 1){
      NavigationServices.instance.navigateToP20_22(context);
    }
    else if(thanhVienModel.c21 == 4){
      NavigationServices.instance.navigateToP23(context);
    }
    else {
      NavigationServices.instance.navigateToP24_25(context);
    }
  }

  void P27Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c25 = ${data.c25} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c25 == 4){
      NavigationServices.instance.navigateToP39_42(context);
    }else {
      NavigationServices.instance.navigateToP28(context);
    }
  }
}