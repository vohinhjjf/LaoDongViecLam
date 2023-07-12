import 'package:sqflite/sqflite.dart';

import '../../models/thongTinHo_model.dart';
import '../../models/thongTinThanhVienNKTT_model.dart';
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
  Future<thongTinHoModel> getHo(String id) async {
    _database = await _dbProvider.database;
    List<Map<String, Object?>>? res;
    res = await _database?.rawQuery(
        "SELECT * FROM ${TableConstants.thongtinho} WHERE idho = '$id'");
    List<thongTinHoModel> listNKTT = res!.isNotEmpty
        ? res.map((c) => thongTinHoModel.fromJson(c)).toList()
        : [];
    return listNKTT.first;
  }
  //NKTT
 setNKTT(thongTinThanhVienNKTTModel data) async {
   _database = await _dbProvider.database;
   await _database?.insert(TableConstants.thongTinThanhVienNKTT, data.toJson());
 }
 Future<List<thongTinThanhVienNKTTModel>> getNKTT() async {
   _database = await _dbProvider.database;
   List<Map<String, Object?>>? res;
   res = await _database?.rawQuery(
       "SELECT * FROM ${TableConstants.thongTinThanhVienNKTT}");
   List<thongTinThanhVienNKTTModel> listNKTT = res!.isNotEmpty
       ? res.map((c) => thongTinThanhVienNKTTModel.fromJson(c)).toList()
       : [];
   return listNKTT;
 }
  //DVHC
 //  setDvhc(List<DvhcModel> data) async {
 //    _database = await _dbProvider.database;
 //    for (int i = 0; i < data.length; i++) {
 //       await _database?.insert(TableConstants.dmDvhc, data[i].toJson());
 //    }
 //  }
 //
 //  Future<DvhcModel> getDvhc(String maXa) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.dmDvhc} WHERE maXa = '$maXa'");
 //    List<DvhcModel> listDvhc = res!.isNotEmpty
 //        ? res.map((c) => DvhcModel.fromJson(c)).toList()
 //        : [];
 //    return listDvhc.first;
 //  }
 //
 //  Future<List<DvhcModel>> getListDvhc() async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.dmDvhc}");
 //    List<DvhcModel> listDvhc = res!.isNotEmpty
 //        ? res.map((c) => DvhcModel.fromJson(c)).toList()
 //        : [];
 //    return listDvhc;
 //  }
 //
 // //Bang ke
 //  Future<List<BangKeCsModel>> getDanhSachBangKeCs(int tinhtrangdt, String ten) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    if (ten == '') {
 //      // res = await _database?.rawQuery(
 //      //     "SELECT * FROM BangKeHo WHERE TINHTRANGDTRA=?", [tinhtrangdt]);
 //      res = await _database?.rawQuery(
 //          "SELECT * FROM ${TableConstants.bangkecs} WHERE tinhTrangDT='$tinhtrangdt'");
 //    } else if(ten == 'all') {
 //      res = await _database?.rawQuery(
 //          "SELECT * FROM ${TableConstants.bangkecs}");
 //    }
 //    else {
 //      res = await _database?.rawQuery(
 //          "SELECT * FROM ${TableConstants.bangkecs} WHERE tinhTrangDT='$tinhtrangdt' AND tenCS LIKE '$ten%'");
 //    }
 //    List<BangKeCsModel> listBangKeHo = res!.isNotEmpty
 //        ? res.map((c) => BangKeCsModel.fromJson(c)).toList()
 //        : [];
 //    return listBangKeHo;
 //  }
 //  Future<BangKeCsModel> getBangKeCs(String id) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.bangkecs} WHERE id='$id'");
 //    List<BangKeCsModel> listBangKeHo = res!.isNotEmpty
 //        ? res.map((c) => BangKeCsModel.fromJson(c)).toList()
 //        : [];
 //    return listBangKeHo.first;
 //  }
 //  setBangKeCs(List data) async {
 //    _database = await _dbProvider.database;
 //    for (int i = 0; i < data.length; i++) {
 //      final result = await _database?.insert(TableConstants.bangkecs, data[i].toJson());
 //      print('setBangKeHo $result');
 //    }
 //  }
 //  addBangkeCs(BangKeCsModel bangKeCsModel) async {
 //    _database = await _dbProvider.database;
 //    await _database?.insert(TableConstants.bangkecs, bangKeCsModel.toJson());
 //  }
 //
 //  updateBangkeCs(BangKeCsModel bangKeCsModel) async {
 //    _database = await _dbProvider.database;
 //    await _database?.update(TableConstants.bangkecs, bangKeCsModel.toJson(),
 //        where: 'id = ?', whereArgs: [bangKeCsModel.id]);
 //  }
 //  //
 //  //Status activity
 //  setTinhTrangDT(int statusDT, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.bangkecs} SET tinhTrangBK = ?, tinhTrangDT = ? WHERE id = ?',
 //        [0, statusDT, id]));
 //  }
 //  setTimeBD(String thoigianbd, String id) async {
 //    _database = await _dbProvider.database;
 //    await getPhieutongiao(id).then((value) async {
 //      if(value.ngayPhongVan == null){
 //        print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET ngayPhongVan = ?, tinhtrang_DT = ? WHERE id = ?',
 //        [thoigianbd, 2, id]));
 //      } else {
 //        print(await _database?.rawUpdate(
 //            'UPDATE ${TableConstants.phieutongiao} SET ngayCapNhat = ? WHERE id = ?',
 //            [thoigianbd, id]));
 //      }
 //    });
 //  }
 //  setTinhTrangCs(int status, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.bangkecs} SET tinhTrangHD = ? WHERE id = ?',
 //        [status, id]));
 //  }
 //
 //  Future<int> getTinhTrangCs(String id) async {
 //    _database = await _dbProvider.database;
 //    var res = await _database?.query(TableConstants.bangkecs,
 //        where: 'id = ?', whereArgs: [id]);
 //    var status = res!.first['tinhTrangHD'] as int;
 //    return status;
 //  }
 //  //
 //  //base information
 //  setA1_1_4(String name, String address ,String phone, String email, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.bangkecs} SET tenCS = ?, diaChi = ?, dienThoai = ?, email = ? WHERE id = ?',
 //        [name, address, phone, email, id]));
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET tenCS = ?, thon = ?, dienThoai = ?, email = ? WHERE id = ?',
 //        [name, address, phone, email, id]));
 //  }
 //  //
 //  //head base
 //  setA1_5(String name, String dignitaries,int gender, int birthYear, String id, String nation, int TDCM) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a15_ten = ?, a15_phamSac = ?, a15_gioiTinh = ?, a15_namSinh = ?, a15_danToc = ?, a15_TDCM = ? WHERE id = ?',
 //        [name, dignitaries, gender, birthYear, nation, TDCM, id]));
 //  }
 //  Future<int> getRawQueryPhieutongiao(String id) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.phieutongiao} WHERE id='$id'");
 //    List<PhieuTonGiaoModel> listPhieutongiao = res!.isNotEmpty
 //        ? res.map((c) => PhieuTonGiaoModel.fromJson(c)).toList()
 //        : [];
 //    return listPhieutongiao.length;
 //  }
 //  Future<PhieuTonGiaoModel> getPhieutongiao(String id) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.phieutongiao} WHERE id='$id'");
 //    List<PhieuTonGiaoModel> listPhieutongiao = res!.isNotEmpty
 //        ? res.map((c) => PhieuTonGiaoModel.fromJson(c)).toList()
 //        : [];
 //    print(res.isNotEmpty.toString());
 //    return listPhieutongiao.first;
 //  }
 //  Future<void> setListPhieu(List<PhieuTonGiaoModel> data) async {
 //    _database = await _dbProvider.database;
 //    for (int i = 0; i < data.length; i++) {
 //      final result = await _database?.insert(TableConstants.phieutongiao, data[i].toJson());
 //      print('setListPhieu $result');
 //    }
 //  }
 //  //
 //  // A_16
 //  setA16_loaiCs(int loaics, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a16_loaiCS = ? WHERE id = ?',
 //        [loaics, id]));
 //  }
 //  //
 //  // A_17
 //  setA17_loaiTG(int? loaiTG, String ghiro, String id) async {
 //    _database = await _dbProvider.database;
 //
 //    if(loaiTG == 17){
 //      await _database?.rawUpdate(
 //          'UPDATE ${TableConstants.phieutongiao} SET a17_loaiTG = ?, a17_ghiRo = ? WHERE id = ?',
 //          [17,ghiro, id]);
 //    }else {
 //      print(await _database?.rawUpdate(
 //          'UPDATE ${TableConstants.phieutongiao} SET a17_loaiTG = ?, a17_ghiRo = ? WHERE id = ?',
 //          [loaiTG, null, id]));
 //    }
 //  }
 //  //
 //  //A1_18
 //  setA18(int a18_1, int a18_2,int a18_3, String id) async {
 //    _database = await _dbProvider.database;
 //    if (a18_1 == 1) {
 //        await _database?.rawUpdate(
 //          'UPDATE ${TableConstants.phieutongiao} SET a18_1 = ? WHERE id = ?',
 //          [1, id]);
 //        await _database?.rawUpdate(
 //            'UPDATE ${TableConstants.phieutongiao} SET a18_2 = ? WHERE id = ?',
 //            [null, id]);
 //        await _database?.rawUpdate(
 //            'UPDATE ${TableConstants.phieutongiao} SET a18_3 = ? WHERE id = ?',
 //            [null, id]);
 //      }else {
 //        await _database?.rawUpdate(
 //            'UPDATE ${TableConstants.phieutongiao} SET a18_1 = ? WHERE id = ?',
 //            [2, id]);
 //        await _database?.rawUpdate(
 //          'UPDATE ${TableConstants.phieutongiao} SET a18_2 = ? WHERE id = ?',
 //          [a18_2, id]);
 //        await _database?.rawUpdate(
 //          'UPDATE ${TableConstants.phieutongiao} SET a18_3 = ? WHERE id = ?',
 //          [a18_3, id]);
 //      }
 //  }
 //  //
 //  //A21
 //  setA21(int a21, int a21_nu, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a21 = ?, a21_nu = ? WHERE id = ?',
 //        [a21, a21_nu, id]));
 //  }
 //  //
 //  //A21
 //  setA22(int a22_01, int a22_02,int a22_03,int a22_04, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a22_01 = ?, a22_02 = ?, a22_03 = ?, a22_04 = ? WHERE id = ?',
 //        [a22_01, a22_02,a22_03,a22_04, id]));
 //  }
 //  //
 //  //A3
 //  setA3(double a31, double a32, double a32_1, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a31 = ?, a32 = ?, a32_1 = ?  WHERE id = ?',
 //        [a31, a32, a32_1, id]));
 //  }
 //  //
 //  //A4_1
 //  setA41_1(double a41, double a41_02, double a41_03, double a41_04, double a41_05, double a41_06,
 //      double a41_07, String id) async {
 //    _database = await _dbProvider.database;
 //    await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a41_01 = ?, a41_02 = ?, a41_03 = ?, a41_04 = ?, a41_05 = ?, a41_06 = ?,a41_07 = ? WHERE id = ?',
 //        [a41, a41_02, a41_03, a41_04,a41_05, a41_06, a41_07, id]);
 //    print(a41);
 //  }
 //  setA41_2(double a41_08, double a41_09, double a41_10,String a41_ghiRo, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a41_08 = ?, a41_09 = ?,a41_10 = ?, a41_ghiRo = ? WHERE id = ?',
 //        [a41_08,a41_09, a41_10, a41_ghiRo, id]));
 //  }
 //  //
 //  //A4_2
 //  setA4_2(int a42, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET a42 = ?  WHERE id = ?',
 //        [a42, id]));
 //  }
 //  //
 //  //A4_3
 //  setA4_3(ActivityModel data) async {
 //    _database = await _dbProvider.database;
 //      await _database?.insert(TableConstants.phieutongiaoA43, data.toJson());
 //  }
 //
 //  updateA4_3(ActivityModel data) async {
 //    _database = await _dbProvider.database;
 //    // print(await _database?.rawUpdate(
 //    //     'UPDATE ${TableConstants.phieutongiaoA43} SET id = ? AND stt = ?',
 //    //     [data.id, data.stt]));
 //    await _database?.update(TableConstants.phieutongiaoA43, data.toJson(),
 //        where: 'id = ? AND stt = ?', whereArgs: [data.id, data.stt]);
 //  }
 //
 //  deleteA4_3(String id, int stt) async {
 //    _database = await _dbProvider.database;
 //    if( stt == 0){
 //      await _database?.delete(TableConstants.phieutongiaoA43,
 //          where: 'id = ?', whereArgs: [id]);
 //    }else {
 //      await _database?.delete(TableConstants.phieutongiaoA43,
 //          where: 'id = ? AND stt = ?', whereArgs: [id, stt]);
 //    }
 //  }
 //
 //  Future<List<ActivityModel>> getListPhieutongiaoA43(String id) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.phieutongiaoA43} WHERE id='$id'");
 //    List<ActivityModel> listPhieutongiaoA43 = res!.isNotEmpty
 //        ? res.map((c) => ActivityModel.fromJson(c)).toList()
 //        : [];
 //    return listPhieutongiaoA43;
 //  }
 //
 //  Future<ActivityModel> getPhieutongiaoA43(String id, int stt) async {
 //    _database = await _dbProvider.database;
 //    List<Map<String, Object?>>? res;
 //    res = await _database?.rawQuery(
 //        "SELECT * FROM ${TableConstants.phieutongiaoA43} WHERE id='$id' AND stt='$stt' ");
 //    ActivityModel phieutongiaoA43 = res!.isNotEmpty
 //        ? res.map((c) => ActivityModel.fromJson(c)).toList().first
 //        : ActivityModel();
 //    return phieutongiaoA43;
 //  }
 //  //
 //  //Nguoi khai phieu
 //  setNguoiKhaiPhieu(String hoten, String dienthoai, String email, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET hoten_TL = ?, dienthoai_TL = ?, email_TL = ?  WHERE id = ?',
 //        [hoten,dienthoai,email,id]));
 //  }
 //  //
 //  //GPS
 //  setGPS(double kinhdo, double vido, String id) async {
 //    _database = await _dbProvider.database;
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET kinhDo = ?, viDo = ?  WHERE id = ?',
 //        [kinhdo,vido,id]));
 //  }
 //  Future<bool> getKD_VD (String id) async {
 //    var check = false;
 //    await _database?.query(TableConstants.phieutongiao,
 //        columns: ['kinhDo'], where: "id = ?", whereArgs: [id])
 //        .then((value) => {
 //      if(value == null){
 //        check =true
 //      }
 //      else {
 //        check =false
 //      }
 //    });
 //    return check;
 //  }
 //  updateTimeKT(String id,String ngayCapNhat, String thoigiankt, int tinhtrang_dt) async {
 //    print(await _database?.rawUpdate(
 //        'UPDATE ${TableConstants.phieutongiao} SET DTV = ?, ngayCapNhat = ?, ngayKetThuc = ?, tinhtrang_DT = ?, trangThai = ? WHERE id = ?',
 //        ["D01T005",ngayCapNhat, thoigiankt, tinhtrang_dt, 1, id]));
 //  }
 //  //
 //  //SYNC
 //  updateTTBK(int status, String id) async{
 //    _database = await _dbProvider.database;
 //    await _database?.rawUpdate(
 //    'UPDATE ${TableConstants.bangkecs} SET tinhTrangBK = ? WHERE id = ?',
 //    [status, id]);
 //  }
 //  Future<List<BangKeCsModel>>  getDongBo() async {
 //    _database = await _dbProvider.database;
 //    var res = await _database?.query(TableConstants.bangkecs,
 //        where: "tinhTrangBK = ? AND tinhTrangDT = ?",
 //        whereArgs: [0, 9]);
 //    List<BangKeCsModel> listBangKeHo = res!.isNotEmpty
 //        ? res.map((c) => BangKeCsModel.fromJson(c)).toList()
 //        : [];
 //    return listBangKeHo;
 //  }
}
