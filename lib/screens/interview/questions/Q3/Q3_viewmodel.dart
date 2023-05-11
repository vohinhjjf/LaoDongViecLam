import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q3ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q3ViewModel(this._executeDatabase, this._sPrefAppModel);


  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void Q3Back() async {
    NavigationServices.instance.navigateToQ2(context);
  }
  void Q3Next() async {
    NavigationServices.instance.navigateToQ4(context);
  }
}