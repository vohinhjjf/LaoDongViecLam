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
        await db.execute("CREATE TABLE ${TableConstants.thongTinThanhVien} ("
            "idho TEXT,"
            "idtv INTEGER,"
            "stt TEXT,"
            "thangDT INTEGER,"
            "namDT INTEGER,"
            "c00 TEXT,"
            "c01 INTEGER,"
            "c01K TEXT,"
            "c02 INTEGER,"
            "c03A TEXT,"
            "c03B TEXT,"
            "c04 INTEGER,"
            "c04A INTEGER,"
            "c05 INTEGER,"
            "c06A TEXT,"
            "c06B TEXT,"
            "c07 INTEGER,"
            "c08 INTEGER,"
            "c09 INTEGER,"
            "c09A TEXT,"
            "c09B TEXT,"
            "c10 INTEGER,"
            "c10M INTEGER,"
            "c10_MK TEXT,"
            "c11 INTEGER,"
            "c12 INTEGER,"
            "c13 INTEGER,"
            "c14A INTEGER,"
            "c14B INTEGER,"
            "c14C INTEGER,"
            "c14D INTEGER,"
            "c14E INTEGER,"
            "c14F INTEGER,"
            "c15A TEXT,"
            "c15B TEXT,"
            "c15C INTEGER,"
            "c16A INTEGER,"
            "c16B INTEGER,"
            "c16C INTEGER,"
            "c17 INTEGER,"
            "c18 INTEGER,"
            "c19 INTEGER,"
            "c20 INTEGER,"
            "c21 INTEGER,"
            "c21K TEXT,"
            "c22 INTEGER,"
            "c23 INTEGER,"
            "c24 INTEGER,"
            "c25 INTEGER,"
            "c25K TEXT,"
            "c26 INTEGER,"
            "c27 INTEGER,"
            "c28 INTEGER,"
            "c29 INTEGER,"
            "c30 INTEGER,"
            "c30_A INTEGER,"
            "c30_B INTEGER,"
            "c30_C INTEGER,"
            "c30_D INTEGER,"
            "c30_E INTEGER,"
            "c30_F INTEGER,"
            "c30_G INTEGER,"
            "c30_H INTEGER,"
            "c30_I INTEGER,"
            "c30_IK TEXT,"
            "c30A INTEGER,"
            "c31 INTEGER,"
            "c31K TEXT,"
            "c32 INTEGER,"
            "c33 INTEGER,"
            "c33A INTEGER,"
            "c33AK TEXT,"
            "c34 TEXT,"
            "c35A TEXT,"
            "c35B TEXT,"
            "c36 TEXT,"
            "c37A TEXT,"
            "c37B TEXT,"
            "c38 INTEGER,"
            "c39 INTEGER,"
            "c40 INTEGER,"
            "c40A INTEGER,"
            "c41 INTEGER,"
            "c42 INTEGER,"
            "c43 INTEGER,"
            "c44 INTEGER,"
            "c45 INTEGER,"
            "c46 INTEGER,"
            "c47 INTEGER,"
            "c47A INTEGER,"
            "c47A_A INTEGER,"
            "c47A_B INTEGER,"
            "c47A_C INTEGER,"
            "c47B INTEGER,"
            "c47B_A INTEGER,"
            "c47B_B INTEGER,"
            "c47B_C INTEGER,"
            "c47C INTEGER,"
            "c48 INTEGER,"
            "c49 TEXT,"
            "c50A TEXT,"
            "c50B TEXT,"
            "c51 TEXT,"
            "c52A TEXT,"
            "c52B TEXT,"
            "c53 INTEGER,"
            "c54 INTEGER,"
            "c55 INTEGER,"
            "c56 INTEGER,"
            "c57 INTEGER,"
            "c58 INTEGER,"
            "c59 INTEGER,"
            "c60 INTEGER,"
            "c61 INTEGER,"
            "c62 INTEGER,"
            "c62A1 INTEGER,"
            "c62A2 INTEGER,"
            "c62A3 INTEGER,"
            "c62A4 INTEGER,"
            "c62A5 INTEGER,"
            "c62A6 INTEGER,"
            "c62A7 INTEGER,"
            "c62A8 INTEGER,"
            "c62A9 INTEGER,"
            "c62A9K TEXT,"
            "c62C1 INTEGER,"
            "c62C2 INTEGER,"
            "c62C3 INTEGER,"
            "c62C4 INTEGER,"
            "c62C5 INTEGER,"
            "c62C6 INTEGER,"
            "c62C7 INTEGER,"
            "c62C7K TEXT,"
            "c62D1 INTEGER,"
            "c62D2 INTEGER,"
            "c62D3 INTEGER,"
            "c62D4 INTEGER,"
            "c62D5 INTEGER,"
            "c63 INTEGER,"
            "c64 INTEGER,"
            "c65 INTEGER,"
            "c66 INTEGER,"
            "c67 INTEGER,"
            "c68 INTEGER,"
            "c69 INTEGER,"
            "c79A_1 INTEGER,"
            "c79A_2 TEXT,"
            "c79A_3 INTEGER,"
            "c79A_4 TEXT,"
            "c79A_5 INTEGER,"
            "c79A_6 INTEGER,"
            "c79B_1 INTEGER,"
            "c79B_2 INTEGER,"
            "c79C_1 INTEGER,"
            "c79C_2 INTEGER,"
            "c79C_3 INTEGER,"
            "c79C_4 INTEGER,"
            "c79C_5 INTEGER,"
            "c79C_6 INTEGER,"
            "c79C_7 INTEGER,"
            "c79C_8 INTEGER,"
            "c79C_8K TEXT,"
            "c79D INTEGER,"
            "c79E INTEGER,"
            "c79F INTEGER,"
            "c79G INTEGER,"
            "c79H INTEGER,"
            "c79I INTEGER,"
            "c79J INTEGER,"
            "c79K INTEGER,"
            "c86 INTEGER,"
            "c86A TEXT,"
            "c87 INTEGER,"
            "c87A TEXT"
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