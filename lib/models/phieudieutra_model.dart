import 'dart:convert';

import 'package:lao_dong_viec_lam/models/bangkeThangDT_model.dart';
import 'package:lao_dong_viec_lam/models/doiSongHo_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinHoNKTT_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinHo_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinThanhVienNKTT_model.dart';
import 'package:lao_dong_viec_lam/models/thongTinThanhVien_model.dart';

class PhieuDieuTraModel {
  late BangKeThangDTModel? bangKeThangDT;
  late thongTinHoModel? thongTinHo;
  late thongTinHoNKTTModel? thongTinHoNKTT;
  late List<thongTinThanhVienNKTTModel>? lst_thongTinThanhVienNKTT;
  late List<thongTinThanhVienModel>? lst_thongTinThanhVien;
  late DoiSongHoModel? DoiSongHo;

  PhieuDieuTraModel(
      {this.bangKeThangDT,
        this.thongTinHo,
        this.thongTinHoNKTT,
        this.lst_thongTinThanhVienNKTT,
        this.lst_thongTinThanhVien,
        this.DoiSongHo,
      });

  PhieuDieuTraModel.fromJson(Map<String, dynamic> json) {
    bangKeThangDT = json['bangKeHo_ThangDT'];
    thongTinHo = json['tenCS_BK'];
    thongTinHoNKTT = json['diaChi_BK'];
    lst_thongTinThanhVienNKTT = json['tinhTrang_DTBK'];
    lst_thongTinThanhVien = json['tinhTrang_HDBK'];
    DoiSongHo = json['phieuTonGiao'];
  }

  String toJson() {
    return jsonEncode({
      'BangKeHo_ThangDT': bangKeThangDT!.toJson(),
      'ThongTinHo': thongTinHo!.toJson(),
      'ThongTinHoNKTT': thongTinHoNKTT!.toJson(),
      'ThongTinThanhVienNKTT': lst_thongTinThanhVienNKTT!.map((e) => e.toJson()).toList(),
      'ThongTinThanhVien': lst_thongTinThanhVien!.map((e) => e.toJson()).toList(),
      'ThongTinDoiSongHo': DoiSongHo!.toJson(),
    });
  }

  String toJson_1() {
    return jsonEncode({
      'bangKeHo_ThangDT': bangKeThangDT,
      'thongTinHo': thongTinHo,
    });
  }
}
