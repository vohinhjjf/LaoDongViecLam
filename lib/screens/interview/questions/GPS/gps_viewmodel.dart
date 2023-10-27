import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class GPSViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  GPSViewModel(this._executeDatabase, this._sPrefAppModel);
  var thongTinHo = thongTinHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getHo(idho).then((value) => thongTinHo = value);
  }


  void gPSBack() async {
    NavigationServices.instance.navigateToInformationProvider(context);
  }

  void gPSNext() async {
    await _executeDatabase.updateTrangThai(_sPrefAppModel.getIdHo, 3);
    NavigationServices.instance.navigateToInterviewStatus(context);
  }

  void setGPS(double kinhDo, double viDo) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setGPS(kinhDo, viDo, idho);
  }

  Future<bool> checkGPS() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    return await _executeDatabase.getKD_VD(idho);
  }

  void finish(String thoigiankt) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateTimeKT(idho, thoigiankt, thoigiankt);
  }
}