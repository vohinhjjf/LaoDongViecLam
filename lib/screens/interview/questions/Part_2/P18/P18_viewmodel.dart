import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P18ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P18ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P18Back(int? c13, String? c15A) async {
    if(c13 == 1){
      NavigationServices.instance.navigateToP14_15(context);
    } else if(c15A == null){
      NavigationServices.instance.navigateToP16(context);
    } else {
      NavigationServices.instance.navigateToP17(context);
    }
  }

  void P18Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c16A = ${data.c16A}, c16B = ${data.c16B}, c16C = ${data.c16C} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP19(context);
  }
}