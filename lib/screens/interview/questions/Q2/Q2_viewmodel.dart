import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q2ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q2ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list_q2 = [];
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }
  addNTKK(String name, int id) async {
    await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
        idho: '99991001003',
        idtv: id,
        q1: name,
        q2_New: 2
    ));
  }
  getListNKTT() async {
    await _executeDatabase.getNKTT(0).then((value) => list = value);
    await _executeDatabase.getNKTT(2).then((value) => list_q2 = value);
  }

  deleteNTKK(int id) async {
    await _executeDatabase.deleteNKTT(id);
  }

  void Q2Back() async {
    NavigationServices.instance.navigateToQ1(context);
  }
  void Q2Next() async {
    NavigationServices.instance.navigateToQ3(context);
  }
}