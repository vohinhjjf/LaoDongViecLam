import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q6ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q6ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    await _executeDatabase.getNKTT(0, "").then((value) {
      list = value;
      logic(value);
    });
  }

  void logic(List<thongTinThanhVienNKTTModel> list_nktt){
    var toRemove = [];
    for(var item in list_nktt){
      if(item.q3A_New == 1 || item.q3B_New == 1 || item.q3C_New == 1
          || item.q3D_New == 1){
        toRemove.add(item);
      }
    }
    list.removeWhere((e) => toRemove.contains(e));
  }

  void Q6Back() async {
    NavigationServices.instance.navigateToQ5(context);
  }
  void Q6Next() async {
    NavigationServices.instance.navigateToQ7(context);
  }
}