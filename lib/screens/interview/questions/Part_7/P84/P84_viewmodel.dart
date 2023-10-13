import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P84ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P84ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P84Back() async {
    NavigationServices.instance.navigateToP83(context);
  }

  void P84Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c62_M9A = ${data.c62_M9A}, c62_M9B = ${data.c62_M9B}, "
        "c62_M9C = ${data.c62_M9C}, c62_M9D = ${data.c62_M9D}, c62_M9E = ${data.c62_M9E}, "
        "c62_M9EK = ${data.c62_M9EK} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP85(context);
  }
}