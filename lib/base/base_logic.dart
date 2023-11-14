import 'package:lao_dong_viec_lam/components/ui_describes.dart';
import 'package:lao_dong_viec_lam/models/doiSongHo_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinThanhVien_model.dart';

class BaseLogic {
  static BaseLogic _instance = BaseLogic();
  var mQuestion = UIDescribes.QUESTION_P02;
  late int tuoi;
  late int thangdt;

  static BaseLogic getInstance() {
    if (_instance == null) {
      _instance = new BaseLogic();
    }

    return _instance;
  }

  String getQuestion(int indexMem) {
    if (indexMem == 0 && mQuestion.contains(UIDescribes.QUESTION_P01)) {
      mQuestion = UIDescribes.QUESTION_P02;
    }
    return mQuestion;
  }
  
  String getMember(thongTinThanhVienModel thongTinTV){
    String question = "";
    if (thongTinTV.c02 != null && thongTinTV.c02 == 1) {
      if (thongTinTV.c04 != null && thongTinTV.c04! > 60) {
        question = "Ông";
      } else if (thongTinTV.c04 != null && thongTinTV.c04! < 18) {
        question = "Em";
      } else {
        question = "Anh";
      }
    } else {
      if (thongTinTV.c04 != null && thongTinTV.c04! > 60) {
        question = "Bà";
      } else if (thongTinTV.c04 != null && thongTinTV.c04! < 18) {
        question = "Em";
      } else {
        question = "Chị";
      }
    }
    return question;
  }

  //=============== PRocedure MEMBER ================//
  procedureMember(thongTinThanhVienModel thongTinTV) {
    mQuestion = UIDescribes.QUESTION_P01;
    ////LogUtils.warn("ValidateProcedure", "Start");
    // Question require
    if (thongTinTV.c00 == null) {
      ////LogUtils.warn("ProcedureMember: " + "C00");
      mQuestion = UIDescribes.QUESTION_P00;
      return false;
    }

    if (thongTinTV.c01 == null) {
      //LogUtils.warn("ProcedureMember: " + "C01");
      mQuestion = UIDescribes.QUESTION_P01;
      return false;
    } else if (thongTinTV.c01 != null && thongTinTV.c01 == 8 && thongTinTV.c01K == null) {
      //LogUtils.warn("ProcedureMember: " + "C01K");
      mQuestion = UIDescribes.QUESTION_P01;
      return false;
    }

    if (thongTinTV.c02 == null) {
      //LogUtils.warn("ProcedureMember: " + "C02");
      mQuestion = UIDescribes.QUESTION_P02;
      return false;
    }

    if (thongTinTV.c03B == null || thongTinTV.c03A == null) {
      //LogUtils.warn("ProcedureMember: " + "C03");
      mQuestion = UIDescribes.QUESTION_P03;
      return false;
    }

    if (thongTinTV.c04 == null) {
      //LogUtils.warn("ProcedureMember: " + "C04");
      mQuestion = UIDescribes.QUESTION_P04;
      return false;
    }

    if (thongTinTV.c04 != null && thongTinTV.c04! >= 15) {
      return checkC05(thongTinTV);
    } else {
      return checkKT9(thongTinTV);
    }
    //       return checkKT1(memberDTO);
  }

//    bool checkKT1(thongTinThanhVienModel thongTinTV) {
//        if (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 5) {
//            return checkC05(thongTinTV);
//        } else {
//            mQuestion = UIDescribes.QUESTION_P04;
//            return true;
//        }
//    }

