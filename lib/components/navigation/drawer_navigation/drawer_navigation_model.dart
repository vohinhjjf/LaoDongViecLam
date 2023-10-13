import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../base/base_viewmodel.dart';
import '../../../data/shared_preferences/spref_app_model.dart';
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
  thongTinHoModel data = thongTinHoModel();
  var dataNKTT = thongTinHoNKTTModel();

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
      logic(value)
    });
    await _executeDatabase.getHoNKTT(idho).then((value) => dataNKTT = value);
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
      case 11: NavigationServices.instance.navigateToP76_77(context);break;
      /*case 12: NavigationServices.instance.navigateToQuestionA43(context);break;
      case 13: NavigationServices.instance.navigateToNguoiKhaiPhieu(context);break;
      default: NavigationServices.instance.navigateToSync(context);break;*/
    }
  }

  void navigateToNguoiKhaiPhieu(){
    NavigationServices.instance.navigateToInformationProvider(context);
  }

  void navigateToGPS(){
    NavigationServices.instance.navigateToGPS(context);
  }
}