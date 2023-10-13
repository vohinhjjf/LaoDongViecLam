import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHoNKTT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';


class Q5ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q5ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list_q5 = [];
  List<thongTinThanhVienNKTTModel> list = [];
  thongTinHoNKTTModel data = thongTinHoNKTTModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }
  addNTKK(thongTinThanhVienNKTTModel nkttModel) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
        idho: idho,
        idtv: list.last.idtv! + 1,
        q1_New: nkttModel.q1_New,
        q5_New: nkttModel.q5_New
    ));
  }
  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0, "", idho).then((value) => list = value);
    await _executeDatabase.getNKTT(2, "q5_New", idho).then((value) => list_q5 = value);
    await _executeDatabase.getHoNKTT(idho).then((value) => data = value);
  }

  deleteNTKK(int id) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.deleteNKTT(id, idho);
  }

  void Q5Back() {
    NavigationServices.instance.navigateToQ4(context);
  }

  void Q5Next(int q5a) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateHoNKTT("SET q5A_New = $q5a WHERE idho = ${idho}");
    NavigationServices.instance.navigateToQ6(context);
  }
}