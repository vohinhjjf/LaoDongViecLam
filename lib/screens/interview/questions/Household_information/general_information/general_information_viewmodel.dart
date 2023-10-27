import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/area_model.dart';
import '../../../../../models/bangke_model.dart';
import '../../../../../models/thongTinHo_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class GeneralInformationViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  GeneralInformationViewModel(this._executeDatabase, this._sPrefAppModel);
  var data = thongTinHoModel();
  var data_area = AreaModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    fetchData();
  }

  Future<void> fetchData() async {
    String month = _sPrefAppModel.month;
    String id = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getHo(id).then((value) async {
      data = value;
      await _executeDatabase.getArea(month).then((value1){
        data_area = value1.singleWhere((e) => e.maDiaBan == data.maDiaBan);
      });
    });
  }

  void GeneralBack() {
    NavigationServices.instance.navigateToOperatingStatus(context);
  }

  void GeneralNext() {
    NavigationServices.instance.navigateToDetailInformation(context);
  }
}