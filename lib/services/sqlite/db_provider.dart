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
    String path = join(documentsDirectory.path,userName,"$userName.db");
    _database = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE ${TableConstants.bangkecs} ("
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
          await db.execute("CREATE TABLE ${TableConstants.dmDvhc} ("
              "tinh TEXT,"
              "maTinh TEXT,"
              "huyen TEXT,"
              "maHuyen TEXT,"
              "xa TEXT,"
              "maXa TEXT"
              ")");
      await db.execute("CREATE TABLE ${TableConstants.phieudieutra} ("
          "id_BK TEXT PRIMARY KEY,"
          "tenCS_BK TEXT,"
          "diaChi_BK TEXT,"
          "tinhTrang_DTBK TEXT"
          ")");
      await db.execute("CREATE TABLE ${TableConstants.phieutongiao} ("
          "id TEXT PRIMARY KEY,"
          "maCS INTEGER,"
          "tenCS TEXT,"
          "tinh TEXT,"
          "huyen TEXT,"
          "xa TEXT,"
          "thon TEXT,"
          "dienThoai TEXT,"
          "email TEXT,"
          "a15_ten TEXT,"
          "a15_phamSac TEXT,"
          "a15_gioiTinh INTEGER,"
          "a15_namSinh INTEGER,"
          "a15_danToc TEXT,"
          "a15_TDCM INTEGER,"
          "a16_loaiCS INTEGER,"
          "a17_loaiTG INTEGER,"
          "a17_ghiRo TEXT,"
          "a18_1 INTEGER,"
          "a18_2 INTEGER,"
          "a18_3 INTEGER,"
          "a21 INTEGER,"
          "a21_nu INTEGER,"
          "a22_01 INTEGER,"
          "a22_02 INTEGER,"
          "a22_03 INTEGER,"
          "a22_04 INTEGER,"
          "a31 INTEGER,"
          "a32 INTEGER,"
          "a32_1 INTEGER,"
          "a41_01 INTEGER,"
          "a41_02 INTEGER,"
          "a41_03 INTEGER,"
          "a41_04 INTEGER,"
          "a41_05 INTEGER,"
          "a41_06 INTEGER,"
          "a41_07 INTEGER,"
          "a41_08 INTEGER,"
          "a41_09 INTEGER,"
          "a41_10 INTEGER,"
          "a41_ghiRo TEXT,"
          "a42 INTEGER,"
          "DTV TEXT,"
          "ngayCapNhat TEXT,"
          "kinhDo INTEGER,"
          "viDo INTEGER,"
          "ngayPhongVan TEXT,"
          "ngayKetThuc TEXT,"
          "hoten_TL TEXT,"
          "dienthoai_TL TEXT,"
          "email_TL TEXT,"
          "tinhtrang_DT INTEGER,"
          "trangThai INTEGER"
          ")");
      await db.execute("CREATE TABLE ${TableConstants.phieutongiaoA43} ("
          "id TEXT,"
          "stt INTEGER,"
          "a43_ten TEXT,"
          "a43_1 TEXT,"
          "a43_2 INTEGER,"
          "a43_3 INTEGER,"
          "a43_4 INTEGER"
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
