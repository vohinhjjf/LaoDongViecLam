import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHoNKTT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q2ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q2ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list_q2 = [];
  List<thongTinThanhVienNKTTModel> list = [];
  thongTinHoNKTTModel data = thongTinHoNKTTModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }
  addListNTKK(List<thongTinThanhVienNKTTModel> listNTKK) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    for(var item in listNTKK) {
      await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
          idho: idho,
          idtv: item.idtv,
          thangDT: item.thangDT,
          namDT: item.namDT,
          q1_New: item.q1_New,
          q2_New: item.q2_New
      ));
    }
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0, "", idho).then((value) => list = value);
    await _executeDatabase.getNKTT(2, "q2_New", idho).then((value) => list_q2 = value);
    await _executeDatabase.getHoNKTT(idho).then((value) => data = value);
  }

  updateName(thongTinThanhVienNKTTModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateNameNTKK(thongTinThanhVienNKTTModel(
        idho: idho,
        idtv: data.idtv,
        q1_New: data.q1_New
    ));
  }

  deleteNTKK(int id) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.deleteNKTT(id, idho, 1);
  }

  void Q2Back() async {
    NavigationServices.instance.navigateToQ1(context);
  }

  void Q2Next(int q2) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateHoNKTT("SET q2_New = $q2 WHERE idho = ${idho}");
    NavigationServices.instance.navigateToQ3(context);
  }
}