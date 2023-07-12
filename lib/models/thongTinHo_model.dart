class thongTinHoModel {
  String? idho;
  String? namDT;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  String? maDiaBan;
  String? hoSo;
  int? thangDT;
  int? ttnt;
  String? tenChuHo;
  String? diachi;
  int? maDTV;
  int? ngayKetThuc;
  int? ngayPhongVan;
  double? kinhDo;
  double? viDo;
  int? trangThai;
  String? dienThoai;
  int? tsnk;
  int? tsnu;
  int? nK_15;
  int? nu_15;
  String? maNCC;
  int? duyetho;
  String? nguoiTao;
  String? ngayTao;
  String? nguoiCapNhat;
  String? ngayCapNhat;
  String? thoiGianNhap;
  String? version;

  thongTinHoModel(
      {this.idho,
        this.namDT,
        this.maTinh,
        this.maHuyen,
        this.maXa,
        this.maDiaBan,
        this.hoSo,
        this.thangDT,
        this.ttnt,
        this.tenChuHo,
        this.diachi,
        this.maDTV,
        this.ngayKetThuc,
        this.ngayPhongVan,
        this.kinhDo,
        this.viDo,
        this.trangThai,
        this.dienThoai,
        this.tsnk,
        this.tsnu,
        this.nK_15,
        this.nu_15,
        this.maNCC,
        this.duyetho,
        this.ngayTao,
        this.nguoiTao,
        this.nguoiCapNhat,
        this.ngayCapNhat,
        this.thoiGianNhap,
        this.version,
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'namDT': namDT,
      'maTinh': maTinh,
      'maHuyen': maHuyen,
      'maXa': maXa,
      'maDiaBan': maDiaBan,
      'hoSo': hoSo,
      'thangDT': thangDT,
      'ttnt': ttnt,
      'tenChuHo': tenChuHo,
      'diachi': diachi,
      'maDTV': maDTV,
      'ngayKetThuc': ngayKetThuc,
      'ngayPhongVan': ngayPhongVan,
      "kinhDo": kinhDo,
      "viDo": viDo,
      "trangThai": trangThai,
      "dienThoai": dienThoai,
      "tsnk": tsnk,
      "tsnu": tsnu,
      "nK_15": nK_15,
      "nu_15": nu_15,
      "maNCC": maNCC,
      "duyetho": duyetho,
      'ngayTao': ngayTao,
      'nguoiTao': nguoiTao,
      'nguoiCapNhat': nguoiCapNhat,
      'ngayCapNhat': ngayCapNhat,
      'thoiGianNhap': thoiGianNhap,
      'version': version,
    };
  }

  thongTinHoModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    namDT = json['namDT'];
    maTinh = json['maTinh'];
    maHuyen = json['maHuyen'];
    maXa = json['maXa'];
    maDiaBan = json['maDiaBan'];
    hoSo = json['hoSo'];
    thangDT = json['thangDT'];
    ttnt = json['ttnt'];
    tenChuHo = json['tenChuHo'];
    diachi = json['diachi'];
    maDTV = json['maDTV'];
    ngayKetThuc = json['ngayKetThuc'];
    ngayPhongVan = json['ngayPhongVan'];
    kinhDo = json["kinhDo"];
    viDo = json["viDo"];
    trangThai = json["trangThai"];
    dienThoai = json["dienThoai"];
    tsnk = json["tsnk"];
    tsnu = json["tsnu"];
    nK_15 = json["nK_15"];
    nu_15 = json["nu_15"];
    maNCC= json["maNCC"];
    duyetho= json[ "duyetho"];
    ngayTao = json['ngayTao'];
    thoiGianNhap = json['thoiGianNhap'];
    nguoiTao = json['nguoiTao'];
    nguoiCapNhat = json['nguoiCapNhat'];
    ngayCapNhat = json['ngayCapNhat'];
  }
}