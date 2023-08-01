import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P10_12ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P10_12ViewModel(this._executeDatabase, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void P10_12Back() async {
    NavigationServices.instance.navigateToP08_09(context);
  }
  void P10_12Next() async {
    //NavigationServices.instance.navigateToQ5(context);
  }
}