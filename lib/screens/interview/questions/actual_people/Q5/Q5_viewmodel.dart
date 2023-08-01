import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';


class Q5ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q5ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list_q5 = [];
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }
  addNTKK(thongTinThanhVienNKTTModel nkttModel) async {
    await _executeDatabase.setNKTT(nkttModel);
  }
  getListNKTT() async {
    await _executeDatabase.getNKTT(0, "").then((value) => list = value);
    await _executeDatabase.getNKTT(2, "q5_New").then((value) => list_q5 = value);
  }

  deleteNTKK(int id) async {
    await _executeDatabase.deleteNKTT(id);
  }

  void Q5Back() async {
    NavigationServices.instance.navigateToQ4(context);
  }
  void Q5Next() async {
    NavigationServices.instance.navigateToQ6(context);
  }
}