import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHoNKTT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q4ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q4ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [], list_q4_a = [], list_q4_b = [],
      list_q4_c = [], list_q4_d = [], list_q4_e = [], list_q4_f = [];
  thongTinHoNKTTModel data = thongTinHoNKTTModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0,"", idho).then((value) => list = value);
    await _executeDatabase.getNKTT(2,"q4A_New", idho).then((value) => list_q4_a = value);
    await _executeDatabase.getNKTT(2,"q4B_New", idho).then((value) => list_q4_b = value);
    await _executeDatabase.getNKTT(2,"q4C_New", idho).then((value) => list_q4_c = value);
    await _executeDatabase.getNKTT(2,"q4D_New", idho).then((value) => list_q4_d = value);
    await _executeDatabase.getNKTT(2,"q4E_New", idho).then((value) => list_q4_e = value);
    await _executeDatabase.getNKTT(2,"q4F_New", idho).then((value) => list_q4_f = value);
    await _executeDatabase.getHoNKTT(idho).then((value) => data = value);
  }

  addNTKK(String name, int id, int select) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    var nktt;
    switch (select){
      case 1: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4A_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
      case 2: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4B_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
      case 3: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4C_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
      case 4: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4D_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
      case 5: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4E_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
      case 6: nktt = thongTinThanhVienNKTTModel(idho: idho, idtv: id,
          q1_New: name, q4F_New: 1,thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,);break;
    }
    await _executeDatabase.setNKTT(nktt);
  }


  deleteNTKK(int id) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.deleteNKTT(id, idho, 1);
  }

  void Q4Back() async {
    NavigationServices.instance.navigateToQ3(context);
  }
  void Q4Next(int q4a, int q4b, int q4c, int q4d, int q4e, int q4f) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateHoNKTT("SET q4A_New = $q4a, q4B_New = $q4b, "
        "q4C_New = $q4c, q4D_New = $q4d, q4E_New = $q4e, q4F_New = $q4f WHERE idho = ${idho}");
    NavigationServices.instance.navigateToQ5(context);
  }
}