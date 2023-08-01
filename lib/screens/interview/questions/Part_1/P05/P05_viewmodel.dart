import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P05ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P05ViewModel(this._executeDatabase, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void P05Back() async {
    NavigationServices.instance.navigateToP01_04(context);
  }
  void P05Next() async {
    NavigationServices.instance.navigateToP06_07(context);
  }
}