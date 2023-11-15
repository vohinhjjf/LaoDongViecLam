import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../components/uis.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/bangkeThangDT_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P40_42ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P40_42ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  List list_maNghe = [], list_nghe = [];
  List list_maNganh = [], list_nganh = [];

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
    final String response = await rootBundle.loadString('assets/data/DmNgheC1.json');
    list_maNghe = await json.decode(response)["DanhMuc"];
    final String response1 = await rootBundle.loadString('assets/data/DmNghe.json');
    list_nghe = await json.decode(response1)["DanhMuc"];
    final String response2 = await rootBundle.loadString('assets/data/DmNganhC1.json');
    list_maNganh = await json.decode(response2)["DanhMuc"];
    final String response3 = await rootBundle.loadString('assets/data/DmNganh.json');
    list_nganh = await json.decode(response3)["DanhMuc"];
  }

  List queryListNghe(String select, String linh_vuc, List list_nghe){
    List select_nghe = [], list = [];
    select_nghe = list_nghe.where((e) => e['MaC1'] == linh_vuc).toList();


    for(int i =0; i < select_nghe.asMap().values.toList().length; i++){
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().isEmpty){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().length == 1){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().length == 2){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().length == 3){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().length  == 4){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }
      if(select_nghe.asMap().values.toList()[i]["Ten"].toString().length > 5){
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
        if(select_nghe.asMap().values.toList()[i]["Ten"].toString().substring(0,5).toLowerCase() == select){
          list.add(select_nghe[i]);
        }
      }

      if(select_nghe.asMap().values.toList()[i]["Ma"].toString().substring(0,0).toLowerCase() == select){
        list.add(select_nghe[i]);
      }
      if(select_nghe.asMap().values.toList()[i]["Ma"].toString().substring(0,1).toLowerCase() == select){
        list.add(select_nghe[i]);
      }
      if(select_nghe.asMap().values.toList()[i]["Ma"].toString().substring(0,2).toLowerCase() == select){
        list.add(select_nghe[i]);
      }
      if(select_nghe.asMap().values.toList()[i]["Ma"].toString().substring(0,3).toLowerCase() == select){
        list.add(select_nghe[i]);
      }
      if(select_nghe.asMap().values.toList()[i]["Ma"].toString().substring(0,4).toLowerCase() == select){
        list.add(select_nghe[i]);
      }
    }
    if(select == ""){
      if(linh_vuc == ' ') {
        return list_nghe;
      } else {
        return select_nghe;
      }
    } else{
      return list;
    }
  }

  List queryListNganh(String select, String linh_vuc, List list_nganh){
    List select_nganh = [], list = [];
    select_nganh = list_nganh.where((e) => e['MaC1'] == linh_vuc).toList();

    for(int i =0; i < select_nganh.asMap().values.toList().length; i++){
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().isEmpty){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().length == 1){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().length == 2){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().length == 3){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().length  == 4){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }
      if(select_nganh.asMap().values.toList()[i]["Ten"].toString().length > 5){
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
        if(select_nganh.asMap().values.toList()[i]["Ten"].toString().substring(0,5).toLowerCase() == select){
          list.add(select_nganh[i]);
        }
      }

      if(select_nganh.asMap().values.toList()[i]["Ma"].toString().substring(0,0).toLowerCase() == select){
        list.add(select_nganh[i]);
      }
      if(select_nganh.asMap().values.toList()[i]["Ma"].toString().substring(0,1).toLowerCase() == select){
        list.add(select_nganh[i]);
      }
      if(select_nganh.asMap().values.toList()[i]["Ma"].toString().substring(0,2).toLowerCase() == select){
        list.add(select_nganh[i]);
      }
      if(select_nganh.asMap().values.toList()[i]["Ma"].toString().substring(0,3).toLowerCase() == select){
        list.add(select_nganh[i]);
      }
      if(select_nganh.asMap().values.toList()[i]["Ma"].toString().substring(0,4).toLowerCase() == select){
        list.add(select_nganh[i]);
      }
    }
    if(select == ""){
      if(linh_vuc == '0') {
        return list_nganh;
      } else {
        return select_nganh;
      }
    } else{
      return list;
    }
  }

  void P40_42Back(thongTinThanhVienModel data) async {
    if(data.c15A != null) {
      NavigationServices.instance.navigateToP17B(context);
    } else {
      String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
      await _executeDatabase.getListTTTV(idho).then((value) async {
        if(value.first.idtv == thanhvien.idtv){
          NavigationServices.instance.navigateToInformationProvider(context);
        }
        else {
          print("object 5");
          value.removeRange(value.indexWhere((e) => e.idho == data.idho && e.idtv == data.idtv), value.length);
          int index = 0;
          for (int i = value.length - 1; i < value.length; i--) {
            if (!checkSelectCodeBack(value[i])) {
              index ++;
              break;
            };
          }
          if (index == 0) {
            NavigationServices.instance.navigateToInformationProvider(context);
          }
        }
      });
    }
  }

  void P40_42Next(thongTinThanhVienModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int month = int.parse(_sPrefAppModel.month);
    int year = DateTime.now().year;
    _executeDatabase.updateC00("SET c35B = ?, c37B = ? WHERE idho = ? AND idtv = ?",
        [data.c35B,data.c37B,data.idho,data.idtv]);
    if(data.c50A != null){
      NavigationServices.instance.navigateToP56_58(context);
    }
    else {
      await _executeDatabase.getListTTTV(idho).then((value) async {
        value.removeRange(0, value.indexWhere((e) => e.idho == data.idho && e.idtv == data.idtv) + 1);
        int index = 0;
        for (int i = 0; i < value.length; i++) {
          if (!checkSelectCodeNext(value[i])) {
            index ++;
            break;
          };
        }
        print("index $index");
        if (index == 0) {
          NavigationServices.instance.navigateToFinish(context);
        }
      });
    }
  }

  bool checkSelectCodeNext(thongTinThanhVienModel tttv){
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

  bool checkSelectCodeBack(thongTinThanhVienModel tttv){
    if(tttv.c50A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P50B, context);
      return false;
    }
    if(tttv.c35A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P35B, context);
      return false;
    }
    if(tttv.c15A != null){
      _sPrefAppModel.setIDTV(tttv.idtv!);
      NavigationServices.instance.routeNavigate(UIDescribes.QUESTION_P17B, context);
      return false;
    }
    return true;
  }

}