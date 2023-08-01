import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q7ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q7ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void Q7Back() async {
    NavigationServices.instance.navigateToQ6(context);
  }
  void Q7Next(int idtv, thongTinThanhVienModel data) async {
    _executeDatabase.updateChuHo(idtv);
    _executeDatabase.setTTTV(data);
    NavigationServices.instance.navigateToP01_04(context);
  }
}