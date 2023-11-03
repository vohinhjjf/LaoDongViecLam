import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P81ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P81ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();

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
    await _executeDatabase.getDoiSongHo(idho).then((value) {
      doisongho = value;
    });
  }

  void P81Back(DoiSongHoModel data) async {
    if(data.c62_M4 != 3) {
      NavigationServices.instance.navigateToP79(context);
    } else {
      NavigationServices.instance.navigateToP80(context);
    }
  }

  void P81Next(DoiSongHoModel data) async {
    await _executeDatabase.updateDSH("SET c62_M6 = ${data.c62_M6} "
        "WHERE idho = ${data.idho} AND thangDT = ${data.thangDT} AND namDT = ${data.namDT}");
    if(data.c62_M4 == 3) {
      NavigationServices.instance.navigateToP82(context);
    } else {
      await _executeDatabase.updateDSH("SET c62_M7A = ${data.c62_M7A}, c62_M7B = ${data.c62_M7B}, "
          "c62_M7C = ${data.c62_M7C}, c62_M7D = ${data.c62_M7D}, c62_M7E = ${data.c62_M7E}, "
          "c62_M7F = ${data.c62_M7F}, c62_M7FK = ${data.c62_M7FK.toString()} "
          "WHERE idho = ${data.idho} AND thangDT = ${data.thangDT} AND namDT = ${data.namDT}");
      NavigationServices.instance.navigateToP83(context);
    }
  }
}