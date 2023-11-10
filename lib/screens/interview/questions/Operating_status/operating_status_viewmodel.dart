
import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/models/thongTinThanhVien_model.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/area_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class OperatingStatusViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  OperatingStatusViewModel(this._sPrefAppModel, this._executeDatabase);
  var bangkeho = BangKeCsModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String id = '${_sPrefAppModel.getIdHo}';
    await _executeDatabase.getHouseHoldByIDHo(id).then((value) => bangkeho = value);
  }

   void operatingStatus(BangKeCsModel bangKeCsModel, int status) async {
     List<AreaModel> list_area = [];
     String id = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
     int thangDT = int.parse(_sPrefAppModel.month);
     int namDT = DateTime.now().year;
     await _executeDatabase.updateTrangThaiBK(_sPrefAppModel.getIdHo, status, thangDT, namDT);
     if(status == 5 || status == 6) {
      await _executeDatabase.checkHo(id).then((value0) async {
        if(value0) {
          await _executeDatabase.getArea(thangDT, namDT).then((value1) async {
            list_area = value1;
          });
          await _executeDatabase.getHouseHoldByIDHo(_sPrefAppModel.getIdHo).then((value) {
            _executeDatabase.setHo(
                thongTinHoModel(
                    idho: '${value.idho}$thangDT',
                    hoSo: value.hoSo,
                    namDT: namDT,
                    maTinh: value.maTinh,
                    maHuyen: value.maHuyen,
                    maXa: value.maXa,
                    maDiaBan: value.maDiaBan,
                    thangDT: thangDT,
                    ttnt: list_area.firstWhere((e) => e.iddb == value.iddb && e.thangDT == thangDT && e.namDT == namDT).ttnt,
                    tenChuHo: value.tenChuHo,
                    diachi: value.diaChi,
                    maDTV: _sPrefAppModel.getUserName,
                    trangThai: 2,
                    ngayPhongVan: DateTime.now().toString()
                )
            );
          });
        }else {
          await _executeDatabase.updateTrangThaiHo(id, 2);
        }
      });
      NavigationServices.instance.navigateToDetailInformation(context);
    }
     else {
      //await _executeDatabase.updateHoDuPhong(bangKeCsModel.nhom!, 1, id, bangKeCsModel.thangDT!, bangKeCsModel.namDT!);
       NavigationServices.instance.navigateToInterviewStatus(context);
     }
  }

  void operatingStatusBack() {
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}