  bool checkC05(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 25 &&
        (thongTinTV.c04 ?? 0) <= 49 && thongTinTV.c04A == null) {
      //LogUtils.warn("ProcedureMember: " + "C04A");
      mQuestion = UIDescribes.QUESTION_P05;
      return false;
    }
    return checkC06(thongTinTV);
  }

  bool checkC06(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) {
      if (thongTinTV.c05 == null) {
        //LogUtils.warn("ProcedureMember: " + "C05");
        mQuestion = UIDescribes.QUESTION_P06;
        return false;
      } else if (thongTinTV.c05 != null && thongTinTV.c05 == 2 && thongTinTV.c06 == null) {
        //LogUtils.warn("ProcedureMember: " + "C06");
        mQuestion = UIDescribes.QUESTION_P07;
        return false;
      }
    }
    if (thongTinTV.c05 != null && thongTinTV.c05 == 1) {
      return checkC07(thongTinTV);
    } else {
      mQuestion = UIDescribes.QUESTION_P07;
      return true;
    }
  }

  bool checkC07(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c07 == null) {
      //LogUtils.warn("ProcedureMember: " + "C07");
      mQuestion = UIDescribes.QUESTION_P08;
      return false;
    }
    return checkC08(thongTinTV);
  }

  bool checkC08(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c08 == null) {
      //LogUtils.warn("ProcedureMember: " + "C08");
      mQuestion = UIDescribes.QUESTION_P09;
      return false;
    }

    if (thongTinTV.c08 != null && (thongTinTV.c08 ?? 0) >= 1 && (thongTinTV.c08 ?? 0) <= 4) {
      return checkC09(thongTinTV);
    } else {
      return checkC13(thongTinTV);
    }
  }

  bool checkC09(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        (thongTinTV.c09 == 1 && thongTinTV.c09A == null) ||
        (thongTinTV.c09 == 2 && thongTinTV.c09B == null)) {
      //LogUtils.warn("ProcedureMember: " + "C09");
      mQuestion = UIDescribes.QUESTION_P10;
      return false;
    }
    if (thongTinTV.c09B != null) {
      return checkC11(thongTinTV);
    } else {
      return checkC10(thongTinTV);
    }
  }

  bool checkC10(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c09A != null && thongTinTV.c10 == null) {
      //LogUtils.warn("ProcedureMember: " + "C10");
      mQuestion = UIDescribes.QUESTION_P11;
      return false;
    }
    return checkC10M(thongTinTV);
  }

  bool checkC10M(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c10M == null) {
      //LogUtils.warn("ProcedureMember: " + "C10_M");
      mQuestion = UIDescribes.QUESTION_P12;
      return false;
    }
    return checkC11(thongTinTV);
  }

  bool checkC11(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 5) &&
        thongTinTV.c11 == null) {
      //LogUtils.warn("ProcedureMember: " + "C11");
      mQuestion = UIDescribes.QUESTION_P13;
      return false;
    }
//            return checkKT5(thongTinTV);
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15 && (thongTinTV.c04 ?? 0) <= 24) &&
        (thongTinTV.c11 != null && thongTinTV.c11 == 2)) {
      return checkC12(thongTinTV);
    } else {
      return checkC13(thongTinTV);
    }
  }

  bool checkC12(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15 && (thongTinTV.c04 ?? 0) <= 24) &&
        thongTinTV.c12 == null) {
      //LogUtils.warn("ProcedureMember: " + "C12");
      mQuestion = UIDescribes.QUESTION_P14;
      return false;
    }
    return checkC13(thongTinTV);
  }

  bool checkC13(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15 && (thongTinTV.c04 ?? 0) <= 24) &&
        thongTinTV.c13 == null) {
      //LogUtils.warn("ProcedureMember: " + "C13");
      mQuestion = UIDescribes.QUESTION_P15;
      return false;
    }
