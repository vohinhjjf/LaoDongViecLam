import '../models/doiSongHo_model.dart';
import '../models/thongTinThanhVien_model.dart';

class AppValues {
  AppValues._();

  static const appName = 'Điều tra tôn giáo, tín ngưỡng';
  static const timeOut = 15; // 15s for limit request
  static const bundleIdAndroid =
      'cosis.tongiao2023'; // get from android/app/build.gradle
  static const bundleIdIos =
      'gov.statistics.investigation.individual'; // get from ios/Runner/Info.plist
  static const versionApp = '1.1.7';
  static const urlStore =
      "https://apps.apple.com/us/app/%C4%91i%E1%BB%81u-tra-c%C3%A1-th%E1%BB%83/id1601976197";
  // border
  static const borderLv1 = 6.0;
  static const borderLv2 = 12.0;
  static const borderLv3 = 20.0;
  static const borderLv4 = 24.0;
  static const borderLv5 = 32.0;

  static const padding = 20.0;

  static const buttonHeight = 48.0;

  static String P01(int status, String orther){
    switch (status){
      case 1: return "CHỦ HỘ";
      case 2: return "VỢ/CHỒNG";
      case 3: return "CON ĐẺ";
      case 4: return "CHÁU NỘI/NGOẠI";
      case 5: return "BỐ/MẸ";
      case 6: return "QUAN HỆ GIA ĐÌNH KHÁC";
      case 7: return "NGƯỜI GIÚP VIỆC";
      case 8: return orther;
    }
    return "";
  }

  static String P08(int status){
    switch (status){
      case 1: return "CHƯA VỢ/CHỒNG";
      case 2: return "CÓ VỢ/CHỒNG";
      case 3: return "GÓA";
      case 4: return "LY HÔN";
      case 5: return "LY THÂN";
    }
    return "";
  }

  static String P09(int status){
    switch (status){
      case 1: return "DƯỚI 1 THÁNG";
      case 2: return "1 ĐẾN DƯỚI 6 THÁNG";
      case 3: return "6 ĐẾN DƯỚI 12 THÁNG";
      case 4: return "12 ĐẾN DƯỚI 5 NĂM";
      case 5: return "5 NĂM TRỞ LÊN";
    }
    return "";
  }

  static String P12(int status, String orther){
    switch (status){
      case 1: return "TÌM VIỆC/BẮT ĐẦU CÔNG VIỆC MỚI";
      case 2: return "MẤT/HẾT VIỆC, KHÔNG TÌM ĐƯỢC VIỆC";
      case 3: return "THEO GIA ĐÌNH CHUYỂN NHÀ";
      case 4: return "DO DỊCH BỆNH";
      case 5: return "KẾT HÔN";
      case 6: return "ĐI HỌC";
      case 7: return orther;
    }
    return "";
  }

  static String P15(int status){
    switch (status){
      case 1: return "CHƯA BAO GIỜ ĐI HỌC";
      case 2: return "CHƯA HỌC XONG TIỂU HỌC";
      case 3: return "TIỂU HỌC";
      case 4: return "TRUNG HỌC CƠ SỞ";
      case 5: return "TRUNG HỌC PHỔ THÔNG";
    }
    return "";
  }

  static String P23(int status, String orther){
    switch (status){
      case 1: return "CHỜ BẮT ĐẦU CÔNG VIỆC HOẶC HOẠT ĐỘNG KINH DOANH MỚI";
      case 2: return "LÀM THEO CA/KÍP, THỜI GIAN LINH HOẠT/ DO TÍNH CHẤT CÔNG VIỆC";
      case 3: return "CÔNG VIỆC THEO MÙA/VỤ";
      case 4: return "NGHỈ HÈ/NGHỈ LỄ/ĐI DU LỊCH";
      case 5: return "ỐM ĐAU/TAI NẠN";
      case 6: return "NGHỈ THAI SẢN";
      case 7: return "ĐI HỌC/ĐÀO TẠO";
      case 8: return "BẬN VIỆC RIÊNG";
      case 9: return "NGHỈ GIÃN VIỆC/TẠM NGỪNG SẢN XUẤT/GIẢM KHÁCH HÀNG";
      case 10: return "THỜI TIẾT XẤU/THIÊN TAI";
      case 11: return "DO DỊCH BỆNH";
      case 12: return "ĐÌNH CÔNG/BIỂU TÌNH";
      case 13: return "KHUYẾT TẬT/ ỐM ĐAU LÂU DÀI";
      case 14: return orther;
    }
    return "";
  }

