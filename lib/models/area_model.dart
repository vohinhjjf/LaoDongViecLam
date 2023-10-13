class AreaModel {
  int? id;
  String? iddb;
  int? namDT;
  int? thangDT;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  String? maDiaBan;
  int? ttnt;
  String? tenDiaBan;
  int? trangThai;
  String? nguoiCapNhat;
  String? ngayCapNhat;
  int? hoanThanh;
  String? ghiChu;
  String? nguoiTao;
  String? ngayTao;

  AreaModel(
      {this.id,
        this.iddb,
        this.maTinh,
        this.maHuyen,
        this.maXa,
        this.maDiaBan,
        this.namDT,
        this.thangDT,
        this.ttnt,
        this.tenDiaBan,
        this.trangThai,
        this.ngayTao,
        this.ghiChu,
        this.nguoiTao,
        this.hoanThanh,
        this.nguoiCapNhat,
        this.ngayCapNhat
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iddb': iddb,
      'maTinh': maTinh,
      'maHuyen': maHuyen,
      'maXa': maXa,
      'maDiaBan': maDiaBan,
      'namDT': namDT,
      'thangDT': thangDT,
      'ttnt': ttnt,
      'tenDiaBan': tenDiaBan,
      'trangthai': trangThai,
      'ngayTao': ngayTao,
      'ghiChu': ghiChu,
      'nguoiTao': nguoiTao,
      'hoanThanh': hoanThanh,
      'nguoiCapNhat': nguoiCapNhat,
      'ngayCapNhat': ngayCapNhat,
    };
  }

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iddb = json['iddb'];
    maTinh = json['maTinh'];
    maHuyen = json['maHuyen'];
    maXa = json['maXa'];
    maDiaBan = json['maDiaBan'];
    namDT = json['namDT'];
    thangDT = json['thangDT'];
    ttnt = json['ttnt'];
    tenDiaBan = json['tenDiaBan'];
    trangThai = json['trangThai'];
    hoanThanh = json['hoanThanh'];
    ngayTao = json['ngayTao'];
    ghiChu = json['ghiChu'];
    nguoiTao = json['nguoiTao'];
    nguoiCapNhat = json['nguoiCapNhat'];
    ngayCapNhat = json['ngayCapNhat'];
  }
}