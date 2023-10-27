import 'package:flutter/cupertino.dart';
import 'package:lao_dong_viec_lam/models/bangkeThangDT_model.dart';
import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
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
  String userName ="";
  ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
    fetchData();
  }

  void fetchData() async {
    String iddb = _sPrefAppModel.IDDB;
    String month = _sPrefAppModel.month;
    await _executeDatabase.getHouseHold(iddb).then((value) => list_bk= value.where((e) => e.hoDuPhong == 0).toList());
    await _executeDatabase.getBangKe_ThangDT(month).then((value) => list_bk_tdt= value);
    await _executeDatabase.getListHo(month).then((value) => list_ttho= value);
  }

  void progressBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }
}