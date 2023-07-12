import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/shared_preferences/spref_app_model.dart';
import '../../network/app_injection.dart';
import 'table_constants.dart';

class DbProvider {
  DbProvider._();

  static final DbProvider db = DbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    await initDatabase();
    return _database;
  }


  Future initDatabase() async {
    final SPrefAppModel sPrefAppModel = getIt.get<SPrefAppModel>();
    final userName = sPrefAppModel.getUserName;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,"DTV99003","DTV99003.db");
    _database = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE ${TableConstants.bangkeho} ("
              "idho TEXT PRIMARY KEY,"
              "idhO_TDT INTEGER,"
              "tinh TEXT,"
              "huyen TEXT,"
              "xa TEXT,"
              "tenCS TEXT,"
              "diaChi TEXT,"
              "dienThoai TEXT,"
              "email TEXT,"
              "loaiCS INTEGER,"
              "loaiTG INTEGER,"
              "loaiTGKH TEXT,"
              "chiPhi INTEGER,"
              "dieuTraVien TEXT,"
              "tinhTrangHD INTEGER,"
              "tinhTrangBK INTEGER,"
              "tinhTrangDT INTEGER,"
              "nguoiThem TEXT,"
              "ngayThem TEXT,"
              "nguoiCapNhat TEXT,"
              "ngayCapNhat TEXT"
              ")");
          await db.execute("CREATE TABLE ${TableConstants.thongtinho} ("
              "idho TEXT PRIMARY KEY,"
              "namDT INTEGER,"
              "maTinh TEXT,"
              "maHuyen TEXT,"
              "maXa TEXT,"
              "maDiaBan TEXT,"
              "hoSo TEXT,"
              "thangDT INTEGER,"
              "ttnt INTEGER,"
              "tenChuHo TEXT,"
              "diachi TEXT,"
              "maDTV TEXT,"
              "ngayKetThuc TEXT,"
              "ngayPhongVan TEXT,"
              "kinhDo INTEGER,"
              "viDo INTEGER,"
              "trangThai INTEGER,"
              "dienThoai TEXT,"
              "tsnk INTEGER,"
              "tsnu INTEGER,"
              "nK_15 INTEGER,"
              "nu_15 INTEGER,"
              "maNCC TEXT,"
              "duyetho INTEGER,"
              "nguoiTao TEXT,"
              "ngayTao TEXT,"
              "nguoiCapNhat TEXT,"
              "ngayCapNhat TEXT,"
              "thoiGianNhap TEXT,"
              "version TEXT"
              ")");
      await db.execute("CREATE TABLE ${TableConstants.thongTinThanhVienNKTT} ("
          "idho TEXT,"
          "idtv INTEGER,"
          "thangDT INTEGER,"
          "namDT INTEGER,"
          "q1 TEXT,"
          "q1_New TEXT,"
          "q2 INTEGER,"
          "q2_New INTEGER,"
          "q3 INTEGER,"
          "q3A_New INTEGER,"
          "q3B_New INTEGER,"
          "q3C_New INTEGER,"
          "q3D_New INTEGER,"
          "q4A_New INTEGER,"
          "q4B_New INTEGER,"
          "q4C_New INTEGER,"
          "q4D_New INTEGER,"
          "q4E_New INTEGER,"
          "q4F_New INTEGER,"
          "q5 INTEGER,"
          "q5_New INTEGER,"
          "q6_New INTEGER"
          ")");
    });
  }

  Future deleteDatabase() async {
    final SPrefAppModel sPrefAppModel = getIt.get<SPrefAppModel>();
    final userName = sPrefAppModel.getUserName;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$userName.db");
    await databaseFactory.deleteDatabase(path);
  }
}
