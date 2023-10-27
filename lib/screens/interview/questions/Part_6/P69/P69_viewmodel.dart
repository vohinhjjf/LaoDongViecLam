import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P69ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P69ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P69Back(thongTinThanhVienModel data) async {
    if(thanhvien.c33A == 1||thanhvien.c33A == 2||thanhvien.c33A == 3||
        thanhvien.c33A == 4||thanhvien.c33A == 5||thanhvien.c33A == 6){
      NavigationServices.instance.navigateToP38(context);
    } else {
      NavigationServices.instance.navigateToP67_68(context);
    }
  }

  void P69Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c63 = ${data.c63} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP70_75(context);
  }
}