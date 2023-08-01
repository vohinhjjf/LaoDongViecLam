import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q3ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q3ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];
  int q3_a = 0, q3_b =0, q3_c = 0, q3_d = 0;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    await _executeDatabase.getNKTT(1, "q1").then((value) {
      list = value;
      q3_a = logic(1);
      q3_b = logic(2);
      q3_c = logic(3);
      q3_d = logic(4);
    });
  }

  int logic(int q3){
    int? value;
    for(var item in list){
      switch (q3){
        case 1: value = item.q3A_New;break;
        case 2: value = item.q3B_New;break;
        case 3: value = item.q3C_New;break;
        case 4: value = item.q3D_New;break;
      }
      if(value != null){
        return 1;
      }
    }
    return 2;
  }

  void Q3Back() async {
    NavigationServices.instance.navigateToQ2(context);
  }
  void Q3Next(List<thongTinThanhVienNKTTModel> list) async {
    await _executeDatabase.updateNTKK(list);
    NavigationServices.instance.navigateToQ4(context);
  }
}