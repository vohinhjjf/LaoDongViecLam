import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P83ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P83ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P83Back() async {
    NavigationServices.instance.navigateToP82(context);
  }

  void P83Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M8A = ${data.c62_M8A}, c62_M8B = ${data.c62_M8B}, "
        "c62_M8C = ${data.c62_M8C}, c62_M8D = ${data.c62_M8D}, c62_M8E = ${data.c62_M8E}, "
        "c62_M8F = ${data.c62_M8F}, c62_M8FK = ${data.c62_M8FK} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP84(context);
  }
}