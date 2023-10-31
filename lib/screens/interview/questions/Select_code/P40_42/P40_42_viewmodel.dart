import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P40_42ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P40_42ViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  List list_maNghe = [], list_nghe = [];

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
    final String response = await rootBundle.loadString('assets/data/DmNganhC1.json');
    list_maNghe = await json.decode(response)["DanhMuc"];
    final String response1 = await rootBundle.loadString('assets/data/DmNganh.json');
    list_nghe = await json.decode(response1)["DanhMuc"];
  }

  List queryList(String select, String linh_vuc, List list_nghe){
    List select_sanpham = [], list = [];
    for(int i =0; i < list_nghe.length; i++){
      if(list_nghe[i]["Ma"] == linh_vuc){
        select_sanpham.add(list_nghe[i]);
      }
    }

    for(int i =0; i < select_sanpham.asMap().values.toList().length; i++){
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().isEmpty){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().length == 1){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().length == 2){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().length == 3){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().length  == 4){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }
      if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().length > 5){
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,0).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,1).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,2).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,3).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,4).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
        if(select_sanpham.asMap().values.toList()[i]["Ten"].toString().substring(0,5).toLowerCase() == select){
          list.add(select_sanpham[i]);
        }
      }

      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,0).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,1).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,2).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,3).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,4).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,5).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
    }
    if(select == "" || linh_vuc == "0"){
      select_sanpham = select_sanpham;
    } else{
      select_sanpham = list;
    }
    return select_sanpham;
  }

  void P40_42Back() async {
    NavigationServices.instance.navigateToP17B(context);
  }

  void P40_42Next(thongTinThanhVienModel data) async {
    _executeDatabase.update("SET c35B = '${data.c35B}', c37B = '${data.c37B}' "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    NavigationServices.instance.navigateToP56_58(context);
  }
}