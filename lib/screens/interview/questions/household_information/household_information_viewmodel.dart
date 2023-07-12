import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../models/bangke_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class HouseholdInformationViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  HouseholdInformationViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinHoModel data = thongTinHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  Future<void> fetchData() async {
    String id = await _sPrefAppModel.getIdCs;
    await _executeDatabase.getHo("99991001003").then((value) async => {
      data = value,
    });
  }

  void HouseholdBack() {
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void HouseholdNext(String name,   String diachi) {
    _executeDatabase.updateTTHo(name, diachi, "99991001003");
    NavigationServices.instance.navigateToQ1(context);
  }
}