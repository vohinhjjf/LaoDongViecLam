import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P26ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P26ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P26Back(thongTinThanhVienModel thanhVienModel) async {
    if(thanhVienModel.c20 == 2){
      NavigationServices.instance.navigateToP20_22(context);
    }
    else if(thanhVienModel.c21 == 1 || thanhVienModel.c21 == 3){
      NavigationServices.instance.navigateToP23(context);
    }
    else {
      NavigationServices.instance.navigateToP24_25(context);
    }
  }

  void P26Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c24 = ${data.c24} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c24 == 1){
      NavigationServices.instance.navigateToP28(context);
    } else {
      NavigationServices.instance.navigateToP31_32(context);
    }
  }
}