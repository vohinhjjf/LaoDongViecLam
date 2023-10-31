import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/models/thongTinHoNKTT_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinHo_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinThanhVien_model.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../services/api/sync_services.dart';
import '../../../../services/sqlite/execute_database.dart';

class CompleteInterviewViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  final SyncServices _syncServices;
  CompleteInterviewViewModel(this._sPrefAppModel, this._executeDatabase, this._syncServices);
  List<BangKeCsModel> data = [];
  List<BangKeThangDTModel> bangKeThangDTModel = [];

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String month = _sPrefAppModel.month;
    QueryBangke();
    await _executeDatabase.getBangKe_ThangDT(month).then((value) {
      bangKeThangDTModel= value;
    });
  }

  QueryBangke() async {
    int thangdt = int.parse(_sPrefAppModel.month);
    String iddb = _sPrefAppModel.IDDB;
    String condition = "";
    int namdt = DateTime.now().year;
    if ((thangdt == 1 || thangdt == 2 || thangdt == 3) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (nhom = 9 OR nhom =10 OR nhom = 13 OR nhom =14) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 4 || thangdt == 5 || thangdt == 6) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (nhom = 10 OR nhom =11 OR nhom = 14 OR nhom =15) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 7 || thangdt == 8 || thangdt == 9) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (nhom = 11 OR nhom =12 OR nhom = 15 OR nhom =16) AND thangDT = $thangdt AND namDT = $namdt";
    } else if ((thangdt == 10 || thangdt == 11 || thangdt == 12) && namdt == 2023) {
      condition = "iddb = $iddb AND HoDuPhong = 0 AND (nhom = 12 OR nhom =13 OR nhom = 16 OR nhom =17) AND thangDT = $thangdt AND namDT = $namdt";
    }
    await _executeDatabase.getHouseHold(condition).then((value) => data= value);
  }

  Future<void> getEnquiry(String id, String namDT) async {
    late thongTinHoModel thongtinHoModel;
    late thongTinHoNKTTModel thongtinHoNKTTModel;
    final fetchResponse = await _syncServices.getEnquiry(_sPrefAppModel.accessToken, _sPrefAppModel.month, namDT, id);
    if (fetchResponse != null) {
      print("Get data: " + fetchResponse.toString());
      Map<String, dynamic> map = json.decode(json.encode(fetchResponse ?? {})) as Map<String, dynamic>;
      thongtinHoModel = thongTinHoModel.fromJson(map['thongTinHo']);
      thongtinHoNKTTModel = thongTinHoNKTTModel.fromJson(map['thongTinHoNKTT']);
      List list_nktt = map['lst_ThanhVienNKTT'].isNotEmpty ? map['lst_ThanhVienNKTT'] : [];
      List list_tv = map['lst_ThanhVien'].isNotEmpty ? map['lst_ThanhVien'] : [];
      await _executeDatabase.setHo(thongtinHoModel);
      await _executeDatabase.setHoNKTT(thongtinHoNKTTModel);
      await _executeDatabase.getNKTT(0, '', id).then((value) async {
        if(value.length != list_nktt.length){
          await _executeDatabase.deleteNKTT(0, id, 0);
          for(var element in list_nktt) {
            await _executeDatabase.setHoNKTT(thongTinHoNKTTModel.fromJson(element));
          }
        }
      });
      await _executeDatabase.getListTTTV(id).then((value) async {
        if(value.length != list_tv.length){
          await _executeDatabase.deleteTTTV(id);
          await _executeDatabase.setTTTV(list_tv.map((e) => thongTinThanhVienModel.fromJson(e)).toList());
        }
      });
    }
    //await _executeDatabase.setTimeBD(DateTime.now().toString(), id);
  }

  void CompleteInterview(BangKeThangDTModel bangKeThangDTModel) async {
    await _sPrefAppModel.setIdHo(bangKeThangDTModel.idhO_BKE!);
    if(bangKeThangDTModel.trangThai == 9 && bangKeThangDTModel.sync == 1) {
      await getEnquiry(bangKeThangDTModel.idhO_BKE!, bangKeThangDTModel.namDT!.toString());
    }
    await _executeDatabase.updateTrangThai(bangKeThangDTModel.idhO_BKE!, 8, bangKeThangDTModel.thangDT!, bangKeThangDTModel.namDT!);
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void CompleteInterviewBack() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}