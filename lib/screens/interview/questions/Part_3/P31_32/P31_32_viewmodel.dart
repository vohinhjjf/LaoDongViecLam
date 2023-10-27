import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P31_32ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P31_32ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P31_32Back(thongTinThanhVienModel data) async {
    if(data.c24 == 2){
      NavigationServices.instance.navigateToP26(context);
    } else {
      NavigationServices.instance.navigateToP29_30(context);
    }
  }

  void P31_32Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c29 = ${data.c29}, c30 = ${data.c30} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c30 == 2){
      NavigationServices.instance.navigateToP34(context);
    }else {
      NavigationServices.instance.navigateToP33(context);
    }
  }
}