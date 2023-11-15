class UIQuestions{

  static String q1(String month) {
    return 'Q1. Xin ông/bà cho biết họ và tên những người vẫn thường '
        'xuyên ăn ở tại hộ được 6 tháng trở lên tính đến thời điểm 0 giờ ngày '
        '01/$month/${DateTime.now().year} không phân biệt có hay không có hộ khẩu thường trú tại hộ '
        '(không bao gồm người của hộ là sinh viên đang đi học xa nhà hoặc học sinh'
        ' phổ thông đang học tại các trường nội trú)';
  }
  static String q2(String month) {
    return 'Q2. Trong hồ ông/bà, có ai mới chuyển đến hộ '
        '(bao gồm cả trẻ em mới sinh) chưa được 6 tháng tính đến thời điểm 0 giờ '
        'ngày 01/$month/${DateTime.now().year} nhưng xác định sẽ ăn ở lâu dài tại hộ?\nLưu ý: Bao gồm '
        'những người đã chuyển cả hộ tới hộ đang phỏng vấn';
  }
  static const q3 = 'Q3. Trong tất cả những người đã kể tên có ai là: (NHỮNG '
      'NGƯỜI CÓ TRONG CÂU Q1)';
  static const q3a = 'a. Học sinh phổ thông đến trọ học/ở nhờ';
  static const q3b = 'b. Người đến hộ dưới 1 năm vì các mục đích: đến chơi/thăm,'
      ' nghỉ hè, nghỉ lễ; chữa bệnh; công tác; đào tạo ngắn hạn...?';
  static const q3c = 'c. Người nước ngoài chưa nhập quốc tịch Việt Nam, Việt '
      'kiều về thăm gia đình?';
  static const q3d = 'd. Bộ đội công an, ăn ở tập trung trong doanh trại/đơn vị?';
  static String q4 (String month) {
    return 'Q4. Trong hộ ông/bà, có ai lâu nay vẫn thường xuyên ăn ở '
        'tại hộ nhưng tại thời điểm: 0 giờ ngày 01/$month/${DateTime.now().year} tạm vắng vì các lý do '
        'như:';
  }
  static const q4a = 'a. Đi làm ăn xa dưới 6 tháng và không có quyết định tuyển'
      ' dụng hoặc hợp đồng lao động?';
  static const q4b = 'b. Điều trị nội trú tại cơ sở y tế?';
  static const q4c = 'c. Người rời hộ dưới 1 năm vì các mục đích: Đi chơi/thăm; '
      'nghỉ hè, nghỉ lễ, du lịch; chữa bệnh; công tác; đào tạo ngắn hạn...?';
  static const q4d = 'd. Học sinh phổ thông đi trọ học/ở nhờ; người đi buồn '
      'chuyến; đi tàu viễn dương; đánh bắt hải sản?';
  static const q4e = 'e. Đi nước ngoài trong thời hạn cho phép?';
  static const q4f = 'f. Bị công an, quân đội tạm giữ?';
  static String q5(String month) {
    return 'Q5.  Có ai vẫn thường xuyên ăn, ở tại hộ nhưng đã chết '
        'sau thời điểm 0 giờ ngày 01/$month/${DateTime.now().year} và chưa được kế tên ở trên không?';
  }
  static const q6 = 'Q6. Những người là nhân khẩu thực tế thường trú tại hộ:'
      '\n(ĐỌC TÊN NHỮNG NGƯỜI ĐƯỢC HIỂN THỊ TRONG DANH SÁCH NHỮNG NGƯỜI KHÔNG BỊ '
      'GẠCH TÊN Ở CÂU Q1, NHỮNG NGƯỜI CÓ TÊN TRONG CÂU Q4 VÀ CÂU Q5)';
  static const q7 = 'Q7. Xin ông/bà cho biết ai là chủ hộ?';
}