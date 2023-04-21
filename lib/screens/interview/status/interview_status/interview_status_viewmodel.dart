import 'package:flutter/material.dart';

import '../../../../base/base_viewmodel.dart';
import '../../../../components/navigation/navigation_service.dart';
import '../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../services/sqlite/execute_database.dart';

class InterviewStatusViewModel extends BaseViewModel {
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  InterviewStatusViewModel(this._sPrefAppModel, this._executeDatabase);
  /*List<BangKeCsModel> list_notInterview = [];
  List<BangKeCsModel> list_Interviewing = [];
  List<BangKeCsModel> list_Complete = [];*/

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
  }


  /*Future<List<BangKeCsModel>> listNotInterviewed() async {
    return  await _executeDatabase.getDanhSachBangKeCs(1, '');
  }

  Future<List<BangKeCsModel>> listInterviewing() async {
    return  await _executeDatabase.getDanhSachBangKeCs(2, '');
  }

  Future<List<BangKeCsModel>> listCompleteInterview() async {
    return  await _executeDatabase.getDanhSachBangKeCs(9, '');
  }*/

  Future<void> notInterviewed() async {
    _sPrefAppModel.setInterviewStatus(1);
    NavigationServices.instance.navigateToNotInterviewed(context);
  }

  void interviewing() {
    _sPrefAppModel.setInterviewStatus(2);
    NavigationServices.instance.navigateToInterviewing(context);
  }

  void completeInterview() {
    _sPrefAppModel.setInterviewStatus(9);
    NavigationServices.instance.navigateToCompleteInterview(context);
  }

  void interviewStatusBack() {
    NavigationServices.instance.navigateToArea(context);
  }
}