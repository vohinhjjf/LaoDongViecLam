class DichVuTaiChinhModel {
  String? idho;
  int? idtv;
  String? stt;
  int? thangDT;
  int? namDT;
  int? c85_A;
  int? c85_B;
  int? c85_C;
  int? c85_D;
  int? c85_E;
  int? c85_F;
  int? c85_G;
  int? c85_H;
  int? c85_I;
  int? c86;
  int? c87;
  int? c88;
  int? c89_A;
  int? c89_B;
  int? c89_C;
  int? c89_D;
  int? c89_E;
  int? c89_F;
  int? c89_G;
  int? c90_A;
  int? c90_B;
  int? c90_C;
  int? c90_D;
  int? c90_E;
  int? c90_F;
  int? c90_G;
  int? c90_H;
  int? c90_I;
  int? c90_J;
  int? c91_A;
  int? c91_B;
  int? c92;
  String? c93;
  String? c93K;
  String? c94;
  String? c94K;
  int? c95;
  String? c96;
  String? c96K;
  int? c97_A;
  int? c97_B;
  int? c97_C;
  int? c97_D;
  int? c97_E;
  int? c97_F;
  int? c97_G;
  int? c97_H;
  int? c97_I;
  int? c97_J;
  int? c98_A;
  int? c98_B;
  int? c98_C;
  int? c98_D;
  int? c98_E;
  int? c98_F;
  int? c98_G;
  int? c98_H;
  int? c98_I;
  int? c99;

  DichVuTaiChinhModel(
      {this.idho,
        this.idtv,
        this.stt,
        this.thangDT,
        this.namDT,
        this.c85_A,
        this.c85_B,
        this.c85_C,
        this.c85_D,
        this.c85_E,
        this.c85_F,
        this.c85_G,
        this.c85_H,
        this.c85_I,
        this.c86,
        this.c87,
        this.c88,
        this.c89_A,
        this.c89_B,
        this.c89_C,
        this.c89_D,
        this.c89_E,
        this.c89_F,
        this.c89_G,
        this.c90_A,
        this.c90_B,
        this.c90_C,
        this.c90_D,
        this.c90_E,
        this.c90_F,
        this.c90_G,
        this.c90_H,
        this.c90_I,
        this.c90_J,
        this.c91_A,
        this.c91_B,
        this.c92,
        this.c93,
        this.c93K,
        this.c94,
        this.c94K,
        this.c95,
        this.c96,
        this.c96K,
        this.c97_A,
        this.c97_B,
        this.c97_C,
        this.c97_D,
        this.c97_E,
        this.c97_F,
        this.c97_G,
        this.c97_H,
        this.c97_I,
        this.c97_J,
        this.c98_A,
        this.c98_B,
        this.c98_C,
        this.c98_D,
        this.c98_E,
        this.c98_F,
        this.c98_G,
        this.c98_H,
        this.c98_I,
        this.c99,
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'idtv': idtv,
      'stt': stt,
      'thangDT': thangDT,
      'namDT': namDT,
      "c85_A": c85_A,
      "c85_B": c85_B,
      "c85_C": c85_C,
      "c85_D": c85_D,
      "c85_E": c85_E,
      "c85_F": c85_F,
      "c85_G": c85_G,
      "c85_H": c85_H,
      "c85_I": c85_I,
      "c86": c86,
      "c87": c87,
      "c88": c88,
      "c89_A": c89_A,
      "c89_B": c89_B,
      "c89_C": c89_C,
      "c89_D": c89_D,
      "c89_E": c89_E,
      "c89_F": c89_F,
      "c89_G": c89_G,
      "c90_A": c90_A,
      "c90_B": c90_B,
      "c90_C": c90_C,
      "c90_D": c90_D,
      "c90_E": c90_E,
      "c90_F": c90_F,
      "c90_G": c90_G,
      "c90_H": c90_H,
      "c90_I": c90_I,
      "c90_J": c90_J,
      "c91_A": c91_A,
      "c91_B": c91_B,
      "c92": c92,
      "c93": c93,
      "c93K": c93K,
      "c94": c94,
      "c94K": c94K,
      "c95": c95,
      "c96": c96,
      "c96K": c96K,
      "c97_A": c97_A,
      "c97_B": c97_B,
      "c97_C": c97_C,
      "c97_D": c97_D,
      "c97_E": c97_E,
      "c97_F": c97_F,
      "c97_G": c97_G,
      "c97_H": c97_H,
      "c97_I": c97_I,
      "c97_J": c97_J,
      "c98_A": c98_A,
      "c98_B": c98_B,
      "c98_C": c98_C,
      "c98_D": c98_D,
      "c98_E": c98_E,
      "c98_F": c98_F,
      "c98_G": c98_G,
      "c98_H": c98_H,
      "c98_I": c98_I,
      "c99": c99,
    };
  }

  DichVuTaiChinhModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    idtv = json['idtv'];
    stt = json['stt'];
    thangDT = json['thangDT'];
    namDT = json['namDT'];
    c85_A = json['c85_A'];
    c85_B = json['c85_B'];
    c85_C = json['c85_C'];
    c85_D = json['c85_D'];
    c85_E = json['c85_E'];
    c85_F = json['c85_F'];
    c85_G = json['c85_G'];
    c85_H = json['c85_H'];
    c85_I = json['c85_I'];
    c86 = json['c86'];
    c87 = json['c87'];
    c88 = json['c88'];
    c89_A = json['c89_A'];
    c89_B = json['c89_B'];
    c89_C = json['c89_C'];
    c89_D = json['c89_D'];
    c89_E = json['c89_E'];
    c89_F = json['c89_F'];
    c89_G = json['c89_G'];
    c90_A = json['c90_A'];
    c90_B = json['c90_B'];
    c90_C = json['c90_C'];
    c90_D = json['c90_D'];
    c90_E = json['c90_E'];
    c90_F = json['c90_F'];
    c90_G = json['c90_G'];
    c90_H = json['c90_H'];
    c90_I = json['c90_I'];
    c90_J = json['c90_J'];
    c91_A = json['c91_A'];
    c91_B = json['c91_B'];
    c92 = json['c92'];
    c93 = json['c93'];
    c93K = json['c93K'];
    c94 = json['c94'];
    c94K = json['c94K'];
    c95 = json['c95'];
    c96 = json['c96'];
    c96K = json['c96K'];
    c97_A = json['c97_A'];
    c97_B = json['c97_B'];
    c97_C = json['c97_C'];
    c97_D = json['c97_D'];
    c97_E = json['c97_E'];
    c97_F = json['c97_F'];
    c97_G = json['c97_G'];
    c97_H = json['c97_H'];
    c97_I = json['c97_I'];
    c97_J = json['c97_J'];
    c98_A = json['c98_A'];
    c98_B = json['c98_B'];
    c98_C = json['c98_C'];
    c98_D = json['c98_D'];
    c98_E = json['c98_E'];
    c98_F = json['c98_F'];
    c98_G = json['c98_G'];
    c98_H = json['c98_H'];
    c98_I = json['c98_I'];
    c99 = json['c99'];
  }
}