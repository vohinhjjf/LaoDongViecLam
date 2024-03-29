import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P40_42_viewmodel.dart';


class P40_42View extends StatefulWidget {
  const P40_42View({Key? key}) : super(key: key);

  @override
  State<P40_42View> createState() => _P40_42ViewState();
}

class _P40_42ViewState extends State<P40_42View> {
  late P40_42ViewModel p40_42viewModel;
  var thanhvien = thongTinThanhVienModel();
  final _congviec = TextEditingController();
  final _chucdanh = TextEditingController();
  final _machucdanh = TextEditingController();
  final _tencoso = TextEditingController();
  final _hoatdong = TextEditingController();
  final _mahoatdong = TextEditingController();
  final _text_find_nghe = TextEditingController();
  final _text_find_nganh = TextEditingController();
  List list_maNghe = [], list_nghe = [];
  List list_maNganh = [], list_nganh = [];
  String maNghe_macdinh = " ";
  String maNganh_macdinh = "0";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    p40_42viewModel = context.read();
    p40_42viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 300),
              () => {
            setState(() {
              thanhvien = p40_42viewModel.thanhvien;
              _congviec.text = p40_42viewModel.thanhvien.c34 ?? "";
              _chucdanh.text = p40_42viewModel.thanhvien.c35A ?? "";
              _machucdanh.text = p40_42viewModel.thanhvien.c35B ?? "";
              _tencoso.text = p40_42viewModel.thanhvien.c36 ?? "";
              _hoatdong.text = p40_42viewModel.thanhvien.c37A ?? "";
              _mahoatdong.text = p40_42viewModel.thanhvien.c37B ?? "";
              list_maNghe = p40_42viewModel.list_maNghe;
              list_nghe = p40_42viewModel.list_nghe;
              list_maNganh = p40_42viewModel.list_maNganh;
              list_nganh = p40_42viewModel.list_nganh;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        title: const UIText(
          text: UIDescribes.interviewDetails,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //P39
                  const UIText(
                    text: "P39. Mô tả công việc chính",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _congviec,
                    readOnly: true,
                  ),
                  const SizedBox(height: 20,),
                  //p40
                  UIRichText(
                    text1: "P40. (Câu 40A) Hãy mô tả chức danh (nếu có) của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " trong công việc này?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _chucdanh,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UIText(
                        text: "Chọn mã",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 40B)",
                        textColor: Colors.orange,
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                          flex: 5,
                          child: UITextFormField(
                            controller: _machucdanh,
                            readOnly: true,
                            onTap: (){
                              _showAddNgheDialog(maNghe_macdinh);
                            },
                          )
                      ),
                      Flexible(
                        flex: 1,
                        child: MaterialButton(
                          height: 58,
                          onPressed: () {
                            setState(() {
                              _machucdanh.text = '';
                            });
                          },
                          padding: const EdgeInsets.all(10),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)
                              )
                          ),
                          child: const Icon(
                            Icons.dangerous,
                            color: Colors.redAccent,
                            size: fontGreater,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  //P41
                  const UIText(
                    text: "P41. Tên cơ sở làm việc chính",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _tencoso,
                    readOnly: true,
                  ),
                  const SizedBox(height: 20,),
                  //p42
                  UIRichText(
                    text1: "P42. (Câu 42A) Hoạt động chính hoặc sản phẩm/dịch vụ chính của cơ sở nơi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm việc là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _hoatdong,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UIText(
                        text: "Chọn mã",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 42B)",
                        textColor: Colors.orange,
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                          flex: 5,
                          child: UITextFormField(
                            controller: _mahoatdong,
                            readOnly: true,
                            onTap: (){
                              _showAddNganhDialog(maNganh_macdinh);
                            },
                          ),
                      ),
                      Flexible(
                        flex: 1,
                        child: MaterialButton(
                          height: 58,
                          onPressed: () {
                            setState(() {
                              _mahoatdong.text = '';
                            });
                          },
                          padding: const EdgeInsets.all(10),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)
                              )
                          ),
                          child: const Icon(
                            Icons.dangerous,
                            color: Colors.redAccent,
                            size: fontGreater,
                          ),
                        ),
                      )
                    ],
                  ),
                  //Button
                  const SizedBox(height: 90,),
                ]),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UIBackButton(ontap: (){
              p40_42viewModel.P40_42Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if (_machucdanh.text == "") {
                showDialog(
                    context: context,
                    builder: (_) =>
                        UIWarningDialog(
                          waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                              .c00} có P40B - Mã nghề nhập vào chưa đúng!',)
                );
              }
              else if (_mahoatdong.text == "") {
                showDialog(
                    context: context,
                    builder: (_) =>
                        UIWarningDialog(
                          waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                              .c00} có P42B - Mã ngành nhập vào chưa đúng!',)
                );
              }
              else if(int.parse(_machucdanh.text) >= 2111 && int.parse(_machucdanh.text) <= 3642
                  && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là Nhà chuyên môn bậc cao mà không có trình độ CMKT!',)
                );
              }
              else if(((int.parse(_machucdanh.text) >= 3111 && int.parse(_machucdanh.text) <= 3315)
                  || (int.parse(_machucdanh.text) >= 3342 && int.parse(_machucdanh.text) <= 3359)
                  || (int.parse(_machucdanh.text) >= 3511 && int.parse(_machucdanh.text) <= 3620))
                  && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là Nhà chuyên môn bậc trung mà không có trình độ CMKT!',)
                );
              }
              else if(int.parse(_machucdanh.text) >= 2111 && int.parse(_machucdanh.text) <= 2659
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là Nhà chuyên môn bậc cao mà trình độ thấp hơn đại học!',)
                );
              }
              else if((int.parse(_machucdanh.text) == 8322
                  || int.parse(_machucdanh.text) == 8331
                  || int.parse(_machucdanh.text) == 8332)
                  && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là lái xe ô tô mà không có trình độ CMKT!',)
                );
              }
              else if(int.parse(_machucdanh.text) >= 6310 && int.parse(_machucdanh.text) <= 6340
                  && (thanhvien.c26 == 1 || thanhvien.c26 == 2)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là Lao động tự cung tự cấp trong nông nghiệp, lâm nghiệp và thủy sản mà mục đích chủ yếu của sản phẩm sản xuất ra để bán!',)
                );
              }
              else if(int.parse(_machucdanh.text) >= 1111 && int.parse(_machucdanh.text) <= 1526
                  && (int.parse(_mahoatdong.text) < 8411 || int.parse(_mahoatdong.text) > 8430)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Lãnh đạo trong các cấp các ngành có mã ngành không thuộc ngành quản lý NN!',)
                );
              }
              else if(((int.parse(_machucdanh.text) >= 2311 && int.parse(_machucdanh.text) <= 2342)
                  || (int.parse(_machucdanh.text) >= 3610 && int.parse(_machucdanh.text) <= 3630))
                  && (int.parse(_mahoatdong.text) < 8511 || int.parse(_mahoatdong.text) > 8560)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Giáo viên các cấp mà không thuộc ngành giá dục đào tạo!',)
                );
              }
              else if(int.parse(_machucdanh.text) >= 2211 && int.parse(_machucdanh.text) <= 2261
                  && (int.parse(_mahoatdong.text) < 8610 || int.parse(_mahoatdong.text) > 8699)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là y tá, bác sỹ mà có ngành khác hoạt động y tế!',)
                );
              }
              //43
              else if(int.parse(_mahoatdong.text) >= 510 && thanhvien.c38 == 1){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Lao động không thuộc ngành Nông, Lâm nghiệp và Thủy sản (C42B >=510) mà loại hình kình tế thuộc hộ NLNTS (C43 = 1)!',)
                );
              }
              else if(int.parse(_mahoatdong.text) < 510 && thanhvien.c38 == 3){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Lao động không thuộc ngành Nông, Lâm nghiệp và Thủy sản (C42B < 510) mà loại hình kình tế lại thuộc hộ SXKD (C43 = 3)!',)
                );
              }
              else if(int.parse(_mahoatdong.text) == 9700 && thanhvien.c38 != 3){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Người giúp việc trong các hộ gia đình mà loại hình là hộ sản xuất kinh doanh (C43 = 3)!',)
                );
              }
              else if(int.parse(_mahoatdong.text) == 8491 && int.parse(_mahoatdong.text) <= 8430
                  && thanhvien.c38 != 10 && thanhvien.c38 != 11 && thanhvien.c38 != 5){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Ngành thuộc hoạt động đảng cộng sản, tổ chức chính trị-xã hội, '
                          'quản lý nhà nước an ninh quốc phòng, bảo đảm xã hội bắt buộc mà loại '
                          'hình không thuộc cơ quan hành pháp/tư pháp/lập pháp hoặc tổ chức chính trị-xã hội!',)
                );
              }
              else if(int.parse(_mahoatdong.text) >= 0111 && int.parse(_mahoatdong.text) <= 0310
                  && int.parse(_mahoatdong.text) != 0220 && thanhvien.c38! >= 1 && thanhvien.c38! <= 4){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Ngành thuộc hoạt động đảng cộng sản, tổ chức chính trị-xã hội, '
                          'quản lý nhà nước an ninh quốc phòng, bảo đảm xã hội bắt buộc mà loại '
                          'hình không thuộc cơ quan hành pháp/tư pháp/lập pháp hoặc tổ chức chính trị-xã hội!',)
                );
              }
              else if((int.parse(_mahoatdong.text) >= 6430 && int.parse(_mahoatdong.text) <= 6499)
                  || ((int.parse(_mahoatdong.text) >= 6511 && int.parse(_mahoatdong.text) <= 6512))
                      && (thanhvien.c38 == 1 || thanhvien.c38 == 2 || thanhvien.c38 != 3
                          || thanhvien.c38 == 10 || thanhvien.c38 == 11)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Ngành thuộc hoạt động trung gian tiền tệ, cho thuê tài chính, ngân hàng và bảo hiểm... mà loại '
                          'hình NLTS, cá nhân làm tự do, cơ quan hành pháp/tư pháp/lập pháp hoặc tổ chức chính trị-xã hội!',)
                );
              }
              else if(int.parse(_mahoatdong.text) >= 510 && int.parse(_mahoatdong.text) <= 3320
                  && int.parse(_mahoatdong.text) != 1811 && (thanhvien.c38 == 9 || thanhvien.c38 == 8)){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Đơn vị sự nghiệp ngoài nhà nước hoặc đơn vị sự nghiệp NN mà '
                          'mã ngành thuộc khai khoáng hoặc chế biến, chế tạo!',)
                );
              }
              else if(int.parse(_mahoatdong.text) > 510 && int.parse(_mahoatdong.text) < 3320
                  && thanhvien.c38! >= 11 && thanhvien.c38! == 13){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Tổ chức nhà nước/tổ chức khác mà mã ngành thuộc khai khoáng hoặc chế biến, chế tạo!',)
                );
              }
              else if(int.parse(_mahoatdong.text) > 0 && int.parse(_mahoatdong.text) < 510
                  && thanhvien.c38 == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Khu vực hộ SXKD mà mã ngành thuộc ngành NLTS < 510!',)
                );
              }
              else if(int.parse(_mahoatdong.text) >= 510 && thanhvien.c38 == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Hộ NLNTS có mã ngành > 510!',)
                );
              }
              else if(int.parse(_mahoatdong.text) == 9700 && thanhvien.c43 == 3 && thanhvien.c38 == 3){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Cá nhân làm tự do (c43 = 3) có mã ngành là giúp việc gia đình (C42b = 9700) mà vị thế là lao động gia đình (C49 = 3)!',)
                );
              }
              //c52
              else if((int.parse(_machucdanh.text) == 0110 || int.parse(_machucdanh.text) == 0120
                  ||int.parse(_machucdanh.text) == 0210 || int.parse(_machucdanh.text) == 0220
                  || int.parse(_machucdanh.text) == 0310) && thanhvien.c46 == 2){
                showDialog(
                    context: context,
                    builder: (_) =>
                    const UIWarningDialog(
                      waring: 'Nghề là lãnh đạo các ngành các cấp hoặc lực lượng cũ trang mà đóng BHXH tự nguyện!',)
                );
              }
              //Notifi
              else if((int.parse(_machucdanh.text) >= 6111 && int.parse(_machucdanh.text) <= 6224)
                  && thanhvien.c14B == 2 && thanhvien.c14C == 2 && thanhvien.c14D == 2
                  && thanhvien.c14E == 2 && thanhvien.c14F == 2 && thanhvien.c16A == 2
                  && thanhvien.c16B == 2 && thanhvien.c16C == 2){
                condition_1();
              }
              else if(int.parse(_machucdanh.text) >= 0110 && int.parse(_machucdanh.text) <= 0310
                  && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                condition_2();
              }
              else if(((int.parse(_machucdanh.text) >= 7111 && int.parse(_machucdanh.text) <= 8209)
                  || (int.parse(_machucdanh.text) >= 8311 && int.parse(_machucdanh.text) <= 8350))
                  && thanhvien.c14B == 2 && thanhvien.c14C == 2 && thanhvien.c14D == 2
                  && thanhvien.c14E == 2 && thanhvien.c14F == 2 && thanhvien.c16A == 2
                  && thanhvien.c16B == 2 && thanhvien.c16C == 2){
                condition_3();
              }
              else if(int.parse(_machucdanh.text) >= 111 && int.parse(_machucdanh.text) <= 1710
                  && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                  && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
                condition_4();
              }
              else if(((int.parse(_machucdanh.text) >= 5111 && int.parse(_machucdanh.text) <= 5113)
                  || (int.parse(_machucdanh.text) >= 5131 && int.parse(_machucdanh.text) <= 5249)
                  || (int.parse(_machucdanh.text) >= 5161 && int.parse(_machucdanh.text) <= 5162)
                  || (int.parse(_machucdanh.text) >= 6111 && int.parse(_machucdanh.text) <= 6340)
                  || (int.parse(_machucdanh.text) >= 7111 && int.parse(_machucdanh.text) <= 7132)
                  || (int.parse(_machucdanh.text) >= 7211 && int.parse(_machucdanh.text) <= 7319)
                  || (int.parse(_machucdanh.text) >= 7511))
                  && (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)){
                condition_5();
              }
              else if(((int.parse(_machucdanh.text) >= 1710 && int.parse(_machucdanh.text) <= 1749)
                  && (thanhvien.c04! >= 15 && thanhvien.c04! <= 56) && thanhvien.c02 == 2)
                  || ((thanhvien.c04! >= 15 && thanhvien.c04! <= 60) && thanhvien.c02 == 1)
                      && thanhvien.c43 == 5 && (thanhvien.c45 == 2 || thanhvien.c46 == 2)){
                condition_6();
              }
              else if((int.parse(_machucdanh.text) >= 1011 && int.parse(_machucdanh.text) <= 1527)
                  && (thanhvien.c45 == 2 || thanhvien.c46 == 2)){
                condition_7();
              }
              else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                  || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
                condition_8();
              }
              else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                  && thanhvien.c42! >= 30000){
                condition_9();
              }
              else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                  && thanhvien.c42! >= 50000){
                condition_10();
              }
              else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                  && thanhvien.c42! >= 30000){
                condition_11();
              }
              else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
                condition_12();
              }
              else {
                condition_13();
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }

  _showAddNgheDialog(String select_nghe){
    showDialog(
        context: context,
        builder: (context) {
          _text_find_nghe.text = _chucdanh.text;
          String nghe = select_nghe;
          return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)),
                ),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.clear_fill,color: Colors.redAccent,),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const UIText(
                        text: "Danh mục Nghề",
                        textFontSize: fontLarge,
                        textColor: Colors.blue,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                        child: const UIText(
                          text:"Chọn mã cấp 1",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        //height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButton(
                          value: nghe,
                          items: list_maNghe.map((e) => DropdownMenuItem(
                            value: e["MaC1"].toString(),
                            child: UIText(textColor: Colors.black,text: '${e["MaC1"]}. ${e["TenC1"]}',),
                          )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              nghe = value!;
                              maNghe_macdinh = value;
                              _text_find_nghe.text = "";
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        //width: MediaQuery.of(context).size.width/1.2,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.20),
                        ),
                        child: TextField(
                          controller: _text_find_nghe,
                          style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: mPrimaryColor)),
                            hintText: "Nhập mã",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: fontMedium),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                        width: (MediaQuery.of(context).size.width/1.1),
                        height: (p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe).length <= 4) ? p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe).length*60 : 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                  setState(() {
                                    _machucdanh.text = p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe)[index]["Ma"];
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.55,
                                      child: UIText(
                                        textColor: Colors.black,
                                        text: '${p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe)[index]["Ma"]} - ${p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe)[index]["Ten"]}',
                                      ),
                                    ),
                                    IconButton(
                                        alignment: Alignment.centerRight,
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.lightBlue,
                                          //size: fontGreater,
                                        ),
                                        onPressed: () {
                                          _showDetailProduct(p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe)[index]["Ten"], p40_42viewModel.queryListNghe(_text_find_nghe.text, nghe, list_nghe)[index]["MoTa"]);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  _showAddNganhDialog(String select_nganh){
    showDialog(
        context: context,
        builder: (context) {
          _text_find_nganh.text = _hoatdong.text;
          String nganh = select_nganh;
          return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)),
                ),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.clear_fill,color: Colors.redAccent,),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const UIText(
                        text: "Danh mục Ngành",
                        textFontSize: fontLarge,
                        textColor: Colors.blue,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                        child: const UIText(
                          text:"Chọn mã cấp 1",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        //height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButton(
                          value: nganh,
                          items: list_maNganh.map((e) => DropdownMenuItem(
                            value: e["MaC1"].toString(),
                            child: UIText(
                              textColor: Colors.black,
                              text: '${e["MaC1"]}. ${e["TenC1"]}',
                              maxLines: 2,
                            ),
                          )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              nganh = value!;
                              maNganh_macdinh = value;
                              _text_find_nganh.text = "";
                              print("Ngành: $value");
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        //width: MediaQuery.of(context).size.width/1.2,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.20),
                        ),
                        child: TextField(
                          controller: _text_find_nganh,
                          style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: mPrimaryColor)),
                            hintText: "Nhập mã",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: fontMedium),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                        width: (MediaQuery.of(context).size.width/1.1),
                        height: (p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh).length <= 4) ? p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh).length*60 : 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                  setState(() {
                                    _mahoatdong.text = p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh)[index]["Ma"];
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.55,
                                      child: UIText(
                                        textColor: Colors.black,
                                        text: '${p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh)[index]["Ma"]} - ${p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh)[index]["Ten"]}',
                                      ),
                                    ),
                                    IconButton(
                                        alignment: Alignment.centerRight,
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.lightBlue,
                                          //size: fontGreater,
                                        ),
                                        onPressed: () {
                                          _showDetailProduct(p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh)[index]["Ten"], p40_42viewModel.queryListNganh(_text_find_nganh.text, nganh, list_nganh)[index]["MoTa"]);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  _showDetailProduct(String title, String detail){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: EdgeInsets.symmetric(horizontal: 15.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
            text: title,
            textColor: Colors.black,
            textFontSize: fontMedium,
            textAlign: TextAlign.center,
            isBold: true,
          ),
          content: Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black)
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: UIText(
                text: detail,
                textColor: mPrimaryColor,
                textFontSize: fontMedium,
                textAlign: TextAlign.center,
                isBold: true,
              ),
            ),
          ),
          iconColor: Colors.red,
          iconPadding: EdgeInsets.zero,
          icon: IconButton(
              alignment: Alignment.centerRight,
              icon: const Icon(
                CupertinoIcons.clear_fill,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              }
          ),
        )
    );
  }

  condition_1(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là Lao động có kỹ năng trong nông nghiệp, lâm nghiệp, thủy sản và săn bắt mà ko có trình độ CMKT hoặc không có tay nghề. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(((int.parse(_machucdanh.text) >= 5111 && int.parse(_machucdanh.text) <= 5113)
                || (int.parse(_machucdanh.text) >= 5131 && int.parse(_machucdanh.text) <= 5249)
                || (int.parse(_machucdanh.text) >= 5161 && int.parse(_machucdanh.text) <= 5162)
                || (int.parse(_machucdanh.text) >= 6111 && int.parse(_machucdanh.text) <= 6340)
                || (int.parse(_machucdanh.text) >= 7111 && int.parse(_machucdanh.text) <= 7132)
                || (int.parse(_machucdanh.text) >= 7211 && int.parse(_machucdanh.text) <= 7319)
                || (int.parse(_machucdanh.text) >= 7511))
                && (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)){
              condition_5();
            }
            else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_2(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là lực lượng vũ trang mà không có trình độ CMKT. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(int.parse(_machucdanh.text) >= 111 && int.parse(_machucdanh.text) <= 1710
                && thanhvien.c14A == 2 && thanhvien.c14B == 2 && thanhvien.c14C == 2
                && thanhvien.c14D == 2 && thanhvien.c14E == 2 && thanhvien.c14F == 2){
              condition_4();
            }
            else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_3(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là nhóm thợ mà không có tay nghề hoặc trình độ CMKT. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(((int.parse(_machucdanh.text) >= 5111 && int.parse(_machucdanh.text) <= 5113)
                || (int.parse(_machucdanh.text) >= 5131 && int.parse(_machucdanh.text) <= 5249)
                || (int.parse(_machucdanh.text) >= 5161 && int.parse(_machucdanh.text) <= 5162)
                || (int.parse(_machucdanh.text) >= 6111 && int.parse(_machucdanh.text) <= 6340)
                || (int.parse(_machucdanh.text) >= 7111 && int.parse(_machucdanh.text) <= 7132)
                || (int.parse(_machucdanh.text) >= 7211 && int.parse(_machucdanh.text) <= 7319)
                || (int.parse(_machucdanh.text) >= 7511))
                && (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)){
              condition_5();
            }
            else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_4(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nhà Lãnh đạo/quản lý mà không có trình độ chuyên môn kĩ thuật. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if((int.parse(_machucdanh.text) >= 1011 && int.parse(_machucdanh.text) <= 1527)
                && (thanhvien.c45 == 2 || thanhvien.c46 == 2)){
              condition_7();
            }
            else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_5(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Lao động bá hàng trong các cửa hàng, thợ đúc, thợ rèn...lao động trong nông nghiệp mà có ngành là quản lý NN. Có đúng không?',
          onpress: (){
            condition_13();
          },
        )
    );
  }
  condition_6(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Lãnh đạo các tổ chức, tập đoàn làm công hưởng lương đang trong độ tuổi lao động mà không có bảo hiểm xã hội bắt buộc. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if((int.parse(_machucdanh.text) >= 1011 && int.parse(_machucdanh.text) <= 1527)
                && (thanhvien.c45 == 2 || thanhvien.c46 == 2)){
              condition_7();
            }
            else if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_7(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Lãnh đạo trong các cấp các ngành mà không có bảo hiểm xã hội bắt buộc. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(((int.parse(_mahoatdong.text) >= 8511 && int.parse(_mahoatdong.text) <= 8560)
                || (int.parse(_mahoatdong.text) >= 8411 && int.parse(_mahoatdong.text) <= 8430)) &&  thanhvien.c41! >= 5){
              condition_8();
            }
            else if(int.parse(_mahoatdong.text) >= 9111 && int.parse(_mahoatdong.text) <= 9629
                && thanhvien.c42! >= 30000){
              condition_9();
            }
            else if(int.parse(_mahoatdong.text) >= 0110 && int.parse(_mahoatdong.text) <= 0320
                && thanhvien.c42! >= 50000){
              condition_10();
            }
            else if(int.parse(_mahoatdong.text) >= 1011 && int.parse(_mahoatdong.text) <= 1527
                && thanhvien.c42! >= 30000){
              condition_11();
            }
            else if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_8(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Ngành thuộc loại hoạt động đảng cộng sản, tổ chức chính trị - xã hội, quản lý nhà nước, an ninh quốc phòng, bảo đảm xã hội bắt buộc, hoặc thuộc ngành giáo dục đào tạo mà thu nhập từ công việc chính trên 20 triệu. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_9(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là nhóm lao động giản đơn mà thu nhập quá cao trên 30 triệu. Có đúng không?',
          onpress: (){
            Navigator.of(context).pop();
            if(int.parse(_mahoatdong.text) >= 3111 && thanhvien.c42! >= 30000 && thanhvien.c43 == 5){
              condition_12();
            }
            else {
              condition_13();
            }
          },
        )
    );
  }
  condition_10(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là lực lượng vũ trang mà thu nhập từ công việc chính trên 30 triệu. Có đúng không?',
          onpress: (){
            condition_13();
          },
        )
    );
  }
  condition_11(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Nghề là lãnh đạo các ngành các ấp mà thu nhập từ công việc chính trên 30 triệu. Có đúng không?',
          onpress: (){
            condition_13();
          },
        )
    );
  }
  condition_12(){
    showDialog(
        context: context,
        builder: (_) => UINotificationDialog(
          notification: 'Làm công hưởng lương và nghề là nhân viên/lao động giản đơn...mà thu nhập > 30 triệu. Có đúng không?',
          onpress: (){
            condition_13();
          },
        )
    );
  }
  condition_13(){
    p40_42viewModel.P40_42Next(thongTinThanhVienModel(
        idho: thanhvien.idho,
        idtv: thanhvien.idtv,
        c35B: _machucdanh.text,
        c37B: _mahoatdong.text,
        c50A: thanhvien.c50A
    ));
  }
}