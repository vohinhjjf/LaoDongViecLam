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
  setBangKeHo(List data, int thangDT, int namDT) async {
    _database = await _dbProvider.database;
    for (int i = 0; i < data.length; i++) {
      var bangkeho = BangKeCsModel(
        idho: data[i].idho,
        idhO_TDT: data[i].idho,
        iddb: data[i].iddb,
        thangDT: thangDT,
        namDT: namDT,
        maTinh: data[i].maTinh,
        maHuyen: data[i].maHuyen,
        maXa: data[i].maXa,
        maDiaBan: data[i].maDiaBan,
        hoSo: data[i].hoSo,
        tenChuHo: data[i].tenChuHo,
        diaChi: data[i].diaChi,
        tsKhau: data[i].tsKhau,
        tsNu: data[i].tsNu,
        nhom: data[i].nhom,
        hoDuPhong: data[i].hoDuPhong,
        trangthai: data[i].trangthai,
        ngayTao: data[i].ngayTao,
        ghiChu: data[i].ghiChu,
        nguoiTao: data[i].nguoiTao,
        nguoiCapNhat: data[i].nguoiCapNhat,
        ngayCapNhat: data[i].ngayCapNhat,
        trangthai_BK: 1,
      );
      final result =
      await _database?.insert(TableConstants.household, bangkeho.toJson());
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

  setListBangKeThangDTModel(List data) async {
    _database = await _dbProvider.database;
    for (int i = 0; i < data.length; i++) {
      var bangke_thangdt = BangKeThangDTModel(
        idhO_BKE: data[i].idhO_BKE,
        namDT: data[i].namDT,
        thangDT: data[i].thangDT,
        trangThai: data[i].trangThai,
        sync: data[i].trangThai == 9 ? 1 : 0,
      );
      await _database?.insert(TableConstants.bangkeho_thangdt, bangke_thangdt.toJson());
    }
  }

  setBangKeThangDTModel(BangKeThangDTModel data) async {
    _database = await _dbProvider.database;
    await _database?.insert(TableConstants.bangkeho_thangdt, data.toJson());
  }

  updateTrangThaiBK(String id, int trangThai, int thangDT, int namDT) async {
    await _database?.rawUpdate(
        'UPDATE ${TableConstants.household} SET trangthai_BK = ? WHERE idho = ? AND thangDT = ? AND namDT = ?',
        [trangThai, id, thangDT, namDT]);
  }

  updateHoDuPhong(int nhom, int hoduphong, String id, int thangDT, int namDT) async {
    await _database?.rawUpdate(
        'UPDATE ${TableConstants.household} SET nhom = ?, hoDuPhong = ? WHERE idho = ? AND thangDT = ? AND namDT = ?',
        [nhom, hoduphong, id, thangDT, namDT]);
  }

  Future<List<BangKeCsModel>> getHouseHold(String query) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.household} WHERE $query");

    List<BangKeCsModel> list = (res ?? []).map((c) => BangKeCsModel.fromJson(c)).toList();
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
  Future<List<AreaModel>> getArea(int month, int namDT) async {
    _database = await _dbProvider.database;
    var res = await _database?.query(TableConstants.area,
        where: "namDT = ? AND thangDT = ?", whereArgs: [namDT, month]);
    print("object: ${res == null}");
    List<AreaModel> list = (res ?? []).map((c) => AreaModel.fromJson(c)).toList();

    return list;
  }

  //BangKe_ThangDT
  Future<List<BangKeThangDTModel>> getBangKe_ThangDT(int month) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.bangkeho_thangdt} WHERE thangDT = $month");

    List<BangKeThangDTModel> list = res!.isNotEmpty
        ? res.map((c) => BangKeThangDTModel.fromJson(c)).toList()
        : [];
    return list;
  }

  updateSync(String id, int sync, int thangDT, int namDT) async {
    await _database?.rawUpdate(
        'UPDATE ${TableConstants.bangkeho_thangdt} SET sync = ? WHERE idhO_BKE = ? AND thangDT = ? AND namDT = ?',
        [sync, id, thangDT, namDT]);
  }

  updateTrangThai(int trangThai, int sync, String id, int thangDT, int namDT) async {
    await _database?.rawUpdate(
        'UPDATE ${TableConstants.bangkeho_thangdt} SET trangThai = ?, sync = ? WHERE idhO_BKE = ? AND thangDT = ? AND namDT = ?',
        [trangThai, sync, id, thangDT, namDT]);
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
    List<thongTinHoModel> list = res!.isNotEmpty
        ? res.map((c) => thongTinHoModel.fromJson(c)).toList()
        : [];
    return list.first;
  }

  Future<List<thongTinHoModel>> getListHo(int month) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE thangDT = '$month'");
    List<thongTinHoModel> listHo = res!.isNotEmpty
        ? res.map((c) => thongTinHoModel.fromJson(c)).toList()
        : [];
    return listHo;
  }


  Future<bool> checkHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE idho = $idho");
    return res!.isEmpty;
  }

  updateTrangThaiHo(String id, int trangThai) async {
    await _database?.rawUpdate(
        'UPDATE ${TableConstants.thongtinho} SET trangThai = ? WHERE idho = ?',
        [trangThai, id]);
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

  updateNameNTKK(thongTinThanhVienNKTTModel data) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVienNKTT} SET q1_New = ? WHERE idtv = ? AND idho = ?',
        [data.q1_New, data.idtv, data.idho]);
  }

 updateNTKK(List<thongTinThanhVienNKTTModel> list) async {
   _database = await _dbProvider.database;
   for(var item in list) {
     await _database?.rawUpdate(
         'UPDATE ${TableConstants
             .thongTinThanhVienNKTT} SET q3A_New = ?, q3B_New = ?, q3C_New = ?, '
             'q3D_New = ? WHERE idtv = ? AND idho = ?',
         [item.q3A_New, item.q3B_New, item.q3C_New, item.q3D_New, item.idtv, item.idho]);
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

  deleteTTTV(String idho, int idtv, int namDT) async {
    await _database?.delete(TableConstants.thongTinThanhVien,
        where: 'idho = ? AND idtv = ? AND namDT = ?',
        whereArgs: [idho,idtv, namDT]);
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
  updateC00(String query, List? arguments) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .thongTinThanhVien} $query',
        arguments);
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

  updateDSH(String query, List? arguments) async {
    _database = await _dbProvider.database;
    await _database?.rawUpdate(
        'UPDATE ${TableConstants
            .DoiSongHo} $query',
        arguments);
  }

  Future<DoiSongHoModel> getDoiSongHo(String idho) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.DoiSongHo} WHERE idho = '$idho'");
    List<DoiSongHoModel> list_dsh = res!.isNotEmpty
        ? res.map((c) => DoiSongHoModel.fromJson(c)).toList()
        : [];
    return list_dsh.isEmpty ? DoiSongHoModel() : list_dsh.first;
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
      if (value.kinhDo != null && value.viDo != null) {check = true} else {check = false}
    });
    return check;
  }

  updateTimeKT(String idho, String ngayCapNhat, String thoigiankt, int tsnk,
      int tsnu, int nK_15, int nu_15) async {
    print(await _database?.rawUpdate(
        'UPDATE ${TableConstants.thongtinho} SET ngayCapNhat = ?, ngayKetThuc = ?,'
            ' tsnk = ?, tsnu = ?, nK_15 = ?, nu_15 = ? WHERE idho = ?',
        [ngayCapNhat, thoigiankt, tsnk, tsnu, nK_15, nu_15, idho]));
  }

  Future<List<BangKeThangDTModel>> getDongBo(String thang, int namDT) async {
    _database = await _dbProvider.database;
    var res = await _database?.query(TableConstants.bangkeho_thangdt,
        where: "trangThai = ? AND sync = ? AND thangDT = ? AND namDT = ?",
        whereArgs: [9, 0, thang, namDT]);
    List<BangKeThangDTModel> listBangKeHoThangDT = res!.isNotEmpty
        ? res.map((c) => BangKeThangDTModel.fromJson(c)).toList()
        : [];
    return listBangKeHoThangDT;
  }
}
