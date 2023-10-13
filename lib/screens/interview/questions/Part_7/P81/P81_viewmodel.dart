import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P81ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P81ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P81Back() async {
    NavigationServices.instance.navigateToP80(context);
  }
  void P81Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M6 = ${data.c62_M6} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c62_M4 == 3) {
      NavigationServices.instance.navigateToP82(context);
    } else {
      NavigationServices.instance.navigateToP83(context);
    }
  }
}