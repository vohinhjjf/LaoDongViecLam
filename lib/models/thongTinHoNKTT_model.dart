class thongTinHoNKTTModel {
  String? idho;
  int? thangDT;
  int? namDT;
  int? q2;
  int? q2_New;
  int? q3;
  int? q3_New;
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
  int? q5A_New;
  int? q6;

  thongTinHoNKTTModel(
      {this.idho,
        this.thangDT,
        this.namDT,
        this.q2,
        this.q2_New,
        this.q3,
        this.q3_New,
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
        this.q5A_New,
        this.q6,
      });

  Map<String, dynamic> toJson() {
    return {
      'idho': idho,
      'thangDT': thangDT,
      'namDT': namDT,
      'q2': q2,
      'q2_New': q2_New,
      'q3': q3,
      'q3_New': q3_New,
      'q3A_New': q3A_New,
      'q3B_New': q3B_New,
      'q3C_New': q3C_New,
      'q3D_New': q3D_New,
      'q4A_New': q4A_New,
      'q4B_New': q4B_New,
      'q4C_New': q4C_New,
      'q4D_New': q4D_New,
      'q4E_New': q4E_New,
      'q4F_New': q4F_New,
      'q5': q5,
      'q5A_New': q5A_New,
      'q6': q6,
    };
  }

  thongTinHoNKTTModel.fromJson(Map<String, dynamic> json) {
    idho = json['idho'];
    thangDT = json['thangDT'];
    namDT = json['namDT'];
    q2 = json['q2'];
    q2_New = json['q2_New'];
    q3 = json['q3'];
    q3_New = json['q3_New'];
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
    q5A_New = json['q5A_New'];
    q6 = json['q6'];
  }
}