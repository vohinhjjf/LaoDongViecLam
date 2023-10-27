import 'package:sqflite/sqflite.dart';

import '../../models/area_model.dart';
import '../../models/bangkeThangDT_model.dart';
import '../../models/bangke_model.dart';
import '../../models/dichVuTaiChinh_model.dart';
import '../../models/doiSongHo_model.dart';
import '../../models/thongTinHoNKTT_model.dart';
import '../../models/thongTinHo_model.dart';
import '../../models/thongTinThanhVienNKTT_model.dart';
import '../../models/thongTinThanhVien_model.dart';
import 'db_provider.dart';
import 'table_constants.dart';



class ExecuteDatabase {
  final DbProvider _dbProvider;
  Database? _database;

  ExecuteDatabase(this._dbProvider);

  // Create database
  Future<void> createDatabase() async {
    await _dbProvider.initDatabase();
  }

  // Delete database
  Future<void> deleteDatabase() async {
    await _dbProvider.deleteDatabase();
  }
  //Bangke
  setBangKeHo(List data) async {
    _database = await _dbProvider.database;
    for (int i = 0; i < data.length; i++) {
      final result =
      await _database?.insert(TableConstants.household, data[i].toJson());
      print('setBangKeHo $result');
    }
  }

  setArea(List data) async {
    _database = await _dbProvider.database;
    for (int i = 0; i < data.length; i++) {
      final result =
      await _database?.insert(TableConstants.area, data[i].toJson());
      print('setArea $result');
    }
  }

  setBangKeThangDTModel(List data) async {
    _database = await _dbProvider.database;
    for (int i = 0; i < data.length; i++) {
      final result =
      await _database?.insert(TableConstants.bangkeho_thangdt, data[i].toJson());
      print('setArea $result');
    }
  }

