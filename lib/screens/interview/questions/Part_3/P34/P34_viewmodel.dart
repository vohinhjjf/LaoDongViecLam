import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P34ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P34ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P34Back() async {
    NavigationServices.instance.navigateToP31_32(context);
  }

  void P34Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c30A = ${data.c30A} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c30A == 2){
      NavigationServices.instance.navigateToP38(context);
    }else {
      NavigationServices.instance.navigateToP35(context);
    }
  }
}