  static String P27(int status){
    switch (status){
      case 1: return "TRỒNG TRỌT/CHĂN NUÔI";
      case 2: return "THỦY SẢN";
      case 3: return "LÂM NGHIỆP";
      case 4: return "KHÁC";
    }
    return "";
  }

  static String P28(int status){
    switch (status){
      case 1: return "CHỈ ĐỂ BÁN";
      case 2: return "CHỦ YẾU ĐỂ BÁN";
      case 3: return "CHỈ ĐỂ GIA ĐÌNH DÙNG";
      case 4: return "CHỦ YẾU ĐỂ GIA ĐÌNH DÙNG";
    }
    return "";
  }

  static String P35(int status, String orther){
    switch (status){
      case 1: return "QUÁ GIÀ/QUÁ TRẺ";
      case 2: return "MẤT KHẢ NĂNG LAO ĐỘNG";
      case 3: return "NỘI TRỢ";
      case 4: return "BẬN HỌC (SV/HS/HỌC VIỆC)";
      case 5: return "KHÔNG MUỐN/KHÔNG CẦN ĐI LÀM";
      case 6: return "TIN LÀ KHÔNG CÓ VIỆC/KHÔNG CÓ VIỆC THÍCH HỢP";
      case 7: return "KHÔNG BIẾT TÌM Ở ĐÂU/BẰNG CÁCH NÀO";
      case 8: return "TẠM NGHỈ DO THU HẸP/NGỪNG SẢN XUẤT";
      case 9: return "ĐỢI VIỆC/ĐỢI KHAI TRƯƠNG HĐKD";
      case 10: return "THỜI TIẾT XẤU/THIÊN TAI";
      case 11: return "DO DỊCH BỆNH";
      case 12: return "BẬN VIỆC GIA ĐÌNH/ĐANG NGHỈ NGƠI";
      case 13: return "LÀM NÔNG NGHIỆP";
      case 14: return "ỐM/ĐAU TẠM THỜI";
      case 15: return orther;
    }
    return "";
  }

  static String P37(int status){
    switch (status){
      case 1: return "DƯỚI 1 THÁNG";
      case 2: return "TỪ 1 ĐẾN DƯỚI 3 THÁNG";
      case 3: return "TỪ 3 ĐẾN DƯỚI 6 THÁNG";
      case 4: return "TỪ 6 ĐẾN DƯỚI 12 THÁNG";
      case 5: return "TỪ 1 NĂM ĐẾN DƯỚI 2 NĂM";
      case 6: return "TỪ 2 NĂM TRỞ LÊN";
    }
    return "";
  }

  static String P38(int status, String orther){
    switch (status){
      case 1: return "ĐI HỌC/ĐÀO TẠO";
      case 2: return "LÀM VIỆC NHÀ, VIỆC GIA ĐÌNH";
      case 3: return "ỐM ĐAU/MẤT KHẢ NĂNG LAO ĐỘNG";
      case 4: return "LÀM NÔNG NGHIỆP/ THỦY SẢN CHỦ YẾU CHO GIA ĐÌNH SỬ DỤNG";
      case 5: return "NGHỈ HƯU";
      case 6: return orther;
    }
    return "";
  }

  static String P43(int status){
    switch (status){
      case 1: return "Hộ hoạt động nông, lâm nghiệp, thủy sản";
      case 2: return "Cơ sở sản xuất kinh doanh cá thể (không phải hộ nông, lâm nghiệp, thủy sản";
      case 3: return "Cá nhân làm tự do";
      case 4: return "Hợp tác xã";
      case 5: return "Doanh nghiệp do Nhà nước làm chủ";
      case 6: return "Doanh nghiệp do tư nhân làm chủ";
      case 7: return "Doanh nghiệp do nước ngoài làm chủ";
      case 8: return "Đơn vị sự nghiệp nhà nước";
      case 9: return "Đơn vị sự nghiệp ngoài nhà nước";
      case 10: return "Cơ quan lập pháp/hành pháp/tư pháp";
      case 11: return "Tổ chức chính trị - xã hội (Đảng, Đoàn thanh niên, Hội phụ nữ…)";
      case 12: return "Tổ chức nước ngoài (hoạt động phi lợi nhuận)";
      case 13: return "Tổ chức đoàn thể khác (Hiệp hội Dệt may. Hiệp hội Giày da Việt Nam…)";
    }
    return "";
  }

