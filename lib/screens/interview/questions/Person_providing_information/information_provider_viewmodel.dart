import 'package:flutter/cupertino.dart';

import '../../../../../base/base_viewmodel.dart';
import '../../../../../components/navigation/navigation_service.dart';
import '../../../../../data/shared_preferences/spref_app_model.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../services/sqlite/execute_database.dart';
import '../../../../models/thongTinHo_model.dart';

class InformationProviderViewModel extends BaseViewModel {
  final ExecuteDatabase _executeDatabase;
  final SPrefAppModel _sPrefAppModel;
  InformationProviderViewModel(this._executeDatabase, this._sPrefAppModel);
  List<thongTinThanhVienNKTTModel> list = [];
  List<Map<String, int>> list_map = [];
  var thongTinHo = thongTinHoModel();

  @override
  void onInit(BuildContext context) {
    super.onInit(context);
    getListNKTT();
  }

  getListNKTT() async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.getNKTT(0, "", idho).then((value) {
      list = value;
      logic(value);
    });
    await _executeDatabase.getHo(idho).then((value) => thongTinHo = value);
  }

  void logic(List<thongTinThanhVienNKTTModel> list_nktt){
    var toRemove = [];
    List<Map<String, int>> list_map_1 = [];
    for(var item in list_nktt){
      if(item.q3A_New == 1 || item.q3B_New == 1 || item.q3C_New == 1
          || item.q3D_New == 1){
        toRemove.add(item);
      }
    }
    list.removeWhere((e) => toRemove.contains(e));
    for(int i = 0; i < list.length; i++){
      list_map_1.add({
        list[i].q1_New! : i + 1,
      });
    }
    list_map_1.add({
      "Không phải thành viên của hộ" : 87
    });
    list_map = list_map_1;
  }

  void InformationProviderBack() async {
    NavigationServices.instance.navigateToP84(context);
  }

  void InformationProviderNext(String dienThoai, String maNCC) async {
    String idho = '${_sPrefAppModel.getIdHo}${_sPrefAppModel.month}';
    await _executeDatabase.updateInformationProvider(thongTinHoModel(
      idho: idho,
      dienThoai: dienThoai,
      maNCC: maNCC
    ));
    NavigationServices.instance.navigateToGPS(context);
  }
}