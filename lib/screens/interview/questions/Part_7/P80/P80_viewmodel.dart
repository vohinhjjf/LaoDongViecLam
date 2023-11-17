import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P80ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P80ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getListTTTV(idho).then((value) {
      thanhvien = value.firstWhere((e) => e.c01 == 1);
    });
    await _executeDatabase.getDoiSongHo(idho).then((value) {
      doisongho = value;
    });
  }

  void P80Back() async {
    NavigationServices.instance.navigateToP79(context);
  }

  void P80Next(DoiSongHoModel data) async {
    await _executeDatabase.updateDSH("SET c62_M5A = ?, c62_M5B = ?, "
        "c62_M5C = ?, c62_M5D = ?, c62_M5E = ?, "
        "c62_M5F = ?, c62_M5G = ?, c62_M5H = ?, "
        "c62_M5I = ?, c62_M5IK = ? "
        "WHERE idho = ? AND thangDT = ? AND namDT = ?",
        [data.c62_M5A,data.c62_M5B,data.c62_M5C,data.c62_M5D,data.c62_M5E,data.c62_M5F,
          data.c62_M5G,data.c62_M5H,data.c62_M5I,data.c62_M5IK,data.idho,data.thangDT,data.namDT]);
    NavigationServices.instance.navigateToP81(context);
  }
}