import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q1ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q1ViewModel(this._executeDatabase, this._sPrefAppModel);


  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void Q1Back() async {
    NavigationServices.instance.navigateToHouseHold(context);
  }
  void Q1Next() async {
    NavigationServices.instance.navigateToQ2(context);
  }
}