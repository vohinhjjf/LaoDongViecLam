import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P65_66ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P65_66ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  replaceQuestion(int index){
    switch(index){
      case 0: NavigationServices.instance.navigateToP44_46(context);break;
      case 1: NavigationServices.instance.navigateToP48_49(context);break;
      case 2: NavigationServices.instance.navigateToP55_59(context);break;
      case 3: NavigationServices.instance.navigateToP61_62(context);break;
      case 4: NavigationServices.instance.navigateToP63_64(context);break;
    }
  }

  void P65_66Back(thongTinThanhVienModel data) async {
    if(data.c48 == 2){
      NavigationServices.instance.navigateToP52_54(context);
    } else if(data.c56 == 2){
      NavigationServices.instance.navigateToP61_62(context);
    }
    else {
      NavigationServices.instance.navigateToP63_64(context);
    }
  }

  void P65_66Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c59 = ${data.c59}, c60 = ${data.c60} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP67_68(context);
  }
}