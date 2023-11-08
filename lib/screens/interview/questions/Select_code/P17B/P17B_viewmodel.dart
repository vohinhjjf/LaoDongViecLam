import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../components/ui_describes.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P17BViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P17BViewModel(this._executeDatabase, this._sPrefAppModel);
  var thanhvien = thongTinThanhVienModel();
  List list_daotao = [];

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
    final String response = await rootBundle.loadString('assets/data/DmDaoTao.json');
    list_daotao = await json.decode(response)["DanhMuc"];
  }

  List queryList(List select_sanpham, String select){
    List list = [];

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
      if(select_sanpham.asMap().values.toList()[i]["Ma"].toString().length > 4 &&
          select_sanpham.asMap().values.toList()[i]["Ma"].toString().substring(0,5).toLowerCase() == select){
        list.add(select_sanpham[i]);
      }
    }
    if(select == ""){
      list = select_sanpham;
    } else{
      select_sanpham = list;
    }
    return list;
  }

  void P17BBack() async {
    NavigationServices.instance.navigateToP17(context);
  }

  void P17BNext(thongTinThanhVienModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int month = int.parse(_sPrefAppModel.month);
    int year = DateTime.now().year;
    await _executeDatabase.updateC00("SET c17B = ? WHERE idho = ? AND idtv = ?",
        [data.c15B,data.idho,data.idtv]);
    if(data.c35A != null){
      NavigationServices.instance.navigateToP40_42(context);
    }
    else if(data.c50A != null){
      NavigationServices.instance.navigateToP56_58(context);
    }
    else {
      await _executeDatabase.getListTTTV(idho).then((value) async {
        value.removeRange(0, value.indexWhere((e) => e.idho == data.idho && e.idtv == data.idtv));
        int index = 0;
        for (int i = 0; i < value.length; i++) {
          if (!checkSelectCode(value[i])) {
            index ++;
            break;
          };
        }
        if (index == 0) {
          await _executeDatabase.getBangKe_ThangDT(month).then((value) async {
            if(value.any((e) => e.idhO_BKE == _sPrefAppModel.getIdHo)){
              await _executeDatabase.updateTrangThai(9, 0, _sPrefAppModel.getIdHo, month, year);
            } else {
              await _executeDatabase.setBangKeThangDTModel([{
                'idhO_BKE': _sPrefAppModel.getIdHo,
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
}