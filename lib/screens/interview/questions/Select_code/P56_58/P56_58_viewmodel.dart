import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P56_58ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P56_58ViewModel(this._executeDatabase, this._sPrefAppModel);
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
    for(int i =0; i < list_nghe.length; i++){
      if(list_nghe[i]["MaC1"] == linh_vuc){
        select_nghe.add(list_nghe[i]);
      }
    }

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
      select_nghe = select_nghe;
    } else{
      select_nghe = list;
    }
    return select_nghe;
  }

  List queryListNganh(String select, String linh_vuc, List list_nganh){
    List select_nganh = [], list = [];
    for(int i =0; i < list_nganh.length; i++){
      if(list_nganh[i]["MaC1"] == linh_vuc){
        select_nganh.add(list_nganh[i]);
      }
    }

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
    if(select == "" || select == "0"){
      select_nganh = select_nganh;
    } else{
      select_nganh = list;
    }
    return select_nganh;
  }

  void P56_58Back() async {
    NavigationServices.instance.navigateToP40_42(context);
  }

  void P56_58Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c50B = '${data.c50B}', c52B = '${data.c52B}' "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    //NavigationServices.instance.navigateToP43(context);
  }
}