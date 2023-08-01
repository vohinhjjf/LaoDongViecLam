import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P06_07ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P06_07ViewModel(this._executeDatabase, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void P06_07Back() async {
    NavigationServices.instance.navigateToP05(context);
  }
  void P06_07Next() async {
    NavigationServices.instance.navigateToP08_09(context);
  }
}