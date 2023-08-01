import 'package:flutter/material.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../services/sqlite/execute_database.dart';

class P01_04ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  P01_04ViewModel(this._executeDatabase, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void P01_04Back() async {
    NavigationServices.instance.navigateToQ7(context);
  }
  void P01_04Next() async {
    NavigationServices.instance.navigateToP05(context);
  }
}