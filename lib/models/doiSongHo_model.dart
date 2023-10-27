class DoiSongHoModel {
  String? idho;
  int? thangDT;
  int? namDT;
  int? c62_M1;
  int? c62_M2;
  int? c62_M3A;
  int? c62_M3B;
  int? c62_M3C;
  int? c62_M3D;
  int? c62_M3E;
  int? c62_M3F;
  int? c62_M3G;
  int? c62_M3H;
  int? c62_M3I;
  String? c62_M3IK;
  int? c62_M4;
  int? c62_M5A;
  int? c62_M5B;
  int? c62_M5C;
  int? c62_M5D;
  int? c62_M5E;
  int? c62_M5F;
  int? c62_M5G;
  int? c62_M5H;
  int? c62_M5I;
  String? c62_M5IK;
  int? c62_M6;
  int? c62_M7A;
  int? c62_M7B;
  int? c62_M7C;
  int? c62_M7D;
  int? c62_M7E;
  int? c62_M7F;
  String? c62_M7FK;
  int? c62_M8A;
  int? c62_M8B;
  int? c62_M8C;
  int? c62_M8D;
  int? c62_M8E;
  int? c62_M8F;
  String? c62_M8FK;
  int? c62_M9A;
  int? c62_M9B;
  int? c62_M9C;
  int? c62_M9D;
  int? c62_M9E;
  String? c62_M9EK;

  DoiSongHoModel(
      {this.idho,
        this.thangDT,
        this.namDT,
        this.c62_M1,
        this.c62_M2,
        this.c62_M3A,
        this.c62_M3B,
        this.c62_M3C,
        this.c62_M3D,
        this.c62_M3E,
        this.c62_M3F,
        this.c62_M3G,
        this.c62_M3H,
        this.c62_M3I,
        this.c62_M3IK,
        this.c62_M4,
        this.c62_M5A,
        this.c62_M5B,
        this.c62_M5C,
        this.c62_M5D,
        this.c62_M5E,
        this.c62_M5F,
        this.c62_M5G,
        this.c62_M5H,
        this.c62_M5I,
        this.c62_M5IK,
        this.c62_M6,
        this.c62_M7A,
        this.c62_M7B,
        this.c62_M7C,
        this.c62_M7D,
        this.c62_M7E,
        this.c62_M7F,
        this.c62_M7FK,
        this.c62_M8A,
        this.c62_M8B,
        this.c62_M8C,
        this.c62_M8D,
        this.c62_M8E,
        this.c62_M8F,
        this.c62_M8FK,
        this.c62_M9A,
        this.c62_M9B,
        this.c62_M9C,
        this.c62_M9D,
        this.c62_M9E,
        this.c62_M9EK,
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'thangDT': thangDT,
      'namDT': namDT,
      "c62_M1": c62_M1,
      "c62_M2": c62_M2,
      "c62_M3A": c62_M3A,
      "c62_M3B": c62_M3B,
      "c62_M3C": c62_M3C,
      "c62_M3D": c62_M3D,
      "c62_M3E": c62_M3E,
      "c62_M3F": c62_M3F,
      "c62_M3G": c62_M3G,
      "c62_M3H": c62_M3H,
      "c62_M3I": c62_M3I,
      "c62_M3IK": c62_M3IK,
      "c62_M4": c62_M4,
      "c62_M5A": c62_M5A,
      "c62_M5B": c62_M5B,
      "c62_M5C": c62_M5C,
      "c62_M5D": c62_M5D,
      "c62_M5E": c62_M5E,
      "c62_M5F": c62_M5F,
      "c62_M5G": c62_M5G,
      "c62_M5H": c62_M5H,
      "c62_M5I": c62_M5I,
      "c62_M5IK": c62_M5IK,
      "c62_M6": c62_M6,
      "c62_M7A": c62_M7A,
      "c62_M7B": c62_M7B,
      "c62_M7C": c62_M7C,
      "c62_M7D": c62_M7D,
      "c62_M7E": c62_M7E,
      "c62_M7F": c62_M7F,
      "c62_M7FK": c62_M7FK,
      "c62_M8A": c62_M8A,
      "c62_M8B": c62_M8B,
      "c62_M8C": c62_M8C,
      "c62_M8D": c62_M8D,
      "c62_M8E": c62_M8E,
      "c62_M8F": c62_M8F,
      "c62_M8FK": c62_M8FK,
      "c62_M9A": c62_M9A,
      "c62_M9B": c62_M9B,
      "c62_M9C": c62_M9C,
      "c62_M9D": c62_M9D,
      "c62_M9E": c62_M9E,
      "c62_M9EK": c62_M9EK,
    };
  }

  DoiSongHoModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    thangDT = json['thangDT'];
    namDT = json['namDT'];
    c62_M1 = json['c62_M1'];
    c62_M2 = json['c62_M2'];
    c62_M3A = json['c62_M3A'];
    c62_M3B = json['c62_M3B'];
    c62_M3C = json['c62_M3C'];
    c62_M3D = json['c62_M3D'];
    c62_M3E = json['c62_M3E'];
    c62_M3F = json['c62_M3F'];
    c62_M3G = json['c62_M3G'];
    c62_M3H = json['c62_M3H'];
    c62_M3I = json['c62_M3I'];
    c62_M3IK = json['c62_M3IK'];
    c62_M4 = json['c62_M4'];
    c62_M5A = json['c62_M5A'];
    c62_M5B = json['c62_M5B'];
    c62_M5C = json['c62_M5C'];
    c62_M5D = json['c62_M5D'];
    c62_M5E = json['c62_M5E'];
    c62_M5F = json['c62_M5F'];
    c62_M5G = json['c62_M5G'];
    c62_M5H = json['c62_M5H'];
    c62_M5I = json['c62_M5I'];
    c62_M5IK = json['c62_M5IK'];
    c62_M6 = json['c62_M6'];
    c62_M7A = json['c62_M7A'];
    c62_M7B = json['c62_M7B'];
    c62_M7C = json['c62_M7C'];
    c62_M7D = json['c62_M7D'];
    c62_M7E = json['c62_M7E'];
    c62_M7F = json['c62_M7F'];
    c62_M7FK = json['c62_M7FK'];
    c62_M8A = json['c62_M8A'];
    c62_M8B = json['c62_M8B'];
    c62_M8C = json['c62_M8C'];
    c62_M8D = json['c62_M8D'];
    c62_M8E = json['c62_M8E'];
    c62_M8F = json['c62_M8F'];
    c62_M8FK = json['c62_M8FK'];
    c62_M9A = json['c62_M9A'];
    c62_M9B = json['c62_M9B'];
    c62_M9C = json['c62_M9C'];
    c62_M9D = json['c62_M9D'];
    c62_M9E = json['c62_M9E'];
    c62_M9EK = json['c62_M9EK'];
  }
}