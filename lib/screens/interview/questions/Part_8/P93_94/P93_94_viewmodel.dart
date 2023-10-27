import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P93_94ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P93_94ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  var dichVuTaiChinhModel = DichVuTaiChinhModel();
  var list_p93 = [0,0,0,0];
  var list_p94 = [0,0,0,0,0,0,0,0];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    list_p93  = [0,0,0,0];
    list_p94 = [0,0,0,0,0,0,0,0];
    getTTTV();
  }

  getTTTV() async {
    String idho = await '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = await _sPrefAppModel.IDTV;
    await _executeDatabase.getTTTV(idho, idtv).then((value) {
      thanhvien = value;
      /*if(value.c93 != null && value.c94 != null) {
        logicProcessing(value.c93 ?? "", list_p93);
        logicProcessing(value.c94 ?? "", list_p94);
      }*/
    });
    print(list_p93);
  }

  logicProcessing(String data, List<int> list_int){
    var list_data = data.split(',');
    for (int i = 0; i < list_int.length; i++) {
      for(int j = 0; j < list_data.length; j ++){
        if(int.parse(list_data[j]) - 1 == i){
          list_int[i] = int.parse(list_data[j]);
        }
      }
    }
  }

  void P93_94Back() async {
    NavigationServices.instance.navigateToP91_92(context);
  }

  void P93_94Next(DichVuTaiChinhModel data) async {
    //await _executeDatabase.update93_94(data);
    NavigationServices.instance.navigateToP95(context);
  }
}