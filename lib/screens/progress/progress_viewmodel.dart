import 'package:flutter/cupertino.dart';
import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../services/api/sync_services.dart';
import '../../services/sqlite/execute_database.dart';

class ProgressViewModel extends BaseViewModel {
  final SyncServices _syncServices;
  final SPrefAppModel _sPrefAppModel;
  final ExecuteDatabase _executeDatabase;
  ProgressViewModel(this._syncServices, this._sPrefAppModel, this._executeDatabase);
  List data = [];
  String userName ="";

  @override
  void onInit(BuildContext context) async {
    super.onInit(context);
    final userModel = _sPrefAppModel.userModel;
    userName = userModel.userName ?? "";
    fetchData();
  }

  void fetchData() async {
    //await _executeDatabase.getDanhSachBangKeCs(1, "all").then((value) => data= value);
  }

  void progressBack() {
    NavigationServices.instance.navigateToBottomNavigation(context);
  }

  String lengthInterviewStatus(List data, int ttdt){
    List list = [];
    for (int i=0; i<data.length; i++){
      if(data[i].tinhTrangDT == ttdt){
        list.add(data[i]);
      }
    }
    return list.length.toString();
  }

  String lengthStatus(List data, int tthd){
    List list = [];
    for (int i=0; i<data.length; i++){
      if(data[i].tinhTrangHD == tthd && data[i].tinhTrangDT == 9){
        list.add(data[i]);
      }
    }
    return list.length.toString();
  }

  String lengthBangKeStatus(List data){
    List list = [];
    for (int i=0; i<data.length; i++){
      if(data[i].tinhTrangBK == 1 && data[i].tinhTrangDT == 9){
        list.add(data[i]);
      }
    }
    return list.length.toString();
  }
}