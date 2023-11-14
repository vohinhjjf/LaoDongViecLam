import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P13_14ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P13_14ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  var thongtinho = thongTinHoModel();

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
    await _executeDatabase.getHo(idho).then((value) => thongtinho = value);
  }

  void P13_14Back(int? c09) async {
    if(c09 == null){
      NavigationServices.instance.navigateToP08_09(context);
    } else {
      NavigationServices.instance.navigateToP10_12(context);
    }
  }
  void P13_14Next(thongTinThanhVienModel data) {
    _executeDatabase.updateC00("SET c11 = ?, c12 = ? WHERE idho = ? AND idtv = ?",
        [data.c11,data.c12,data.idho,data.idtv]);
    NavigationServices.instance.navigateToP15(context);
  }
}