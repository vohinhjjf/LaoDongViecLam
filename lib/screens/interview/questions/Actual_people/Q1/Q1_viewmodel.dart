import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinHoNKTT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q1ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q1ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];
  String name = '', month = '';

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  addNTKK(String name, int id) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setNKTT(thongTinThanhVienNKTTModel(
        idho: idho,
        idtv: id,
        thangDT: int.parse(_sPrefAppModel.month),
        namDT: DateTime.now().year,
        q1: '1',
        q1_New: name,
    ));
  }

  updateName(thongTinThanhVienNKTTModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateNameNTKK(thongTinThanhVienNKTTModel(
      idho: idho,
      idtv: data.idtv,
      q1_New: data.q1_New
    ));
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    month = _sPrefAppModel.month;
    await _executeDatabase.getNKTT(1, "q1", idho).then((value) => list = value);
    await _executeDatabase.getHo(idho).then((value) => name = value.tenChuHo!);
  }

  deleteNTKK(int id) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int namDT = DateTime.now().year;
    await _executeDatabase.deleteNKTT(id, idho, 1);
    await _executeDatabase.getListTTTV(idho).then((value) async {
      if(value.any((e) => e.idtv == id)){
        await _executeDatabase.deleteTTTV(idho, id, namDT);
      }
    });
  }

  void Q1Back() async {
    NavigationServices.instance.navigateToDetailInformation(context);
  }

  void Q1Next() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setHoNKTT(thongTinHoNKTTModel(
      idho: idho,
      namDT: DateTime.now().year,
      thangDT: int.parse(_sPrefAppModel.month)
    ));
    NavigationServices.instance.navigateToQ2(context);
  }
}