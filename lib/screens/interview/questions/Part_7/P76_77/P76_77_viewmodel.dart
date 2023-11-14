import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P76_77ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P76_77ViewModel(this._executeDatabase, this._sPrefAppModel);
  var doisongho = DoiSongHoModel();
  var thanhvien = thongTinThanhVienModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getDoiSongHo(idho).then((value) {
      doisongho = value;
    });
    await _executeDatabase.getListTTTV(idho).then((value) {
      thanhvien = value.firstWhere((e) => e.c01 == 1);
    });
  }

  void P76_77Back() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getListTTTV(idho).then((value) {
      var thongtinTV = thongTinThanhVienModel();
      if(value.length > 1 && value.last.c01 == 1) {
        thongtinTV = value[value.length - 2];
      } else {
        thongtinTV = value.last;
      }
      _sPrefAppModel.setIDTV(thongtinTV.idtv!);
      if (thongtinTV.c04! < 15) {
        NavigationServices.instance.navigateToP70_75(context);
      } else if (thongtinTV.c05! == 2) {
        NavigationServices.instance.navigateToP06_07(context);
      } else {
        NavigationServices.instance.navigateToP70_75(context);
      }
    });
  }

  void P76_77Next(DoiSongHoModel data) async {
    await _executeDatabase.updateDSH(
        "SET c62_M1 = ?, c62_M2 = ? "
            "WHERE idho = ? AND thangDT = ? AND namDT = ?",
        [data.c62_M1,data.c62_M2,data.idho,data.thangDT,data.namDT]);
    if(data.c62_M2 == 3) {
      NavigationServices.instance.navigateToP78(context);
    } else {
      _executeDatabase.updateDSH("SET c62_M3A = ?, c62_M3B = ?, c62_M3C = ?, "
          "c62_M3D = ?, c62_M3E = ?, c62_M3F = ?, c62_M3G = ?, c62_M3H = ?, "
          "c62_M3I = ?, c62_M3IK = ? WHERE idho = ? AND thangDT = ? AND namDT = ?",
          [data.c62_M3A,data.c62_M3B,data.c62_M3C,data.c62_M3D,data.c62_M3E,data.c62_M3F,
            data.c62_M3G,data.c62_M3H,data.c62_M3I,data.c62_M3IK,data.idho,data.thangDT,data.namDT]);
      NavigationServices.instance.navigateToP79(context);
    }
  }
}