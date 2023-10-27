import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../base/base_viewmodel.dart';
import '../../components/navigation/navigation_service.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../models/user_model.dart';
import '../../services/api/auth_services.dart';
import '../../services/sqlite/execute_database.dart';

class LoginViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  final AuthServices _authServices;
  bool isPasswordValidate = false;

  LoginViewModel(this._authServices, this._sPrefAppModel, this._executeDatabase);

  late UserModel userModel;

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
  }

  Future<String> login(String userName, String password, String month) async {
    final response = await _authServices.login(userName, password);
    if (response != null) {
      print("có data");
      bool isAutoSync = userName != _sPrefAppModel.getUserName;
      userModel = UserModel.fromJson(response);
      await _sPrefAppModel.setUserModel(userModel);
      if (userModel.accessToken != null) {
        await _sPrefAppModel.setAccessToken(userModel.accessToken!);
         _sPrefAppModel.setUserName(userName);
         _sPrefAppModel.setPassWord(password);
        _sPrefAppModel.setMonth(month);
        _sPrefAppModel.setAutoSync(isAutoSync);
        if(isAutoSync) {
          await _executeDatabase.createDatabase();
        }
        return 'successfully';
      }
    }
    return 'failed';
  }

  void navigateToBottomNavigation(){
    NavigationServices.instance.navigateToBottomNavigation(context);
  }

 /* Future<void> writeCounter() async {
    List<DvhcModel> list = [];
    ByteData data = await rootBundle.load('assets/data/DM_DVHC.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        //if(list.contains(row))
        list.add(DvhcModel(
          tinh: row[0]!.value.toString(),
          maTinh: row[1]!.value.toString(),
          huyen: row[2]!.value.toString(),
          maHuyen: row[3]!.value.toString(),
          xa: row[4]?.value.toString() ?? "",
          maXa: row[5]?.value.toString() ?? "",
        ));
      }
    }
    await _executeDatabase.createDatabase().then((value)  => {
       _executeDatabase.setDvhc(list)
    });
  }*/
}
