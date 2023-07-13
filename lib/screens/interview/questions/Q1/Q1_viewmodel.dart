import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q1ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q1ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];
  String name = '';

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  addNTKK(String name, int id) async {
    await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
        idho: '99991001003',
        idtv: id,
        q1_New: name,
        q2_New: 1
    ));
  }

  getListNKTT() async {
    await _executeDatabase.getNKTT(0).then((value) => list = value);
    await _executeDatabase.getHo("99991001003").then((value) => name = value.tenChuHo!);
  }

  deleteNTKK(int id) async {
    await _executeDatabase.deleteNKTT(id);
  }

  void Q1Back() async {
    NavigationServices.instance.navigateToHouseHold(context);
  }
  void Q1Next() async {
    NavigationServices.instance.navigateToQ2(context);
  }
}