import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class Q7ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q7ViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0, "", idho).then((value) {
      list = value;
      logic(value);
    });
  }

  void logic(List<thongTinThanhVienNKTTModel> list_nktt){
    var toRemove = [];
    for(var item in list_nktt){
      if(item.q3A_New == 1 || item.q3B_New == 1 || item.q3C_New == 1
          || item.q3D_New == 1){
        toRemove.add(item);
      }
    }
    list.removeWhere((e) => toRemove.contains(e));
  }

  void Q7Back() async {
    NavigationServices.instance.navigateToQ6(context);
  }

  void Q7Next(int idtv) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0, '', idho).then((value) async {
      if(value.indexWhere((e) => e.q6_New == 1) != -1){
        String idho = value.firstWhere((e) => e.q6_New == 1).idho ?? "";
        int idtv = value.firstWhere((e) => e.q6_New == 1).idtv!;
        await _executeDatabase.updateChuHo(null, idho, idtv);
      }
    });
    await _executeDatabase.getListTTTV(idho).then((value) async {
      if(value.indexWhere((e) => e.c01 == 1) != -1){
        String idho = value.firstWhere((e) => e.c01 == 1).idho ?? "";
        int idtv = value.firstWhere((e) => e.c01 == 1).idtv!;
        await _executeDatabase.updateSTT(null, idho, idtv);
      }
    });
    await _executeDatabase.updateChuHo(1, idho, idtv);
    await _executeDatabase.updateSTT(1, idho, idtv);
    await _sPrefAppModel.setIDTV(idtv);
    NavigationServices.instance.navigateToP01_04(context);
    print(idtv);
  }
}