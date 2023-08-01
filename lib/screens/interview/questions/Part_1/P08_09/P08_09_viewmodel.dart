import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P08_09ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P08_09ViewModel(this._executeDatabase, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void P08_09Back() async {
    NavigationServices.instance.navigateToP06_07(context);
  }
  void P08_09Next() async {
    NavigationServices.instance.navigateToP10_12(context);
  }
}