import 'package:flutter/cupertino.dart';

import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../services/api/sync_services.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final SyncServices _syncServices;

  ChangePasswordViewModel(this._syncServices, this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  Future<String> changePass(String oldPassword, String newPassword) async {
    String nowPassword = await _sPrefAppModel.getPassword;
    if(oldPassword == nowPassword){
      _syncServices.DoiMatKhau(_sPrefAppModel.accessToken, _sPrefAppModel.getUserName, newPassword);
      return 'sucessfully';
    } else {
      return 'failed';
    }
    return '';
  }

  void logout() {
    NavigationServices.instance.navigateToLogin(context);
  }
}
