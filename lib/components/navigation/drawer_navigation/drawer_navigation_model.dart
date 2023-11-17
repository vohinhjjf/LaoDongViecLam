import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:LDVL2024/components/uis.dart';
import 'package:LDVL2024/models/thongTinThanhVien_model.dart';

import '../../../base/base_logic.dart';
import '../../../base/base_viewmodel.dart';
import '../../../data/shared_preferences/spref_app_model.dart';
import '../../../models/doiSongHo_model.dart';
import '../../../models/thongTinHoNKTT_model.dart';
import '../../../models/thongTinHo_model.dart';
import '../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../services/sqlite/execute_database.dart';
import '../navigation_service.dart';

class DrawerNavigationModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  DrawerNavigationModel(this._executeDatabase, this._sPrefAppModel);
  List items = [];
  List<thongTinThanhVienNKTTModel> list = [];
  List<thongTinThanhVienModel> list_tttv = [];
  var data = thongTinHoModel();
  var dataNKTT = thongTinHoNKTTModel();
  var dataDSH = DoiSongHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getHo(idho).then((value) async => {
      data = value,
    });
    await _executeDatabase.getNKTT(0, "", idho).then((value) async => {
      logic(value),
      if(value.isNotEmpty){
        await _executeDatabase.getHoNKTT(idho).then((value) => dataNKTT = value),
        await _executeDatabase.getDoiSongHo(idho).then((value) => dataDSH = value)
      }
    });
    await _executeDatabase.getListTTTV(idho).then((value) => list_tttv = value);
  }

  void logic(List<thongTinThanhVienNKTTModel> list_nktt){
    var toRemove = [];
    for(var item in list_nktt){
      if(item.q3A_New == 1 || item.q3B_New == 1 || item.q3C_New == 1
          || item.q3D_New == 1){
        toRemove.add(item);
      }
    }
    list = list_nktt;
    list.removeWhere((e) => toRemove.contains(e));
    var data = thongTinThanhVienNKTTModel();
    for(int i = 0; i < list.length; i++){
      if(list[i].q6_New == 1){
        data = list[i];
        list.removeAt(i);
        list.insert(0, data);
      }
    }
  }

  checkTTTV() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getListTTTV(idho).then((value) {
      for(var item in value){
        //if(i)
      }
    });
  }

  void navigateToTTTV(thongTinThanhVienModel thongTinTV, String title, String data){
      String stopQuestion = title;
      if(!BaseLogic.getInstance().procedureMember(thongTinTV)){
        stopQuestion = BaseLogic.getInstance().mQuestion;
        if(data == ""){
          if(int.parse(title.substring(1, 3)) < int.parse(stopQuestion.substring(1, 3))){
            print(1);
            Navigator.of(context).pop();
            return;
          } else {
            print(2);
            stopQuestion = BaseLogic.getInstance().mQuestion;
          }
          print(3);
        }
        else if (int.parse(title.substring(1, 3)) < int.parse(stopQuestion.substring(1, 3))) {
          stopQuestion = title;
          print(4);
        }
        else {
          print(5);
          stopQuestion = BaseLogic.getInstance().mQuestion;
        }
        print(6);
      }
      _sPrefAppModel.setIDTV(thongTinTV.idtv!);
      NavigationServices.instance.routeNavigate(stopQuestion, context);
  }

  Future<void> navigateToDSH(DoiSongHoModel dsh, String title, int? data, int idtv) async {
    String stopQuestion = title;
    if(!BaseLogic.getInstance().checkC62_M1(dsh)){
      stopQuestion = BaseLogic.getInstance().mQuestion;
      if(data == null){
        if(int.parse(title.substring(1, 3)) < int.parse(stopQuestion.substring(1, 3))){
          print(1);
          Navigator.of(context).pop();
          return;
        } else {
          print(2);
          stopQuestion = BaseLogic.getInstance().mQuestion;
        }
        print(3);
      }
      else if (int.parse(title.substring(1, 3)) < int.parse(stopQuestion.substring(1, 3))) {
        stopQuestion = title;
        print(4);
      }
      else {
        print(5);
        stopQuestion = BaseLogic.getInstance().mQuestion;
      }
      print(6);
    }
    await _sPrefAppModel.setIDTV(idtv);
    NavigationServices.instance.routeNavigate(stopQuestion, context);
  }

  void navigateToRoute(int select, int idtv) async {
    switch (select){
      case 0: NavigationServices.instance.navigateToOperatingStatus(context);break;
      case 1: NavigationServices.instance.navigateToGeneralInformation(context);break;
      case 2: NavigationServices.instance.navigateToDetailInformation(context);break;
      case 3: NavigationServices.instance.navigateToQ1(context);break;
      case 4: NavigationServices.instance.navigateToQ2(context);break;
      case 5: NavigationServices.instance.navigateToQ3(context);break;
      case 6: NavigationServices.instance.navigateToQ4(context);break;
      case 7: NavigationServices.instance.navigateToQ5(context);break;
      case 8: NavigationServices.instance.navigateToQ6(context);break;
      case 9: NavigationServices.instance.navigateToQ7(context);break;
      case 10: {
        await _sPrefAppModel.setIDTV(idtv);
        NavigationServices.instance.navigateToP01_04(context);
      };break;
      case 19: NavigationServices.instance.navigateToInformationProvider(context);break;
      /*default: NavigationServices.instance.navigateToSync(context);break;*/
    }
  }

  void navigateToNguoiKhaiPhieu(){
    NavigationServices.instance.navigateToInformationProvider(context);
  }

  void navigateToGPS(){
    NavigationServices.instance.navigateToGPS(context);
  }
}