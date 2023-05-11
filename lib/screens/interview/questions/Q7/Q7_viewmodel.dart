import 'package:flutter/cupertino.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class Q7ViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  Q7ViewModel(this._executeDatabase, this._sPrefAppModel);


  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  void Q7Back() async {
    NavigationServices.instance.navigateToQ6(context);
  }
  void Q7Next() async {
    //NavigationServices.instance.navigateToNguoiKhaiPhieu(context);
  }
}