import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P76_77ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P76_77ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();

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

  void P76_77Back() async {
    NavigationServices.instance.navigateToP70_75(context);
  }

  void P76_77Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M1 = ${data.c62_M1}, c62_M2 = ${data.c62_M2} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    if(data.c62_M2 == 3) {
      NavigationServices.instance.navigateToP78(context);
    } else {
      NavigationServices.instance.navigateToP79(context);
    }
  }
}