  Future<List<BangKeCsModel>> getHouseHold(String iddb) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.household} WHERE iddb = $iddb");

    List<BangKeCsModel> list = res!.isNotEmpty
        ? res.map((c) => BangKeCsModel.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<BangKeCsModel> getHouseHoldByIDHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.household} WHERE idho = $idho");

    List<BangKeCsModel> list = res!.isNotEmpty
        ? res.map((c) => BangKeCsModel.fromJson(c)).toList()
        : [];
    return list.first;
  }

  //Area
  Future<List<AreaModel>> getArea(String month) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.area} WHERE thangDT = $month");

    List<AreaModel> list = res!.isNotEmpty
        ? res.map((c) => AreaModel.fromJson(c)).toList()
        : [];
    return list;
  }

  //BangKe_ThangDT
  setTrangThai(BangKeThangDTModel data) async {
    _database = await _dbProvider.database;
    await _database?.insert(TableConstants.bangkeho_thangdt, data.toJson());
  }

  Future<List<BangKeThangDTModel>> getBangKe_ThangDT(String month) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.bangkeho_thangdt} WHERE thangDT = $month");

    List<BangKeThangDTModel> list = res!.isNotEmpty
        ? res.map((c) => BangKeThangDTModel.fromJson(c)).toList()
        : [];
    return list;
  }

  updateTrangThai(String id) async {
   await _database?.rawUpdate(
        'UPDATE ${TableConstants.bangkeho_thangdt} SET trangThai = ? WHERE idhO_BKE = ?',
        [3, id]);
  }
  //Operating status
  setHo(thongTinHoModel data) async {
     _database = await _dbProvider.database;
     await _database?.insert(TableConstants.thongtinho, data.toJson());
   }

   updateTTHo(String name, String diachi, String id) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
               'UPDATE ${TableConstants.thongtinho} SET tenChuHo = ?, diachi = ? WHERE idho = ?',
               [name, diachi, id]);
   }

  Future<thongTinHoModel> getHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE idho = '$idho'");
    List<thongTinHoModel> listNKTT = res!.isNotEmpty
        ? res.map((c) => thongTinHoModel.fromJson(c)).toList()
        : [];
    return listNKTT.first;
  }

  Future<List<thongTinHoModel>> getListHo(String month) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE thangDT = '$month'");
    List<thongTinHoModel> listHo = res!.isNotEmpty
        ? res.map((c) => thongTinHoModel.fromJson(c)).toList()
        : [];
    return listHo;
  }

  Future<int> getStatusHo(String id) async {
    int status = 0;
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE idho = '$id'");
    if(res!.isNotEmpty) {
      List<thongTinHoModel> list = res.map((c) => thongTinHoModel.fromJson(c)).toList();
      status = list[0].trangThai ?? 0;
    }
    return status;
  }

  Future<bool> checkHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE idho = $idho");
    return res!.isEmpty;
  }

  //NKTT
  setHoNKTT(thongTinHoNKTTModel data) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinhoNKTT} WHERE idho = ${data.idho}");
    if(res!.isEmpty) {
      await _database?.insert(TableConstants.thongtinhoNKTT, data.toJson());
    }
  }

  updateHoNKTT(String query) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongtinhoNKTT} $query');
  }

  Future<thongTinHoNKTTModel> getHoNKTT(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinhoNKTT} WHERE idho = $idho");

    List<thongTinHoNKTTModel> listNKTT = res!.isNotEmpty
        ? res.map((c) => thongTinHoNKTTModel.fromJson(c)).toList()
        : [];
    return listNKTT.first;
  }

 setNKTT(thongTinThanhVienNKTTModel data) async {
   _database = await _dbProvider.database;
   List<Map<String, Object?>>? res = await _database?.rawQuery(
       "SELECT * FROM ${TableConstants.thongTinThanhVienNKTT} WHERE idho = ${data.idho} AND idtv = ${data.idtv}");
   if(res!.isEmpty) {
     await _database?.insert(
         TableConstants.thongTinThanhVienNKTT, data.toJson());
   }
 }
 Future<List<thongTinThanhVienNKTTModel>> getNKTT(int index, String question, String idho) async {
   _database = await _dbProvider.database;
   List<Map<String, Object?>>? res;
   if(index == 0) {
     res = await _database?.rawQuery(
         "SELECT * FROM ${TableConstants.thongTinThanhVienNKTT} WHERE idho = $idho");
   } else{
     res = await _database?.rawQuery(
         "SELECT * FROM ${TableConstants.thongTinThanhVienNKTT} WHERE $question = '${1}' AND idho = $idho");
   }

   List<thongTinThanhVienNKTTModel> listNKTT = res!.isNotEmpty
       ? res.map((c) => thongTinThanhVienNKTTModel.fromJson(c)).toList()
       : [];
   return listNKTT;
 }
 deleteNKTT(int id, String idho, int stt) async {
    if(stt == 0) {
      await _database?.delete(TableConstants.thongTinThanhVienNKTT,
          where: 'idho = ?', whereArgs: [idho]);
    } else {
      await _database?.delete(TableConstants.thongTinThanhVienNKTT,
          where: 'idtv = ? and idho = ?', whereArgs: [id, idho]);
    }
 }

 updateNTKK(List<thongTinThanhVienNKTTModel> list) async {
   _database = await _dbProvider.database;
   for(var item in list) {
     await _database?.rawUpdate(
         'UPDATE ${TableConstants
             .thongTinThanhVienNKTT} SET q3A_New = ?, q3B_New = ?, q3C_New = ?, '
             'q3D_New = ? WHERE idtv = ?',
         [item.q3A_New, item.q3B_New, item.q3C_New, item.q3D_New, item.idtv]);
   }
 }

  updateChuHo(int? q6_New, String idho, int idtv) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVienNKTT} SET q6_New = ? WHERE idtv = ? AND idho = ?',
        [q6_New, idtv, idho]);
  }

  //Part 1
  Future<List<thongTinThanhVienModel>> getListTTTV(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongTinThanhVien} WHERE idho = $idho");

    List<thongTinThanhVienModel> listTTTV = res!.isNotEmpty
        ? res.map((c) => thongTinThanhVienModel.fromJson(c)).toList()
        : [];
    return listTTTV;
  }

  Future<thongTinThanhVienModel> getTTTV(String idho, int idtv) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongTinThanhVien} WHERE idho = $idho AND idtv = $idtv");

    List<thongTinThanhVienModel> listTTTV = res!.isNotEmpty
        ? res.map((c) => thongTinThanhVienModel.fromJson(c)).toList()
        : [];
    return listTTTV.first;
  }

  /*Future<bool >checkTV(String idho, int idtv) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongTinThanhVien} WHERE idho = $idho AND idtv = $idtv");
    return res == null;
  }*/

  deleteTTTV(String idho) async {
    await _database?.delete(TableConstants.thongTinThanhVienNKTT,
        where: 'idho = ?', whereArgs: [idho]);
  }

  setTTTV(List<thongTinThanhVienModel> list) async {
    _database = await _dbProvider.database;
    for(var item in list) {
      List<Map<String, Object?>>? res = await _database?.rawQuery(
          "SELECT * FROM ${TableConstants.thongTinThanhVien} WHERE idho = ${item.idho} AND idtv = ${item.idtv}");
      print(res);
      if(res!.isEmpty) {
        await _database?.insert(
            TableConstants.thongTinThanhVien, item.toJson());
      }
    }
  }

  updateSTT(int? c01, String idho, int idtv) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVien} SET c01 = ? WHERE idho = ? AND idtv = ?',
        [c01, idho, idtv]);
  }
  updateC00(String name, String idho, int idtv) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVien} SET c00 = ? WHERE idho = ? AND idtv = ?',
        [name, idho, idtv]);
  }

  update(String query) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVien} $query');
  }

  updateDVTC(String query) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .DichVuTaiChinh} $query');
  }

  updateInformationProvider(thongTinHoModel data) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
    'UPDATE ${TableConstants
        .thongtinho} SET maNCC = ?, dienThoai = ? WHERE idho = ?',
    [data.maNCC, data.dienThoai, data.idho]);
  }
  //DoiSongHo
  Future<bool> checkDSH(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.DoiSongHo} WHERE idho = $idho");
    return res!.isEmpty;
  }

  setDSH(DoiSongHoModel data) async {
    _database = await _dbProvider.database;
    await _database?.insert(TableConstants.DoiSongHo, data.toJson());
  }

  updateDSH(String query) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .DoiSongHo} $query');
  }

  Future<DoiSongHoModel> getDoiSongHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.DoiSongHo} WHERE idho = '$idho'");
    List<DoiSongHoModel> list_dsh = res!.isNotEmpty
        ? res.map((c) => DoiSongHoModel.fromJson(c)).toList()
        : [];
    return list_dsh.first;
  }

  //GPS
  setGPS(double kinhdo, double vido, String idho) async {
    _database = await _dbProvider.database;
    print(await _database?.rawUpdate(
        'UPDATE ${TableConstants.thongtinho} SET kinhDo = ?, viDo = ?  WHERE idho = ?',
        [kinhdo, vido, idho]));
  }

  Future<bool> getKD_VD(String idho) async {
    var check = false;
    await getHo(idho).then((value) => {
      if (value.kinhDo != null) {check = true} else {check = false}
    });
    return check;
  }

  updateTimeKT(String idho, String ngayCapNhat, String thoigiankt) async {
    print(await _database?.rawUpdate(
        'UPDATE ${TableConstants.thongtinho} SET ngayCapNhat = ?, ngayKetThuc = ?, trangThai = ? WHERE idho = ?',
        [ngayCapNhat, thoigiankt, 9, idho]));
  }
}
