import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/models/doiSongHo_model.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P70_75ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P70_75ViewModel(this._executeDatabase, this._sPrefAppModel);
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

  void P70_75Back(thongTinThanhVienModel data) async {
    if(data.c04! < 15){
      NavigationServices.instance.navigateToP01_04(context);
    } else {
      NavigationServices.instance.navigateToP69(context);
    }
  }

  void P70_75Next(thongTinThanhVienModel data) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    int idtv = _sPrefAppModel.IDTV;
    _executeDatabase.update("SET c64 = ${data.c64}, c65 = ${data.c65}, c66 = ${data.c66},"
        " c67 = ${data.c67}, c68 = ${data.c68}, c69 = ${data.c69} "
        "WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
    await _executeDatabase.getListTTTV(idho).then((value) async {
      if(value.length > 1){
        if(idtv == value.first.idtv){ // Nếu tv hiện tại là đầu tiên
          if(value[1].c01 == 1){ // tv thứ 2 là chủ hộ
            if(value[1].idtv == value.last.idtv){ // tv thứ 2 là tv cuối cùng
              _sPrefAppModel.setIDTV(value[1].idtv!);
              await _executeDatabase.checkDSH(idho).then((value) async {
                if(value) {
                  print(1);
                  await _executeDatabase.setDSH(DoiSongHoModel(
                    idho: idho,
                    thangDT: data.thangDT,
                    namDT: data.namDT,
                  ));
                }
                NavigationServices.instance.navigateToP76_77(context);
              });
              print(1);
            } else { //tv thứ 2 ko phải cuối cùng
              _sPrefAppModel.setIDTV(value[2].idtv!);
              NavigationServices.instance.navigateToP01_04(context);
              print(2);
            }
          } else {
            _sPrefAppModel.setIDTV(value[1].idtv!);
            NavigationServices.instance.navigateToP01_04(context);
            print(3);
          }
        } else if(idtv == value.last.idtv){ // Nếu tv hiện tại là cuối cùng
          if(value.last.c01 == 1){ // tv hiện tại là chủ hộ
            _sPrefAppModel.setIDTV(value.first.idtv!);
            NavigationServices.instance.navigateToP01_04(context);
            print(4);
          } else {
            _sPrefAppModel.setIDTV(value.firstWhere((e) => e.c01 == 1).idtv!);
            await _executeDatabase.checkDSH(idho).then((value) async {
              if(value) {
                print(1);
                await _executeDatabase.setDSH(DoiSongHoModel(
                  idho: idho,
                  thangDT: data.thangDT,
                  namDT: data.namDT,
                ));
              }
              NavigationServices.instance.navigateToP76_77(context);
            });
            print(5);
          }
        } else { // tv hiện tại nằm giữa
          if(value.singleWhere((e) => e.idtv == idtv).c01 == 1){ // tv hiện tại là chủ hộ
            _sPrefAppModel.setIDTV(value.first.idtv!);
            NavigationServices.instance.navigateToP01_04(context);
            print(6);
          } else {
            if(value[value.indexWhere((e) => e.idtv == idtv) + 1].c01 == 1){ // tv tiếp theo là chủ hộ
              if(value[value.indexWhere((e) => e.idtv == idtv) + 1].idtv == value.last.idtv){ // tv tiếp theo là tv cuối cùng
                _sPrefAppModel.setIDTV(value[value.indexWhere((e) => e.idtv == idtv) + 1].idtv!);
                await _executeDatabase.checkDSH(idho).then((value) async {
                  if(value) {
                    print(1);
                    await _executeDatabase.setDSH(DoiSongHoModel(
                      idho: idho,
                      thangDT: data.thangDT,
                      namDT: data.namDT,
                    ));
                  }
                  NavigationServices.instance.navigateToP76_77(context);
                });
                print(7);
              } else { //tv tiếp theo ko phải cuối cùng
                _sPrefAppModel.setIDTV(value[value.indexWhere((e) => e.idtv == idtv) + 2].idtv!);
                NavigationServices.instance.navigateToP01_04(context);
                print(8);
              }
            } else {
              _sPrefAppModel.setIDTV(value[value.indexWhere((e) => e.idtv == idtv) + 1].idtv!);
              NavigationServices.instance.navigateToP01_04(context);
              print(9);
            }
          }
        }
      } else {
        await _executeDatabase.checkDSH(idho).then((value) async {
          if(value) {
            print(1);
            await _executeDatabase.setDSH(DoiSongHoModel(
              idho: idho,
              thangDT: data.thangDT,
              namDT: data.namDT,
            ));
          }
          NavigationServices.instance.navigateToP76_77(context);
        });
        print(10);
      }
    });
  }
}