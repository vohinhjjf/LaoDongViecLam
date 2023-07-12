class thongTinThanhVienNKTTModel {
  String? idho;
  int? idtv;
  int? thangDT;
  int? namDT;
  String? q1;
  String? q1_New;
  int? q2;
  int? q2_New;
  int? q3;
  int? q3A_New;
  int? q3B_New;
  int? q3C_New;
  int? q3D_New;
  int? q4A_New;
  int? q4B_New;
  int? q4C_New;
  int? q4D_New;
  int? q4E_New;
  int? q4F_New;
  int? q5;
  int? q5_New;
  int? q6_New;

  thongTinThanhVienNKTTModel(
      {this.idho,
        this.idtv,
        this.thangDT,
        this.namDT,
        this.q1,
        this.q1_New,
        this.q2,
        this.q2_New,
        this.q3,
        this.q3A_New,
        this.q3B_New,
        this.q3C_New,
        this.q3D_New,
        this.q4A_New,
        this.q4B_New,
        this.q4C_New,
        this.q4D_New,
        this.q4E_New,
        this.q4F_New,
        this.q5,
        this.q5_New,
        this.q6_New,
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'idtv': idtv,
      'thangDT': thangDT,
      'namDT': namDT,
      'q1': q1,
      'q1_New': q1_New,
      'q2': q2,
      'q2_New': q2_New,
      'q3': q3,
      'q3A_New': q3A_New,
      'q3B_New': q3B_New,
      'q3': q3C_New,
      'q3D_New': q3D_New,
      'q4A_New': q4A_New,
      'q4B_New': q4B_New,
      'q4C_New': q4C_New,
      'q4D_New': q4D_New,
      'q4E_New': q4E_New,
      'q4F_New': q4F_New,
      'q5': q5,
      'q5_New': q5_New,
      'q6_New': q6_New,
    };
  }

  thongTinThanhVienNKTTModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    idtv = json['idtv'];
    thangDT = json['thangDT'];
    namDT = json['namDT'];
    q1 = json['q1'];
    q1_New = json['q1_New'];
    q2 = json['q2'];
    q2_New = json['q2_New'];
    q3 = json['q3'];
    q3A_New = json['q3A_New'];
    q3B_New = json['q3B_New'];
    q3C_New = json['q3C_New'];
    q3D_New = json['q3D_New'];
    q4A_New = json['q4A_New'];
    q4B_New = json['q4B_New'];
    q4C_New = json['q4C_New'];
    q4D_New = json['q4D_New'];
    q4E_New = json['q4E_New'];
    q4F_New = json['q4F_New'];
    q5 = json['q5'];
    q5_New = json['q5_New'];
    q6_New = json['q6_New'];
  }
}