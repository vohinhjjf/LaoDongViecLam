class BangKeCsModel {
  String? idho;
  String? idhO_TDT;
  String? iddb;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  String? maDiaBan;
  String? hoSo;
  String? tenChuHo;
  String? diaChi;
  int? tsKhau;
  int? tsNu;
  int? nhom;
  int? hoDuPhong;
  int? trangthai;
  String? nguoiCapNhat;
  String? ngayCapNhat;
  String? ghiChu;
  String? nguoiTao;
  String? ngayTao;

  BangKeCsModel(
      {this.idho,
      this.idhO_TDT,
      this.iddb,
      this.maTinh,
      this.maHuyen,
      this.maXa,
      this.maDiaBan,
      this.hoSo,
      this.tenChuHo,
      this.diaChi,
      this.tsKhau,
      this.tsNu,
      this.nhom,
      this.hoDuPhong,
      this.trangthai,
      this.ngayTao,
      this.ghiChu,
      this.nguoiTao,
      this.nguoiCapNhat,
      this.ngayCapNhat
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'idhO_TDT': idhO_TDT,
      'iddb': iddb,
      'maTinh': maTinh,
      'maHuyen': maHuyen,
      'maXa': maXa,
      'maDiaBan': maDiaBan,
      'hoSo': hoSo,
      'tenChuHo': tenChuHo,
      'diaChi': diaChi,
      'tsKhau': tsKhau,
      'tenChuHo': tsNu,
      'nhom': nhom,
      'hoDuPhong': hoDuPhong,
      'trangthai': trangthai,
      'ngayTao': ngayTao,
      'ghiChu': ghiChu,
      'nguoiTao': nguoiTao,
      'nguoiCapNhat': nguoiCapNhat,
      'ngayCapNhat': ngayCapNhat,
    };
  }

  BangKeCsModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    idhO_TDT = json['idhO_TDT'];
    iddb = json['iddb'];
    maTinh = json['maTinh'];
    maHuyen = json['maHuyen'];
    maXa = json['maXa'];
    maDiaBan = json['maDiaBan'];
    hoSo = json['hoSo'];
    tenChuHo = json['tenChuHo'];
    diaChi = json['diaChi'];
    tsKhau = json['tsKhau'];
    tsNu = json['tsNu'];
    nhom = json['nhom'];
    hoDuPhong = json['hoDuPhong'];
    trangthai = json['trangthai'];
    ngayTao = json['ngayTao'];
    ghiChu = json['ghiChu'];
    nguoiTao = json['nguoiTao'];
    nguoiCapNhat = json['nguoiCapNhat'];
    ngayCapNhat = json['ngayCapNhat'];
  }
}
