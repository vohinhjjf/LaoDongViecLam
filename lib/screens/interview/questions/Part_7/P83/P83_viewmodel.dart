import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P83ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P83ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P83Back(DoiSongHoModel data) async {
    if(data.c62_M6 != 3) {
      NavigationServices.instance.navigateToP81(context);
    } else {
      NavigationServices.instance.navigateToP82(context);
    }
  }

  void P83Next(DoiSongHoModel data) async {
    await _executeDatabase.updateDSH("SET c62_M8A = ${data.c62_M8A}, c62_M8B = ${data.c62_M8B}, "
        "c62_M8C = ${data.c62_M8C}, c62_M8D = ${data.c62_M8D}, c62_M8E = ${data.c62_M8E}, "
        "c62_M8F = ${data.c62_M8F}, c62_M8FK = ${data.c62_M8FK.toString()} "
        "WHERE idho = ${data.idho} AND thangDT = ${data.thangDT} AND namDT = ${data.namDT}");
    NavigationServices.instance.navigateToP84(context);
  }
}