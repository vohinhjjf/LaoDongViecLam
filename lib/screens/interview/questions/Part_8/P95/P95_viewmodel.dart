import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P95ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P95ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  var dichVuTaiChinhModel = DichVuTaiChinhModel();

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

  void P95Back() async {
    NavigationServices.instance.navigateToP93_94(context);
  }

  void P95Next(DichVuTaiChinhModel data) async {
    _executeDatabase.update("SET c95 = ${data.c95} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP96(context);
  }
}