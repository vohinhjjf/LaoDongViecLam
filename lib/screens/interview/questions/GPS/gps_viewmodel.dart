import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../base/base_logic.dart';
import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../components/uis.dart';
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
  String stopQuestion = "";
  int typeStop = 0;  //0: normal , 1 : member , 2 : dead;
  int currentPos = 0;

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
    await _executeDatabase.getListTTTV("$idho$month").then((value) async {
      int index = 0;
      for(int i = 0; i < value.length; i++){
        if(!checkSelectCode(value[i])){
          index ++;
          break;
        };
      }
      if(index == 0) {
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
        NavigationServices.instance.navigateToInterviewStatus(context);
      }
    });
  }

  bool checkSelectCode(thongTinThanhVienModel tttv){
    if(tttv.c15A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P17B, context);
      return false;
    }
    if(tttv.c35A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P35B, context);
      return false;
    }
    if(tttv.c50A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P50B, context);
      return false;
    }
    return true;
  }

  void gPSCheck(String stopQuestion){
    NavigationServices.instance.routeNavigate(stopQuestion, context);
  }

  void setGPS(double kinhDo, double viDo) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.setGPS(kinhDo, viDo, idho);
  }

  Future<bool> checkGPS() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    return await _executeDatabase.getKD_VD(idho);
  }

  checkQuestion(List<thongTinThanhVienModel> list_tv, thongTinHoModel thongTinHo){
    if (!procedureMember(list_tv)) {
      typeStop = 1;
      return false;
    }

    if (!procedureThongTinHo(thongTinHo)) {
      typeStop = 0;
      return false;
    }

    return true;
  }

  procedureMember(List<thongTinThanhVienModel> list_tv) {
    for (int i = 0; i < list_tv.length; i++) {
      if (!BaseLogic.getInstance().procedureMember(list_tv[i])) {
        stopQuestion = BaseLogic.getInstance().mQuestion;
        currentPos = i;
        print(stopQuestion);
        print(currentPos);
        return false;
      }
    }
    print(stopQuestion);
    print(currentPos);
    return true;
  }

  procedureThongTinHo(thongTinHoModel thongTinHo) {
    // Question require
    if (thongTinHo.maNCC == null) {
      stopQuestion = UIDescribes.mDIENTHOAI;
      return false;
    }
    return true;
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