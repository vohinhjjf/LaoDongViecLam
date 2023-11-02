import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class InterviewStatusViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  InterviewStatusViewModel(this._sPrefAppModel, this._executeDatabase);
  String userName ="";

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
  }



  Future<void> notInterviewed() async {
    NavigationServices.instance.navigateToNotInterviewed(context);
  }

  void backup() {
    NavigationServices.instance.navigateToBackup(context);
  }

  void completeInterview() {
    NavigationServices.instance.navigateToCompleteInterview(context);
  }

  void interviewStatusBack() {
    NavigationServices.instance.navigateToArea(context);
  }
}