  static String P47_60(int status){
    switch (status){
      case 1: return "Không có thu nhập";
      case 2: return "Dưới 1 triệu";
      case 3: return "Từ 1 triệu đến dưới 10 triệu";
      case 4: return "Từ 10 triệu đến dưới 20 triệu";
      case 5: return "Từ 20 triệu đến dưới 50 triệu";
      case 6: return "Từ 50 triệu đến dưới 100 triệu";
      case 7: return "Từ 100 triệu trở lên";
    }
    return "";
  }

  static String P49(int status){
    switch (status){
      case 1: return "Chủ cơ sở (có thuê lao động)";
      case 2: return "Tự làm";
      case 3: return "Lao động gia đình";
      case 4: return "Xã viên hợp tác xã";
      case 5: return "Làm công ăn lương";
    }
    return "";
  }

  static String P50(int status){
    switch (status){
      case 1: return "Hợp đồng không xác định thời hạn";
      case 2: return "Hợp đồng 1 năm đến dưới 3 năm";
      case 3: return "Hợp đồng 3 tháng đến dưới 1 năm";
      case 4: return "Hợp đồng dưới 3 tháng";
      case 5: return "Hợp đồng giao khoán công việc";
      case 6: return "Thỏa thuận miệng";
      case 7: return "Không có hợp đồng lao động";
    }
    return "";
  }

  static String P53(int status){
    switch (status){
      case 1: return "DƯỚI 1 THÁNG";
      case 2: return "TỪ 1 ĐẾN DƯỚI 3 THÁNG";
      case 3: return "TỪ 3 ĐẾN DƯỚI 12 THÁNG";
      case 4: return "TỪ 12 THÁNG ĐẾN DƯỚI 3 NĂM";
      case 5: return "TỪ 3 NĂM ĐẾN DƯỚI 9 NĂM";
      case 6: return "TỪ 9 NĂM TRỞ LÊN";
    }
    return "";
  }

  static String P76(int status){
    switch (status){
      case 1: return "CẢI THIỆN HƠN";
      case 2: return "NHƯ CŨ";
      case 3: return "GIẢM SÚT";
      case 4: return "KHÔNG BIẾT";
    }
    return "";
  }

  static String P77_79_81(int status){
    switch (status){
      case 1: return "TĂNG LÊN";
      case 2: return "KHÔNG THAY ĐỔI";
      case 3: return "GIẢM ĐI";
      case 4: return "KHÔNG BIẾT";
    }
    return "";
  }

  static String P16(thongTinThanhVienModel tttv){
    if(tttv.c14A  == 1) return "Sơ cấp/Giấy phép lái xe ô tô";
    if(tttv.c14B  == 1) return "Trung cấp";
    if(tttv.c14C  == 1) return "Cao đẳng";
    if(tttv.c14D  == 1) return "Đại học";
    if(tttv.c14E  == 1) return "Thạc sỹ";
    if(tttv.c14F  == 1) return "Tiến sỹ";
    return "";
  }

  static String P33(thongTinThanhVienModel tttv){
    if(tttv.c30_A  == 1) return "Nộp đơn xin việc";
    if(tttv.c30_B  == 1) return "Liên hệ/Tư vấn cơ sở dịch vụ việc làm";
    if(tttv.c30_C  == 1) return "Qua bạn bè/người thân";
    if(tttv.c30_D  == 1) return "Đặt quảng cáo tìm việc";
    if(tttv.c30_E  == 1) return "Qua thông báo tuyển dụng (trên mạng/báo tin)";
    if(tttv.c30_F  == 1) return "Đã tham gia phỏng vấn";
    if(tttv.c30_G  == 1) return "Tìm việc tự do";
    if(tttv.c30_H  == 1) return "Chuẩn bị để bắt đầu hoạt động sản xuất kinh doanh";
    if(tttv.c30_I  == 1) return tttv.c30_IK ?? "";
    return "";
  }

