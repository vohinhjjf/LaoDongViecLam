import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P55_59_viewmodel.dart';

class P55_59View extends StatefulWidget {
  const P55_59View({Key? key}) : super(key: key);

  @override
  State<P55_59View> createState() => _P55_59ViewState();
}

class _P55_59ViewState extends State<P55_59View> {
  late P55_59ViewModel p55_59viewModel;
  final _formKey = GlobalKey<FormState>();
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _congviec = TextEditingController();
  final _chucdanh = TextEditingController();
  final _tencoso = TextEditingController();
  final _hoatdong = TextEditingController();
  final _gio = TextEditingController();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p55_59viewModel = context.read();
      p55_59viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p55_59viewModel.thanhvien;
              _congviec.text = p55_59viewModel.thanhvien.c49.toString();
              _chucdanh.text = p55_59viewModel.thanhvien.c50A.toString();
              _tencoso.text = p55_59viewModel.thanhvien.c51.toString();
              _hoatdong.text = p55_59viewModel.thanhvien.c52A.toString();
              _gio.text = p55_59viewModel.thanhvien.c53.toString();
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontGreater,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p55
                  UIRichText(
                    text1: "P55. Hãy mô tả công việc thứ hai của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " ?\n(VÍ DỤ: ĐÁNH VỮA, KHUÂN GẠCH ĐỂ XÂY NHÀ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _congviec,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập mô tả';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  //p56
                  UIRichText(
                    text1: "P56. Hãy mô tả chức danh (nếu có) của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " trong công việc này?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _chucdanh,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập chức danh';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  //p57
                  UIRichText(
                    text1: "P57. Tên cơ sở nơi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm công việc trên là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _tencoso,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập tên cơ sở';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  //p58
                  UIRichText(
                    text1: "P58. Hoạt động chính hoặc sản phẩm/dịch vụ chính của cơ sở nơi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm việc là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _hoatdong,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập hoạt động';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  //p59
                  UIRichText(
                    text1: "P59. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm công việc này khoảng bao nhiêu giờ? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _gio,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 3,
                    keyboardType: TextInputType.datetime,
                  ),
                  //Button
                  const SizedBox(height: 90,),
                ],
              ),
            ),
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
              p55_59viewModel.P55_59Back();
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if (_congviec.text.length < 5) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có P55 - Mô tả công việc thứ hai quá ngắn!',)
                  );
                }
                else if (_chucdanh.text.length < 5) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có P56 - Chức danh nhập vào quá ngắn!',)
                  );
                }
                else if (_tencoso.text.length < 5) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có P57 - Tên cơ sở nhập vào quá ngắn!',)
                  );
                }
                else if (_hoatdong.text.length < 5) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có P58 - Sản phẩm/dịch vụ chính nhập vào quá ngắn!',)
                  );
                }
                else if (int.parse(_gio.text) > 84) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có P59 - Số giờ thực tế cho công việc thứ hai = ${_gio
                                .text} quá lớn!',)
                  );
                }
                else if (int.parse(_gio.text) >= 64) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có Số giờ thực tế cho công việc thứ hai = ${_gio
                                .text} có đúng không?',
                            onpress: () {
                              Navigator.of(context).pop();
                              p55_59viewModel.P55_59Next(
                                  thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c49: _congviec.text,
                                    c50A: _chucdanh.text,
                                    c51: _tencoso.text,
                                    c52A: _hoatdong.text,
                                    c53: int.parse(_gio.text),
                                  ));
                            },
                          )
                  );
                }
                else {
                  p55_59viewModel.P55_59Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c49: _congviec.text,
                    c50A: _chucdanh.text,
                    c51: _tencoso.text,
                    c52A: _hoatdong.text,
                    c53: int.parse(_gio.text),
                  ));
                }
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(onTap: (){
            setState(() {
              check_draw = false;
            });
          },)
              : const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}