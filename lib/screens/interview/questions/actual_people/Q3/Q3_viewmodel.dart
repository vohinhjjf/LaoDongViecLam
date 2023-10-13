import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHoNKTT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q3ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q3ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];
  thongTinHoNKTTModel data = thongTinHoNKTTModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(1, "q1", idho).then((value) {
      list = value;
    });
    await _executeDatabase.getHoNKTT(idho).then((value) => data = value);
  }

  void Q3Back() async {
    NavigationServices.instance.navigateToQ2(context);
  }

  void Q3Next(List<thongTinThanhVienNKTTModel> list, int q3a, int q3b, int q3c, int q3d) async {
    await _executeDatabase.updateNTKK(list);
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateHoNKTT("SET q3A_New = $q3a, q3B_New = $q3b, "
        "q3C_New = $q3c, q3D_New = $q3d WHERE idho = ${idho}");
    NavigationServices.instance.navigateToQ4(context);
  }
}