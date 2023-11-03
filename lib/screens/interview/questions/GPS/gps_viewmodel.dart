import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../models/thongTinThanhVien_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class GPSViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  GPSViewModel(this._executeDatabase, this._sPrefAppModel);
  var thongTinHo = thongTinHoModel();
  List<thongTinThanhVienModel> list = [];

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getHo(idho).then((value) => thongTinHo = value);
    await _executeDatabase.getListTTTV(idho).then((value) => list = value);
  }


  void gPSBack() async {
    NavigationServices.instance.navigateToInformationProvider(context);
  }

  void gPSNext() async {
    String idho = _sPrefAppModel.getIdHo;
    int month = int.parse(_sPrefAppModel.month);
    int year = DateTime.now().year;
    await _executeDatabase.getBangKe_ThangDT(month).then((value) async {
      if(value.any((e) => e.idhO_BKE == idho)){
        await _executeDatabase.updateTrangThai(idho, 0, month, year);
      } else {
        await _executeDatabase.setBangKeThangDTModel([{
          'idhO_BKE': idho,
          'namDT': year,
          'thangDT': month,
          'trangThai': 9,
          'sync' : 0
        }]);
      }
    });
    await _executeDatabase.getListTTTV("$idho$month").then((value) {
      int index = value.indexWhere((e) => e.c01 == 1);
      var tttv = value.first;
      value[0] = value[index];
      value[index] = tttv;
      for(int i = 0; i < value.length; i++){
        _sPrefAppModel.setIDTV(value[i].idtv!);
        if(value[i].c15A != null){
          NavigationServices.instance.navigateToP17B(context);
          print("17B");
          break;
        }
        else if(value[i].c35A != null){
          NavigationServices.instance.navigateToP40_42(context);
          print("40-42");
          break;
        }
        else if(value[i].c50A != null){
          NavigationServices.instance.navigateToP56_58(context);
          print("56-58");
          break;
        }
      }
      print(4);
      //NavigationServices.instance.navigateToInterviewStatus(context);
    });
  }

  void setGPS(double kinhDo, double viDo) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setGPS(kinhDo, viDo, idho);
  }

  Future<bool> checkGPS() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    return await _executeDatabase.getKD_VD(idho);
  }

  void finish(String thoigiankt, List<thongTinThanhVienModel> list) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateTimeKT(
                idho,
                thoigiankt,
                thoigiankt,
                list.length,
                list.where((e) => e.c02 == 2).length,
                list.where((e) => e.c04! >= 15).length,
                list.where((e) => e.c02 == 2 && e.c04! >= 15).length,
    );
  }
}