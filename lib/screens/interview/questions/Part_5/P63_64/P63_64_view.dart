import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P63_64_viewmodel.dart';

class P63_64View extends StatefulWidget {
  const P63_64View({Key? key}) : super(key: key);

  @override
  State<P63_64View> createState() => _P63_64ViewState();
}

class _P63_64ViewState extends State<P63_64View> {
  late P63_64ViewModel p63_64ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _gio = TextEditingController();
  final _tiencong = TextEditingController();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p63_64ViewModel = context.read();
      p63_64ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p63_64ViewModel.thanhvien;
              _gio.text = p63_64ViewModel.thanhvien.c57.toString();
              _tiencong.text = p63_64ViewModel.thanhvien.c58.toString();
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
                  //p63
                  UIRichText(
                    text1: "P63. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm các công việc khác này khoảng bao nhiêu giờ? (ĐƠN VỊ TÍNH: GIỜ)",
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
                  //p64
                  const SizedBox(height: 20,),
                  UIRichText(
                    text1: "P64. Tháng trước, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " nhận được bao nhiêu "
                        "tiền công/tiền lương hoặc lợi nhuận từ các công việc này? "
                        "Tiền công/tiền lương bao gồm tiền làm thêm giờ, tiền thưởng, "
                        "tiền phụ cấp nghề và tiền phúc lợi khác? (ĐƠN VỊ TÍNH: NGHÌN ĐỒNG)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _tiencong,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số tiền';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 6,
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
              p63_64ViewModel.P63_64Back();
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if (int.parse(_gio.text) > 84) {
                  showDialog(
                      context: context,
                      builder: (_) => UIWarningDialog(
                        waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                            .c00} có P63 - Số giờ cho công việc khác = ${_gio
                            .text} quá lớn!',)
                  );
                }
                else if (int.parse(_tiencong.text) > 900000) {
                  showDialog(
                      context: context,
                      builder: (_) => UIWarningDialog(
                        waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                            .c00} có P64 - Thu nhập của công việc khác = ${_tiencong
                            .text} quá lớn!',)
                  );
                }
                else if (int.parse(_gio.text) >= 64) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có Số giờ cho công việc khác = ${_gio
                                .text} có đúng không?',
                            onpress: () {
                              Navigator.of(context).pop();
                              if (int.parse(_tiencong.text) >=
                                  400000) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        UINotificationDialog(
                                          notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                              .c00} có Thu nhập của công việc khác = ${_gio
                                              .text} có đúng không?',
                                          onpress: () {
                                            Navigator.of(context)
                                                .pop();
                                            p63_64ViewModel
                                                .P63_64Next(
                                                thongTinThanhVienModel(
                                                  idho: thanhvien
                                                      .idho,
                                                  idtv: thanhvien
                                                      .idtv,
                                                  c57: int.parse(
                                                      _gio.text),
                                                  c58: int.parse(
                                                      _tiencong
                                                          .text),
                                                ));
                                          },
                                        )
                                );
                              }
                              else {
                                p63_64ViewModel.P63_64Next(
                                    thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c57: int.parse(_gio.text),
                                      c58: int.parse(
                                          _tiencong.text),
                                    ));
                              }
                            },
                          )
                  );
                }
                else if (int.parse(_tiencong.text) >= 400000) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có Thu nhập của công việc khác = ${_gio
                                .text} có đúng không?',
                            onpress: () {
                              Navigator.of(context).pop();
                              p63_64ViewModel.P63_64Next(
                                  thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c57: int.parse(_gio.text),
                                    c58: int.parse(_tiencong.text),
                                  ));
                            },
                          )
                  );
                }
                else {
                  p63_64ViewModel.P63_64Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c57: int.parse(_gio.text),
                    c58: int.parse(_tiencong.text),
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