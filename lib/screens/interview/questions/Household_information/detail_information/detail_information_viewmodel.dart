import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/bangke_model.dart';
import '../../../../../models/thongTinHo_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class DetailInformationViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  DetailInformationViewModel(this._executeDatabase, this._sPrefAppModel);
  thongTinHoModel data = thongTinHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  Future<void> fetchData() async {
    String id = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getHo(id).then((value) async => {
      data = value,
    });
  }

  void HouseholdBack() {
    NavigationServices.instance.navigateToGeneralInformation(context);
  }

  void HouseholdNext(String name,   String diachi) {
    String id = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    _executeDatabase.updateTTHo(name, diachi, id);
    NavigationServices.instance.navigateToQ1(context);
  }
}