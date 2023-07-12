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


  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  addNTKK(String name, int id) async {
    await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
        idho: 'DTV99003',
        idtv: id,
        q1: name
    ));
  }

  getListNKTT() async {
    await _executeDatabase.getNKTT().then((value) => list = value);
  }

  void Q1Back() async {
    NavigationServices.instance.navigateToHouseHold(context);
  }
  void Q1Next() async {
    NavigationServices.instance.navigateToQ2(context);
  }
}