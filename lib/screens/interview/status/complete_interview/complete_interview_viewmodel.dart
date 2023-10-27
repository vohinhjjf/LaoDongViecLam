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
    String iddb = _sPrefAppModel.IDDB;
    String month = _sPrefAppModel.month;
    await _executeDatabase.getHouseHold(iddb).then((value) => data= value);
    await _executeDatabase.getBangKe_ThangDT(month).then((value) {
      bangKeThangDTModel= value;
    });
  }

  /*Future<List<BangKeCsModel>> searchData(String name) =>
      _executeDatabase.getDanhSachBangKeCs(1, name);*/

  Future<void> getEnquiry(String id) async {
    late thongTinHoModel thongtinHoModel;
    late thongTinHoNKTTModel thongtinHoNKTTModel;
    final fetchResponse = await _syncServices.getEnquiry(_sPrefAppModel.accessToken, _sPrefAppModel.month, id);
    if (fetchResponse != null) {
      print("Get data: " + fetchResponse.toString());
      Map<String, dynamic> map = json.decode(json.encode(fetchResponse ?? {})) as Map<String, dynamic>;
      thongtinHoModel = thongTinHoModel.fromJson(map['thongTinHo']);
      thongtinHoNKTTModel = thongTinHoNKTTModel.fromJson(map['thongTinHoNKTT']);
      List list_nktt = map['lst_ThanhVienNKTT'].isNotEmpty ? map['lst_ThanhVienNKTT'] : [];
      List list_tv = map['lst_ThanhVien'].isNotEmpty ? map['lst_ThanhVien'] : [];
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
    } else{

    }
    await _executeDatabase.setHo(thongtinHoModel);
    //await _executeDatabase.setTimeBD(DateTime.now().toString(), id);
  }

  void CompleteInterview(BangKeCsModel bangKeCsModel) async {
    _sPrefAppModel.setIdHo(bangKeCsModel.idho!);

    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void CompleteInterviewBack() async {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}