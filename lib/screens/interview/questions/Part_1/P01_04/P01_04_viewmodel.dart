import 'package:flutter/material.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P01_04ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P01_04ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  List<thongTinThanhVienModel> list_tttv = [];
  String stopQuestion = "";
  int currentPos = 0;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.getListTTTV(idho).then((value) => list_tttv == value);
    await _executeDatabase.getTTTV(idho, idtv).then((value) {
      thanhvien = value;
    });
  }

  void P01_04Back(int c01) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.getListTTTV(idho).then((value) {
      print(value.length);
      list_tttv = value;
      if (c01 == 1) {
        NavigationServices.instance.navigateToQ7(context);
      } else {
        if (value.indexWhere((e) => e.idtv == idtv) == 0){ //Neu idtv hien tai la thanh vien dau tien
          _sPrefAppModel.setIDTV(value.firstWhere((e) => e.c01 == 1).idtv!);
          NavigationServices.instance.routeNavigate(
              procedureMember(value.firstWhere((e) => e.c01 == 1)), context);
        }
        else {
          _sPrefAppModel.setIDTV(value[value.indexWhere((e) => e.idtv == idtv) - 1].idtv!);
          NavigationServices.instance.routeNavigate(
              procedureMember(value[value.indexWhere((e) => e.idtv == idtv) - 1]), context);
        }
      }
    });
  }

  String procedureMember(thongTinThanhVienModel thongTinTV) {
    String stopQuestion = "P01";
    if (BaseLogic.getInstance().procedureMember(thongTinTV)) {
      stopQuestion = BaseLogic.getInstance().mQuestion;
    }
    return stopQuestion;
  }

  void P01_04Next(thongTinThanhVienModel data) async {
    await _executeDatabase.updateC00("SET c00 = ?, c01 = ?, c01K = ?, c02 = ?, "
        "c03A = ?, c03B = ?, c04 = ? WHERE idho = ? AND idtv = ?",
        [data.c00,data.c01,data.c01K,data.c02,data.c03A,data.c03B,data.c04,data.idho,data.idtv]);
    await _executeDatabase.updateNameNTKK(thongTinThanhVienNKTTModel(
        idho: data.idho,
        idtv: data.idtv,
        q1_New: data.c00
    ));
    if(data.c04! >= 25 && data.c04! <= 49) {
      NavigationServices.instance.navigateToP05(context);
    } else {
      if(data.c04! >= 15) {
        await _executeDatabase.update("SET c04A = ${null} "
            "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
        NavigationServices.instance.navigateToP06_07(context);
      } else {
        NavigationServices.instance.navigateToP70_75(context);
      }
    }
  }
}