import 'package:flutter/cupertino.dart';
import 'package:lao_dong_viec_lam/models/bangkeThangDT_model.dart';
import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../models/area_model.dart';
import '../../models/bangke_model.dart';
import '../../models/thongTinHo_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class ProgressViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  ProgressViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);
  List<BangKeCsModel> list_bk = [];
  List<BangKeThangDTModel> list_bk_tdt = [];
  List<thongTinHoModel> list_ttho = [];
  List<AreaModel> list_area = [];
  String userName ="";
  int? thangDT;
  ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
    fetchData();
  }

  fetchData() async {
    thangDT = int.parse(_sPrefAppModel.month);
    int namdt = DateTime.now().year;
    String condition = "";
    if ((thangDT == 1 || thangDT == 2 || thangDT == 3) && namdt == 2023) {
      condition = "HoDuPhong = 0 AND (nhom = 9 OR nhom =10 OR nhom = 13 OR nhom =14) AND thangDT = $thangDT AND namDT = $namdt";
    } else if ((thangDT == 4 || thangDT == 5 || thangDT == 6) && namdt == 2023) {
      condition = "HoDuPhong = 0 AND (nhom = 10 OR nhom =11 OR nhom = 14 OR nhom =15) AND thangDT = $thangDT AND namDT = $namdt";
    } else if ((thangDT == 7 || thangDT == 8 || thangDT == 9) && namdt == 2023) {
      condition = "HoDuPhong = 0 AND (nhom = 11 OR nhom =12 OR nhom = 15 OR nhom =16) AND thangDT = $thangDT AND namDT = $namdt";
    } else if ((thangDT == 10 || thangDT == 11 || thangDT == 12) && namdt == 2023) {
      condition = "HoDuPhong = 0 AND (nhom = 12 OR nhom =13 OR nhom = 16 OR nhom =17) AND thangDT = $thangDT AND namDT = $namdt";
    }
    await _executeDatabase.getHouseHold(condition).then((value) => list_bk= value);
    await _executeDatabase.getArea(thangDT!, namdt).then((value1) async {
      list_area = value1;
    });
    await _executeDatabase.getBangKe_ThangDT(thangDT!).then((value) => list_bk_tdt= value);
    await _executeDatabase.getListHo(thangDT!).then((value) => list_ttho= value);
  }

  void progressBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }
}