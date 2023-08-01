import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q4ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q4ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [], list_q4_a = [], list_q4_b = [],
      list_q4_c = [], list_q4_d = [], list_q4_e = [], list_q4_f = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    await _executeDatabase.getNKTT(0,"").then((value) => list = value);
    await _executeDatabase.getNKTT(2,"q4A_New").then((value) => list_q4_a = value);
    await _executeDatabase.getNKTT(2,"q4B_New").then((value) => list_q4_b = value);
    await _executeDatabase.getNKTT(2,"q4C_New").then((value) => list_q4_c = value);
    await _executeDatabase.getNKTT(2,"q4D_New").then((value) => list_q4_d = value);
    await _executeDatabase.getNKTT(2,"q4E_New").then((value) => list_q4_e = value);
    await _executeDatabase.getNKTT(2,"q4F_New").then((value) => list_q4_f = value);
  }

  addNTKK(String name, int id, int select) async {
    var nktt;
    switch (select){
      case 1: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4A_New: 1);break;
      case 2: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4B_New: 1);break;
      case 3: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4C_New: 1);break;
      case 4: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4D_New: 1);break;
      case 5: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4E_New: 1);break;
      case 6: nktt = thongTinThanhVienNKTTModel(idho: '99991001003', idtv: id,
          q1_New: name, q4F_New: 1);break;
    }
    await _executeDatabase.setNKTT(nktt);
  }


  deleteNTKK(int id) async {
    await _executeDatabase.deleteNKTT(id);
  }

  void Q4Back() async {
    NavigationServices.instance.navigateToQ3(context);
  }
  void Q4Next() async {
    NavigationServices.instance.navigateToQ5(context);
  }
}