//        return checkKT7(thongTinTV);
    if (thongTinTV.c13 == 1) {
      return checkC16(thongTinTV);
    } else {
      return checkC14(thongTinTV);
    }
  }

  bool checkC14(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c13 != null && (thongTinTV.c13 ?? 0) >= 2) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 18)) {
      if (thongTinTV.c14A == null || thongTinTV.c14B == null || thongTinTV.c14C == null ||
          thongTinTV.c14D == null || thongTinTV.c14E == null || thongTinTV.c14F == null) {
        //LogUtils.warn("ProcedureMember: " + "C14");
        mQuestion = UIDescribes.QUESTION_P16;
        return false;
      }
    } else if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c13 != null && (thongTinTV.c13 ?? 0) >= 2) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15 && (thongTinTV.c04 ?? 0) < 18)) {
      if (thongTinTV.c14A == null || thongTinTV.c14B == null) {
        //LogUtils.warn("ProcedureMember: " + "C14");
        mQuestion = UIDescribes.QUESTION_P16;
        return false;
      }
    }

    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        ((thongTinTV.c14A != null && thongTinTV.c14A == 1) ||
            (thongTinTV.c14B != null && thongTinTV.c14B == 1) ||
            (thongTinTV.c14C != null && thongTinTV.c14C == 1) ||
            (thongTinTV.c14D != null && thongTinTV.c14D == 1) ||
            (thongTinTV.c14E != null && thongTinTV.c14E == 1) ||
            (thongTinTV.c14F != null && thongTinTV.c14F == 1))) {
      return checkC15A(thongTinTV);
    } else {
      return checkC16(thongTinTV);
    }
  }

  bool checkC15A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c15A == null) {
      //LogUtils.warn("ProcedureMember: " + "C15A");
      mQuestion = UIDescribes.QUESTION_P17;
      return false;
    }
    return checkC15C(thongTinTV);
  }

  bool checkC15C(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c15C == null) {
      //LogUtils.warn("ProcedureMember: " + "C15C");
      mQuestion = UIDescribes.QUESTION_P17;
      return false;
    }
    return checkC17(thongTinTV);
  }

  bool checkC16(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        (thongTinTV.c16A == null || thongTinTV.c16B == null || thongTinTV.c16C == null)) {
      //LogUtils.warn("ProcedureMember: " + "C16");
      mQuestion = UIDescribes.QUESTION_P18;
      return false;
    }
    return checkC17(thongTinTV);
  }

  bool checkC17(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c17 == null) {
      //LogUtils.warn("ProcedureMember: " + "C17");
      mQuestion = UIDescribes.QUESTION_P19;
      return false;
    }

    if (thongTinTV.c17 != null && thongTinTV.c17 == 1) {
      return checkC34(thongTinTV);
    } else {
      return checkC18(thongTinTV);
    }
  }

  bool checkC18(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c18 == null) {
      //LogUtils.warn("ProcedureMember: " + "C18");
      mQuestion = UIDescribes.QUESTION_P20;
      return false;
    }
    if (thongTinTV.c18 != null && thongTinTV.c18 == 1) {
      return checkC25(thongTinTV);
    } else {
      return checkC19(thongTinTV);
    }
  }

  bool checkC19(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c19 == null) {
      //LogUtils.warn("ProcedureMember: " + "C19");
      mQuestion = UIDescribes.QUESTION_P21;
      return false;
    }
    if (thongTinTV.c19 != null && thongTinTV.c19 == 1) {
      return checkC25(thongTinTV);
    } else {
      return checkC20(thongTinTV);
    }
  }

  bool checkC20(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c20 == null) {
      //LogUtils.warn("ProcedureMember: " + "C20");
      mQuestion = UIDescribes.QUESTION_P22;
      return false;
    }
    if (thongTinTV.c20 != null && thongTinTV.c20 == 2) {
      return checkC24(thongTinTV);
    } else {
      return checkC21(thongTinTV);
    }
  }

  bool checkC21(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c21 == null) {
      //LogUtils.warn("ProcedureMember: " + "C21");
      mQuestion = UIDescribes.QUESTION_P23;
      return false;
    }
    if (thongTinTV.c21 != null && (thongTinTV.c21 == 1 || thongTinTV.c21 == 3)) {
      return checkC24(thongTinTV);
    } else if (thongTinTV.c21 != null && thongTinTV.c21 == 4) {
      return checkC25(thongTinTV);
    } else {
      return checkC22(thongTinTV);
    }
  }

  bool checkC22(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c22 == null) {
      //LogUtils.warn("ProcedureMember: " + "C22");
      mQuestion = UIDescribes.QUESTION_P24;
      return false;
    }
    if (thongTinTV.c22 != null && thongTinTV.c22 == 1) {
      return checkC25(thongTinTV);
    } else {
      return checkC23(thongTinTV);
    }
  }

  bool checkC23(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c23 == null) {
      //LogUtils.warn("ProcedureMember: " + "C23");
      mQuestion = UIDescribes.QUESTION_P25;
      return false;
    }
    if (thongTinTV.c23 != null && thongTinTV.c23 == 1) {
      return checkC25(thongTinTV);
    } else {
      return checkC24(thongTinTV);
    }
  }

  bool checkC24(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c24 == null) {
      //LogUtils.warn("ProcedureMember: " + "C24");
      mQuestion = UIDescribes.QUESTION_P26;
      return false;
    }
    if (thongTinTV.c24 != null && thongTinTV.c24 == 1) {
      return checkC26(thongTinTV);
    } else {
      return checkC29(thongTinTV);
    }
  }

  bool checkC25(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c25 == null) {
      //LogUtils.warn("ProcedureMember: " + "C25");
      mQuestion = UIDescribes.QUESTION_P27;
      return false;
    }

    if (thongTinTV.c25 != null && thongTinTV.c25 == 4) {
      mQuestion = UIDescribes.QUESTION_P27;
      return checkC34(thongTinTV);
    } else {
      //LogUtils.warn("ProcedureMember: " + "C25");
      mQuestion = UIDescribes.QUESTION_P27;
      return checkC26(thongTinTV);
    }
  }

  bool checkC26(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c26 == null) {
      //LogUtils.warn("ProcedureMember: " + "C26");
      mQuestion = UIDescribes.QUESTION_P28;
      return false;
    }
    if (thongTinTV.c26 != null && (thongTinTV.c26 == 1 || thongTinTV.c26 == 2)) {
      return checkC34(thongTinTV);
    } else {
      return checkC27(thongTinTV);
    }
  }

  bool checkC27(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c27 == null) {
      //LogUtils.warn("ProcedureMember: " + "C27");
      mQuestion = UIDescribes.QUESTION_P29;
      return false;
    }
    if (thongTinTV.c27 != null && thongTinTV.c27 == 2) {
      return checkC34(thongTinTV);
    } else {
      return checkC28(thongTinTV);
    }
  }

  bool checkC28(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c28 == null) {
      //LogUtils.warn("ProcedureMember: " + "C28");
      mQuestion = UIDescribes.QUESTION_P30;
      return false;
    }
    if (thongTinTV.c28 != null && thongTinTV.c28 == 1) {
      return checkC34(thongTinTV);
    } else {
      return checkC29(thongTinTV);
    }
  }

  bool checkC29(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c29 == null) {
      //LogUtils.warn("ProcedureMember: " + "C29");
      mQuestion = UIDescribes.QUESTION_P31;
      return false;
    }

    if (thongTinTV.c29 != null && thongTinTV.c29 == 1) {
      return checkC30_New(thongTinTV);
    } else {
      //LogUtils.warn("ProcedureMember: " + "C29");
      mQuestion = UIDescribes.QUESTION_P31;
      return checkC30(thongTinTV);
    }
  }

  bool checkC30(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c30 == null) {
      //LogUtils.warn("ProcedureMember: " + "C30");
      mQuestion = UIDescribes.QUESTION_P32;
      return false;
    }

    if (thongTinTV.c30 != null && thongTinTV.c30 == 1) {
      return checkC30_New(thongTinTV);
    } else {
      return checkC30A(thongTinTV);
    }
  }

  bool checkC30_New(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        (thongTinTV.c30_A == null || thongTinTV.c30_B == null || thongTinTV.c30_C == null ||
            thongTinTV.c30_D == null || thongTinTV.c30_E == null || thongTinTV.c30_F == null ||
            thongTinTV.c30_G == null || thongTinTV.c30_H == null || thongTinTV.c30_I == null)) {
      //LogUtils.warn("ProcedureMember: " + "C30_New");
      mQuestion = UIDescribes.QUESTION_P33;
      return false;
    }
    return checkC32(thongTinTV);
  }

  bool checkC30A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c30A == null) {
      //LogUtils.warn("ProcedureMember: " + "C30A");
      mQuestion = UIDescribes.QUESTION_P34;
      return false;
    }

    if (thongTinTV.c30A != null && thongTinTV.c30A == 2) {
      return checkC33A(thongTinTV);
    } else {
      return checkC31(thongTinTV);
    }
  }

  bool checkC31(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c31 == null) {
      //LogUtils.warn("ProcedureMember: " + "C31");
      mQuestion = UIDescribes.QUESTION_P35;
      return false;
    }
    return checkC32(thongTinTV);
  }

  bool checkC32(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c32 == null) {
      //LogUtils.warn("ProcedureMember: " + "C32");
      mQuestion = UIDescribes.QUESTION_P36;
      return false;
    }
    if (thongTinTV.c32 != null && thongTinTV.c32 == 2) {
      return checkC33A(thongTinTV);
    } else {
      return checkC33(thongTinTV);
    }
  }

