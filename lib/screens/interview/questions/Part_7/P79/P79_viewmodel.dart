import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P79ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P79ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P79Back(DoiSongHoModel data) async {
    if(data.c62_M2 != 3) {
      NavigationServices.instance.navigateToP76_77(context);
    } else {
      NavigationServices.instance.navigateToP78(context);
    }
  }
  void P79Next(DoiSongHoModel data) async {
    _executeDatabase.updateDSH("SET c62_M4 = ${data.c62_M4} "
        "WHERE idho = ${data.idho}");
    if(data.c62_M4 == 3) {
      NavigationServices.instance.navigateToP80(context);
    } else {
      NavigationServices.instance.navigateToP81(context);
    }
  }
}