  static String P78(DoiSongHoModel dsh){
    if(dsh.c62_M3A  == 1) return "Có thành viên mất việc làm/tạm nghỉ việc";
    if(dsh.c62_M3B  == 1) return "Chi phí đầu vào cho các hoạt động SXKD của hộ tăng";
    if(dsh.c62_M3C  == 1) return "Giá bán của các sản phẩm từ các hoạt động SXKD của hộ giảm";
    if(dsh.c62_M3D  == 1) return "Quy mô các hoạt động SXKD của hộ giảm";
    if(dsh.c62_M3E  == 1) return "Do ảnh hưởng của thiên tai";
    if(dsh.c62_M3F  == 1) return "Do ảnh hưởng của dịch bệnh đối với con người";
    if(dsh.c62_M3G  == 1) return "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng";
    if(dsh.c62_M3H  == 1) return "Do ảnh hưởng của hỏa hoạn, cháy nổ";
    if(dsh.c62_M3I  == 1) return dsh.c62_M3IK ?? "";
    return "";
  }

  static String P80(DoiSongHoModel dsh){
    if(dsh.c62_M5A  == 1) return "Có thành viên mất việc làm/tạm nghỉ việc";
    if(dsh.c62_M5B  == 1) return "Chi phí đầu vào cho các hoạt động SXKD của hộ tăng";
    if(dsh.c62_M5C  == 1) return "Giá bán của các sản phẩm từ các hoạt động SXKD của hộ giảm";
    if(dsh.c62_M5D  == 1) return "Quy mô các hoạt động SXKD của hộ giảm";
    if(dsh.c62_M5E  == 1) return "Do ảnh hưởng của thiên tai";
    if(dsh.c62_M5F  == 1) return "Do ảnh hưởng của dịch bệnh đối với con người";
    if(dsh.c62_M5G  == 1) return "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng";
    if(dsh.c62_M5H  == 1) return "Do ảnh hưởng của hỏa hoạn, cháy nổ";
    if(dsh.c62_M5I  == 1) return dsh.c62_M5IK ?? "";
    return "";
  }

  static String P82(DoiSongHoModel dsh){
    if(dsh.c62_M7A  == 1) return "Thu nhập giảm";
    if(dsh.c62_M7B  == 1) return "Do dảnh hưởng của thiên tai";
    if(dsh.c62_M7C  == 1) return "Do ảnh hưởng của giá hàng hóa";
    if(dsh.c62_M7D  == 1) return "Do ảnh hưởng của dịch bệnh đối với con người";
    if(dsh.c62_M7E  == 1) return "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng";
    if(dsh.c62_M7F  == 1) return dsh.c62_M7FK ?? "";
    return "";
  }

  static String P83(DoiSongHoModel dsh){
    if(dsh.c62_M8A  == 1) return "Thiên tai";
    if(dsh.c62_M8B  == 1) return "Giá hàng hóa, dịch vụ tăng cao";
    if(dsh.c62_M8C  == 1) return "Dịch bệnh đối với con người";
    if(dsh.c62_M8D  == 1) return "Dịch bệnh đối với vật nuôi, cây trồng";
    if(dsh.c62_M8E  == 1) return "Hỏa hoạn, cháy nổ";
    if(dsh.c62_M8F  == 1) return dsh.c62_M8FK ?? "";
    return "";
  }

  static String P84(DoiSongHoModel dsh){
    if(dsh.c62_M9A  == 1) return "Các chương trình, chính sách chung của Quốc gia";
    if(dsh.c62_M9B  == 1) return "Các chưởng trình, chính sách của địa phương";
    if(dsh.c62_M9C  == 1) return "Các hoạt động từ thiện của các tổ chức và cá nhân khác";
    if(dsh.c62_M9D  == 1) return "Họ hàng, người thân";
    if(dsh.c62_M9E  == 1) return dsh.c62_M9EK ?? "";
    return "";
  }
}