//    bool checkKT6(thongTinThanhVienModel thongTinTV) {
//        if (((thongTinTV.c29 != null && thongTinTV.c29 == 1) || (thongTinTV.c30 != null && thongTinTV.c30 == 1)) && thongTinTV.c32 == 1) {
//            return checkC33(thongTinTV);
//        } else {
//            return checkC62A(thongTinTV);
//        }
//    }

  bool checkC33(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c33 == null) {
      //LogUtils.warn("ProcedureMember: " + "C33");
      mQuestion = UIDescribes.QUESTION_P37;
      return false;
    }
    return checkC33A(thongTinTV);
  }

  bool checkC33A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c33A == null) {
      //LogUtils.warn("ProcedureMember: " + "C33A");
      mQuestion = UIDescribes.QUESTION_P38;
      return false;
    }
    return checkC63(thongTinTV);
  }


  bool checkC34(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c34 == null || thongTinTV.c34 == "") {
      //LogUtils.warn("ProcedureMember: " + "C34");
      mQuestion = UIDescribes.QUESTION_P39;
      return false;
    }
    return checkC35A(thongTinTV);
  }

  bool checkC35A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c35A == null) {
      //LogUtils.warn("ProcedureMember: " + "C35A");
      mQuestion = UIDescribes.QUESTION_P40;
      return false;
    }
    return checkC36(thongTinTV);
  }

  bool checkC36(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c36 == null) {
      //LogUtils.warn("ProcedureMember: " + "C36");
      mQuestion = UIDescribes.QUESTION_P41;
      return false;
    }
    return checkC37A(thongTinTV);
  }

  bool checkC37A(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c37A == null) {
      //LogUtils.warn("ProcedureMember: " + "C37A");
      mQuestion = UIDescribes.QUESTION_P42;
      return false;
    }
    return checkC38(thongTinTV);
  }

  bool checkC38(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c38 == null) {
      //LogUtils.warn("ProcedureMember: " + "C38");
      mQuestion = UIDescribes.QUESTION_P43;
      return false;
    }
    if (thongTinTV.c38 != null && thongTinTV.c38 == 1 && thongTinTV.c38 == 2
        && thongTinTV.c38 == 3 && thongTinTV.c38 == 13) {
      return checkC39(thongTinTV);
    } else {
      return checkC40(thongTinTV);
    }
  }

  bool checkC39(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c39 == null) {
      //LogUtils.warn("ProcedureMember: " + "C39");
      mQuestion = UIDescribes.QUESTION_P44;
      return false;
    }
    return checkC40(thongTinTV);
  }

  bool checkC40(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c40 == null) {
      //LogUtils.warn("ProcedureMember: " + "C40");
      mQuestion = UIDescribes.QUESTION_P45;
      return false;
    }
    if (thongTinTV.c40 != null && thongTinTV.c40 == 0) {
      return checkC40A(thongTinTV);
    } else {
      return checkC41(thongTinTV);
    }
  }

  bool checkC40A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c40A == null) {
      //LogUtils.warn("ProcedureMember: " + "C40A");
      mQuestion = UIDescribes.QUESTION_P46;
      return false;
    }
    return checkC41(thongTinTV);
  }

  bool checkC41(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c41 == null) {
      //LogUtils.warn("ProcedureMember: " + "C41");
      mQuestion = UIDescribes.QUESTION_P47;
      return false;
    }
    //LogUtils.warn("ProcedureMember: " + "C41");
    mQuestion = UIDescribes.QUESTION_P54;
    return checkKT7(thongTinTV);
  }

  bool checkKT7(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c41 != null && thongTinTV.c41 == 1) {
      if (thongTinTV.c42 == null) {
        //LogUtils.warn("ProcedureMember: " + "C42");
        mQuestion = UIDescribes.QUESTION_P48;
        return false;
      } else {
        return checkC43(thongTinTV);
      }
    } else {
      return checkC42(thongTinTV);
    }
  }

  bool checkC42(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c42 == null) {
      //LogUtils.warn("ProcedureMember: " + "C42");
      mQuestion = UIDescribes.QUESTION_P48;
      return false;
    }
    return checkC43(thongTinTV);
  }

  bool checkC43(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c43 == null) {
      //LogUtils.warn("ProcedureMember: " + "C43");
      mQuestion = UIDescribes.QUESTION_P49;
      return false;
    }
    if (thongTinTV.c43 != null && thongTinTV.c43 != 5) {
      return checkC45(thongTinTV);
    } else {
      return checkC44(thongTinTV);
    }
  }

  bool checkC44(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c44 == null) {
      //LogUtils.warn("ProcedureMember: " + "C44");
      mQuestion = UIDescribes.QUESTION_P50;
      return false;
    }
    return checkC45(thongTinTV);
  }

  bool checkC45(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c45 == null) {
      //LogUtils.warn("ProcedureMember: " + "C45");
      mQuestion = UIDescribes.QUESTION_P51;
      return false;
    }
    if (thongTinTV.c45 != null && thongTinTV.c45 == 2) {
      return checkC47(thongTinTV);
    } else {
      return checkC46(thongTinTV);
    }
  }

  bool checkC46(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c46 == null) {
      //LogUtils.warn("ProcedureMember: " + "C46");
      mQuestion = UIDescribes.QUESTION_P52;
      return false;
    }
    return checkC47(thongTinTV);
  }

  bool checkC47(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c47 == null) {
      //LogUtils.warn("ProcedureMember: " + "C47");
      mQuestion = UIDescribes.QUESTION_P53;
      return false;
    }
    return checkC48(thongTinTV);
  }

  bool checkC48(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c48 == null) {
      //LogUtils.warn("ProcedureMember: " + "C48");
      mQuestion = UIDescribes.QUESTION_P54;
      return false;
    }
    if (thongTinTV.c48 != null && thongTinTV.c48 == 2) {
      return checkC59(thongTinTV);
    } else {
      return checkC49(thongTinTV);
    }
  }

  bool checkC49(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c49 == null) {
      //LogUtils.warn("ProcedureMember: " + "C49");
      mQuestion = UIDescribes.QUESTION_P55;
      return false;
    }
    return checkC50A(thongTinTV);
  }

  bool checkC50A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c50A == null) {
      //LogUtils.warn("ProcedureMember: " + "C50A");
      mQuestion = UIDescribes.QUESTION_P56;
      return false;
    }
    return checkC51(thongTinTV);
  }

  bool checkC51(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c51 == null) {
      //LogUtils.warn("ProcedureMember: " + "C51");
      mQuestion = UIDescribes.QUESTION_P57;
      return false;
    }
    return checkC52A(thongTinTV);
  }

  bool checkC52A(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c52A == null) {
      //LogUtils.warn("ProcedureMember: " + "C52A");
      mQuestion = UIDescribes.QUESTION_P58;
      return false;
    }
    return checkC53(thongTinTV);
  }

  bool checkC53(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c53 == null) {
      //LogUtils.warn("ProcedureMember: " + "C53");
      mQuestion = UIDescribes.QUESTION_P59;
      return false;
    }
    return checkC54(thongTinTV);
  }

  bool checkC54(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c54 == null) {
      //LogUtils.warn("ProcedureMember: " + "C54");
      mQuestion = UIDescribes.QUESTION_P60;
      return false;
    }
    return checkKT8(thongTinTV);
  }

  bool checkKT8(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c54 != null && thongTinTV.c54 == 1) {
      return checkC56(thongTinTV);
    } else {
      return checkC55(thongTinTV);
    }
  }

  bool checkC55(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c55 == null) {
      //LogUtils.warn("ProcedureMember: " + "C55");
      mQuestion = UIDescribes.QUESTION_P61;
      return false;
    }
    return checkC56(thongTinTV);
  }

  bool checkC56(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c56 == null) {
      //LogUtils.warn("ProcedureMember: " + "C56");
      mQuestion = UIDescribes.QUESTION_P62;
      return false;
    }
