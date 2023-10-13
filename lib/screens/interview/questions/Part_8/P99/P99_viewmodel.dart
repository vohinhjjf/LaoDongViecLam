import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P99ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P99ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();

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
  }

  void P99Back() async {
    NavigationServices.instance.navigateToP98(context);
  }

  void P99Next(thongTinThanhVienModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    await _executeDatabase.update("SET c99 = ${data.c99} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    await _executeDatabase.getListTTTV(idho).then((value) {
      if(idtv == value.last.idtv && value.last.c01 != 1){
        NavigationServices.instance.navigateToInformationProvider(context);
      }else if(value.lastWhere((e) => e.idtv == idtv).c01 == 1){
        if(idtv == value.first.idtv){
          _sPrefAppModel.setIDTV(value.first.idtv! + 1);
        } else {
          _sPrefAppModel.setIDTV(value.first.idtv!);
        }
        NavigationServices.instance.navigateToP01_04(context);
      } else {
        if(value[value.indexWhere((e) => e.idtv == idtv) + 1].c01 == 1){
          if(value.indexWhere((e) => e.idtv == idtv) <= value.length - 2) {
            _sPrefAppModel.setIDTV(
                value[value.indexWhere((e) => e.idtv == idtv) + 2].idtv!);
          } else {
            NavigationServices.instance.navigateToInformationProvider(context);
          }
        } else {
          _sPrefAppModel.setIDTV(value[value.indexWhere((e) => e.idtv == idtv) + 1].idtv!);
        }
        NavigationServices.instance.navigateToP01_04(context);
      }
    });
    //NavigationServices.instance.navigateToP96(context);
  }
}