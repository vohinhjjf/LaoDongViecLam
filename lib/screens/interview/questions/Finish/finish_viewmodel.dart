import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:LDVL2024/models/bangkeThangDT_model.dart';

import '../../../../base/base_logic.dart';
import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../components/uis.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/doiSongHo_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../models/thongTinThanhVien_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class FinishViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  FinishViewModel(this._executeDatabase, this._sPrefAppModel);
  var thongtintv = thongTinThanhVienModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  void fetchData() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getTTTV(idho, _sPrefAppModel.IDTV).then((value) => thongtintv = value);
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

  void finishBack(thongTinThanhVienModel tttv) {
    if (!checkSelectCodeBack(tttv)) {
      print("true");
    } else {
      NavigationServices.instance.navigateToInformationProvider(context);
    }
  }

  void finish() async {
    String idho = _sPrefAppModel.getIdHo;
    int month = int.parse(_sPrefAppModel.month);
    int year = DateTime.now().year;
    await _executeDatabase.getBangKe_ThangDT(month).then((value) async {
      if(value.any((e) => e.idhO_BKE == idho)){
        await _executeDatabase.updateTrangThai(9, 0, idho, month, year);
      } else {
        await _executeDatabase.setBangKeThangDTModel(BangKeThangDTModel(
            idhO_BKE: idho,
            namDT: year,
            thangDT: month,
            trangThai: 9,
            sync: 0
        ));
      }
    });
    NavigationServices.instance.navigateToInterviewStatus(context);
  }
}