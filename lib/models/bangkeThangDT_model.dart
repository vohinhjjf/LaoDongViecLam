class BangKeThangDTModel {
  String? idhO_BKE;
  int? namDT;
  int? thangDT;
  int? trangThai;
  int? sync;

  BangKeThangDTModel(
      {
        this.idhO_BKE,
        this.namDT,
        this.thangDT,
        this.trangThai,
        this.sync
      });

  Map<String, dynamic> toJson() {
    return {
      'idhO_BKE': idhO_BKE,
      'namDT': namDT,
      'thangDT': thangDT,
      'trangThai': trangThai,
      'sync': sync,
    };
  }

  Map<String, dynamic> toJson1() {
    return {
      'idhO_BKE': idhO_BKE,
      'namDT': namDT,
      'thangDT': thangDT,
      'trangThai': trangThai,
    };
  }

  BangKeThangDTModel.fromJson(Map<String, dynamic> json) {
    idhO_BKE = json['idhO_BKE'];
    namDT = json['namDT'];
    thangDT = json['thangDT'];
    trangThai = json['trangThai'];
    sync = json['sync'];
  }
}