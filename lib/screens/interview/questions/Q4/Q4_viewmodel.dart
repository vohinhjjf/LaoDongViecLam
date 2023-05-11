import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q4ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q4ViewModel(this._executeDatabase, this._sPrefAppModel);


  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void Q4Back() async {
    NavigationServices.instance.navigateToQ3(context);
  }
  void Q4Next() async {
    NavigationServices.instance.navigateToQ5(context);
  }
}