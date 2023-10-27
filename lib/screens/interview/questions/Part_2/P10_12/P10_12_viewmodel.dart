import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P10_12ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P10_12ViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  List list_tinh = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getTTTV();
  }

  getTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.getTTTV(idho, idtv).then((value) {
      thanhvien = value;
    });
    final String response = await rootBundle.loadString('assets/data/DM_TINH.json');
    list_tinh = await json.decode(response)["Tinh"];
  }

  void P10_12Back() async {
    NavigationServices.instance.navigateToP08_09(context);
  }

  void P10_12Next(thongTinThanhVienModel data) async {
    await _executeDatabase.update("SET c09 = ${data.c09}, c09A = '${data.c09A}'"
        ", c09B = ${data.c09B}, c10 = ${data.c10}, c10M = ${data.c10M}, c10_MK = '${data.c10_MK}' "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP13(context);
  }
}