//        //LogUtils.warn("ProcedureMember: " + "C56");
//        mQuestion = UIDescribes.QUESTION_C56;
//        return true;
    if (thongTinTV.c56 != null && thongTinTV.c56 == 2) {
      return checkC59(thongTinTV);
    } else {
      return checkC57(thongTinTV);
    }
  }

  bool checkC57(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c57 == null) {
      //LogUtils.warn("ProcedureMember: " + "C57");
      mQuestion = UIDescribes.QUESTION_P63;
      return false;
    }
    return checkC58(thongTinTV);
  }

  bool checkC58(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c58 == null) {
      //LogUtils.warn("ProcedureMember: " + "C58");
      mQuestion = UIDescribes.QUESTION_P64;
      return false;
    }
    return checkC59(thongTinTV);
  }

  bool checkC59(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c48 != null && thongTinTV.c59 == null) {
      //LogUtils.warn("ProcedureMember: " + "C59");
      mQuestion = UIDescribes.QUESTION_P65;
      return false;
    } else if (thongTinTV.c48 != null && thongTinTV.c48 == 1
        && thongTinTV.c56 != null && thongTinTV.c56 == 1) {
      int sogio2CV = 0;
      int tongC59 = 0;
      if (thongTinTV.c40 != null && thongTinTV.c53 != null && thongTinTV.c57 != null && thongTinTV.c59 != null) {
        sogio2CV = thongTinTV.c40! + thongTinTV.c53!;
        tongC59 = sogio2CV + thongTinTV.c57!;
        if (thongTinTV.c59 != tongC59) {
          //LogUtils.warn("ProcedureMember: " + "C59");
          mQuestion = UIDescribes.QUESTION_P65;
          return false;
        }
      }
    } else if (thongTinTV.c48 != null && thongTinTV.c48 == 1
        && thongTinTV.c56 != null && thongTinTV.c56 == 2
        && thongTinTV.c40 != null && thongTinTV.c59 != null && thongTinTV.c53 != null
        && thongTinTV.c59 != (thongTinTV.c40! + thongTinTV.c53!)) {
      //LogUtils.warn("ProcedureMember: " + "C59");
      mQuestion = UIDescribes.QUESTION_P65;
      return false;
    }
    return checkC60(thongTinTV);
  }

  bool checkC60(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c05 != null && thongTinTV.c05 == 1) &&
        (thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c48 != null && thongTinTV.c60 == null) {
      //LogUtils.warn("ProcedureMember: " + "C60");
      mQuestion = UIDescribes.QUESTION_P66;
      return false;
    } else if (thongTinTV.c48 != null && thongTinTV.c48 == 1
        && thongTinTV.c56 != null && thongTinTV.c56 == 1) {
      int sotien2CV = 0;
      int tongC60 = 0;
      if (thongTinTV.c42 != null && thongTinTV.c55 != null && thongTinTV.c58 != null && thongTinTV.c60 != null) {
        sotien2CV = thongTinTV.c42! + thongTinTV.c55!;
        tongC60 = sotien2CV + thongTinTV.c58!;
        if (thongTinTV.c60 == tongC60) {
          //LogUtils.warn("ProcedureMember: " + "C60");
          mQuestion = UIDescribes.QUESTION_P73;
          return false;
        }
      }
    } else if (thongTinTV.c48 != null && thongTinTV.c48 == 1
        && thongTinTV.c56 != null && thongTinTV.c56 == 2
        && thongTinTV.c60 != null && thongTinTV.c55 != null
        && thongTinTV.c60 != (thongTinTV.c42! + thongTinTV.c55!)) {
      //LogUtils.warn("ProcedureMember: " + "C60");
      mQuestion = UIDescribes.QUESTION_P73;
      return false;
    }
    return checkC61(thongTinTV);
  }

  bool checkC61(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c61 == null) {
      //LogUtils.warn("ProcedureMember: " + "C61");
      mQuestion = UIDescribes.QUESTION_P67;
      return false;
    }
    if (thongTinTV.c61 != null && thongTinTV.c61 == 1) {
      return checkC62(thongTinTV);
    } else {
      return checkC63(thongTinTV);
    }
  }

  bool checkC62(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c62 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P68;
      return false;
    }
    return checkC63(thongTinTV);
  }

  bool checkC63(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c63 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P69;
      return false;
    }
    return checkKT9(thongTinTV);
  }

  bool checkKT9(thongTinThanhVienModel thongTinTV) {
    if (thongTinTV.c63 != null && thongTinTV.c63 == 0) {
      return checkC65(thongTinTV);
    } else {
      return checkC64(thongTinTV);
    }
  }

  bool checkC64(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c64 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P70;
      return false;
    }
    return checkC65(thongTinTV);
  }

  bool checkC65(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c65 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P71;
      return false;
    }
    return checkC66(thongTinTV);
  }
  bool checkC66(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c66 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P72;
      return false;
    }
    return checkC67(thongTinTV);
  }
  bool checkC67(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c67 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P73;
      return false;
    }
    return checkC68(thongTinTV);
  }
  
  bool checkC68(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c68 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P74;
      return false;
    }
    return checkC69(thongTinTV);
  }

  bool checkC69(thongTinThanhVienModel thongTinTV) {
    if ((thongTinTV.c04 != null && (thongTinTV.c04 ?? 0) >= 15) &&
        thongTinTV.c69 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62");
      mQuestion = UIDescribes.QUESTION_P75;
      return false;
    }
    //LogUtils.warn("ProcedureMember: " + "C62");
    mQuestion = UIDescribes.QUESTION_P75;
    return true;
  }

  //DSH

  bool checkC62_M1(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M1 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M1");
      mQuestion = UIDescribes.QUESTION_P76;
      return false;
    }
    return checkC62_M2(doiSongHo);
  }

  bool checkC62_M2(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M2 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M2");
      mQuestion = UIDescribes.QUESTION_P77;
      return false;
    }
    if(doiSongHo.c62_M2 != null && doiSongHo.c62_M2 == 3) {
      return checkC62_M3(doiSongHo);
    } else {
      return checkC62_M4(doiSongHo);
    }
  }

  bool checkC62_M3(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M3A == null || doiSongHo.c62_M3B == null || doiSongHo.c62_M3C == null ||
        doiSongHo.c62_M3D == null || doiSongHo.c62_M3E == null || doiSongHo.c62_M3F == null ||
        doiSongHo.c62_M3G == null || doiSongHo.c62_M3H == null || doiSongHo.c62_M3I == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M3");
      mQuestion = UIDescribes.QUESTION_P78;
      return false;
    }
    return checkC62_M4(doiSongHo);
  }

  bool checkC62_M4(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M4 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M4");
      mQuestion = UIDescribes.QUESTION_P79;
      return false;
    }
    if(doiSongHo.c62_M4 != null && doiSongHo.c62_M4 == 3) {
      return checkC62_M5(doiSongHo);
    } else {
      return checkC62_M6(doiSongHo);
    }
  }

  bool checkC62_M5(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M5A == null || doiSongHo.c62_M5B == null || doiSongHo.c62_M5C == null ||
        doiSongHo.c62_M5D == null || doiSongHo.c62_M5E == null || doiSongHo.c62_M5F == null ||
        doiSongHo.c62_M5G == null || doiSongHo.c62_M5H == null || doiSongHo.c62_M5I == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M5");
      mQuestion = UIDescribes.QUESTION_P80;
      return false;
    }
    return checkC62_M6(doiSongHo);
  }

  bool checkC62_M6(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M6 == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M6");
      mQuestion = UIDescribes.QUESTION_P81;
      return false;
    }
    if(doiSongHo.c62_M6 != null && doiSongHo.c62_M6 == 3) {
      return checkC62_M7(doiSongHo);
    } else {
      return checkC62_M8(doiSongHo);
    }
  }

  bool checkC62_M7(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M7A == null || doiSongHo.c62_M7B == null || doiSongHo.c62_M7C == null ||
        doiSongHo.c62_M7D == null || doiSongHo.c62_M7E == null || doiSongHo.c62_M7F == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M7");
      mQuestion = UIDescribes.QUESTION_P82;
      return false;
    }
    return checkC62_M8(doiSongHo);
  }

  bool checkC62_M8(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M8A == null || doiSongHo.c62_M8B == null || doiSongHo.c62_M8C == null ||
        doiSongHo.c62_M8D == null || doiSongHo.c62_M8E == null || doiSongHo.c62_M8F == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M8");
      mQuestion = UIDescribes.QUESTION_P83;
      return false;
    }
    return checkC62_M9(doiSongHo);
  }

  bool checkC62_M9(DoiSongHoModel doiSongHo) {
    if (doiSongHo.c62_M9A == null || doiSongHo.c62_M9B == null || doiSongHo.c62_M9C == null ||
        doiSongHo.c62_M9D == null || doiSongHo.c62_M9E == null) {
      //LogUtils.warn("ProcedureMember: " + "C62_M9");
      mQuestion = UIDescribes.QUESTION_P84;
      return false;
    }
    mQuestion = UIDescribes.QUESTION_P84;
    return true;
  }

}