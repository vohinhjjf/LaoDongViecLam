import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P96ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P96ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  var list_p96 = [0,0,0,0,0,0,0,0];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    list_p96 = [0,0,0,0,0,0,0,0];
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.getTTTV(idho, idtv).then((value) {
      thanhvien = value;
      if(value.c96 != null) {
        logicProcessing(value.c96 ?? "");
      }
    });
  }

  logicProcessing(String data){
    var list_data = data.split(',');
    for (int i = 0; i < list_p96.length; i++) {
      for(int j = 0; j < list_data.length; j ++){
        if(int.parse(list_data[j]) - 1 == i){
          list_p96[i] = int.parse(list_data[j]);
        }
      }
    }
  }

  void P96Back() async {
    NavigationServices.instance.navigateToP95(context);
  }

  void P96Next(thongTinThanhVienModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.update("SET c96 = '${data.c96}', c96K = '${data.c96K}' "
        "WHERE idho = ${idho} AND idtv = ${idtv}");
    NavigationServices.instance.navigateToP97(context);
  }
}