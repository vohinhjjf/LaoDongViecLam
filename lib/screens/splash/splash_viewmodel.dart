import 'package:flutter/material.dart';

import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';

class SplashViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  SplashViewModel(this._sPrefAppModel);

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    Future.delayed(const Duration(seconds: 3), () {
      /*final accessToken = _sPrefAppModel.accessToken;
      if (accessToken.isNotEmpty) {
        _sPrefAppModel.setAutoSync(false);
        NavigationServices.instance.navigateToHome(context);
      } else {
        NavigationServices.instance.navigateToLogin(context);
      }*/
      NavigationServices.instance.navigateToLogin(context);
    });
  }
}
