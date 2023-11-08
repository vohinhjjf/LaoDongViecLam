import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P39_42_viewmodel.dart';

class P39_42View extends StatefulWidget {
  const P39_42View({Key? key}) : super(key: key);

  @override
  State<P39_42View> createState() => _P39_42ViewState();
}

class _P39_42ViewState extends State<P39_42View> {
  late P39_42ViewModel p39_42viewModel;
  final _formKey = GlobalKey<FormState>();
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _congviec = TextEditingController();
  final _chucdanh = TextEditingController();
  final _tencoso = TextEditingController();
  final _hoatdong = TextEditingController();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        p39_42viewModel = context.read();
        p39_42viewModel.onInit(context);
        Future.delayed(
            const Duration(milliseconds: 100),
                () => {
              setState(() {
                thanhvien = p39_42viewModel.thanhvien;
                _congviec.text = p39_42viewModel.thanhvien.c34 ?? "";
                _chucdanh.text = p39_42viewModel.thanhvien.c35A ?? "";
                _tencoso.text = p39_42viewModel.thanhvien.c36 ?? "";
                _hoatdong.text = p39_42viewModel.thanhvien.c37A ?? "";
              })
            });
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
                  //p39
                  UIRichText(
                    text1: "P39. Hãy mô tả công việc chính của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: "?\n(VÍ DỤ: ĐÁNH VỮA, KHUÂN GẠCH ĐỂ XÂY NHÀ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _congviec,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập mô tả';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //p40
                  UIRichText(
                    text1: "P40. Hãy mô tả chức danh (nếu có) của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " trong công việc này?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _chucdanh,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập mô tả';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //p41
                  UIRichText(
                    text1: "P41. Tên cơ sở nơi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm công việc trên là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _tencoso,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập mô tả';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //p42
                  UIRichText(
                    text1: "P42.  Hoạt động chính hoặc sản phẩm/dịch vụ chính của cơ sở nơi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm việc là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _hoatdong,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập mô tả';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  //Button
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p39_42viewModel.P39_42Back(thanhvien);
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if (_congviec.text.length < 5) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P39 - Mô tả công việc chính quá ngắn!',)
                            );
                          }
                          else if (_chucdanh.text.length < 5) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P40 - Chức danh nhập vào quá ngắn!',)
                            );
                          }
                          else if (_tencoso.text.length < 5) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P41 - Tên cơ sở nhập vào quá ngắn!',)
                            );
                          }
                          else if (_hoatdong.text.length < 5) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P42 - Sản phẩm/dịch vụ chính nhập vào quá ngắn!',)
                            );
                          }
                          else {
                            p39_42viewModel.P39_42Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c34: _congviec.text,
                              c35A: _chucdanh.text,
                              c36: _tencoso.text,
                              c37A: _hoatdong.text,
                            ));
                          }
                        }
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
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