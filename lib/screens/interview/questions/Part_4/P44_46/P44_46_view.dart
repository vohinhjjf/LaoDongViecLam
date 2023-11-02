import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P44_46_viewmodel.dart';

class P44_46View extends StatefulWidget {
  const P44_46View({Key? key}) : super(key: key);

  @override
  State<P44_46View> createState() => _P44_46ViewState();
}

class _P44_46ViewState extends State<P44_46View> {
  late P44_46ViewModel p44_46ViewModel;
  final _formKey = GlobalKey<FormState>();
  final _gio = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p44 =0, p46 =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p44_46ViewModel = context.read();
      p44_46ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p44_46ViewModel.thanhvien;
              p44 = p44_46ViewModel.thanhvien.c39 ?? 0;
              p46 = p44_46ViewModel.thanhvien.c40A ?? 0;
              _gio.text = p44_46ViewModel.thanhvien.c40 == null ? "":p44_46ViewModel.thanhvien.c40.toString();
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
                  //p44
                  Visibility(
                      visible: (thanhvien.c38 ?? 0) < 4 || (thanhvien.c38 ?? 0) > 12,
                      child: Column(
                        children: [
                          UIRichText(
                            text1: "P44. Cơ sở nơi ",
                            text2: thanhvien.c00 ?? "",
                            text3: " làm việc có đăng ký kinh doanh không?",
                            textColor: Colors.black,
                            textFontSize:fontLarge,
                          ),
                          const SizedBox(height: 10,),
                          ListTile(
                            title: const UIText(
                              text: "CÓ",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: RoundCheckBox(
                              isChecked: p44 == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p44 = p44 == 1 ? 0 : 1;
                                });
                              },
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                              checkedColor: Colors.white,
                              checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              uncheckedColor: Colors.white,
                              uncheckedWidget: Container(),
                            ),
                            onTap: () {
                              setState(() {
                                p44 = p44 == 1 ? 0 : 1;
                              });
                            },
                          ),
                          ListTile(
                            title: const UIText(
                              text: "KHÔNG",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: RoundCheckBox(
                              isChecked: p44 == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p44 = p44 == 2 ? 0 : 2;
                                });
                              },
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                              checkedColor: Colors.white,
                              checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              uncheckedColor: Colors.white,
                              uncheckedWidget: Container(),
                            ),
                            onTap: () {
                              setState(() {
                                p44 = p44 == 2 ? 0 : 2;
                              });
                            },
                          ),
                        ],
                      )
                  ),
                  //p45
                  const SizedBox(height: 10,),
                  UIRichText(
                    text1: "P45. Thực tế, trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm công việc này khoảng bao nhiêu giờ? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _gio,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  //p46
                  const SizedBox(height: 10,),
                  UIRichText(
                    text1: "P46. Có phải ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đang tạm nghỉ công việc này trong 7 ngày qua không?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    title: const UIText(
                      text: "CÓ",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p46 == 1 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p46 = p46 == 1 ? 0 : 1;
                        });
                      },
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      checkedColor: Colors.white,
                      checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      uncheckedColor: Colors.white,
                      uncheckedWidget: Container(),
                    ),
                    onTap: () {
                      setState(() {
                        p46 = p46 == 1 ? 0 : 1;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: "KHÔNG",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p46 == 2 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p46 = p46 == 2 ? 0 : 2;
                        });
                      },
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      checkedColor: Colors.white,
                      checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      uncheckedColor: Colors.white,
                      uncheckedWidget: Container(),
                    ),
                    onTap: () {
                      setState(() {
                        p46 = p46 == 2 ? 0 : 2;
                      });
                    },
                  ),
                  //Button
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p44_46ViewModel.P44_46Back();
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if ((thanhvien.c38! < 4 || thanhvien.c38! > 12) &&
                              p44 == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'P44 - Cơ sở ĐKKD nhập vào chưa đúng!',)
                            );
                          }
                          else if (p46 == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'P46 - Tạm nghỉ công việc trong 7 ngày nhập vào chưa đúng!',)
                            );
                          }
                          else if (thanhvien.c38! >= 4 && p44 == 2) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Thành viên ${thanhvien
                                      .c00} có cơ sở thuộc loại hình tổ chức đoàn thể khác mà không có ĐKKD!',)
                            );
                          }
                          else if (thanhvien.c38 == 3 && p44 == 1) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Thành viên ${thanhvien
                                      .c00} là cá nhân làm tự do (P43 = 3) mà cơ sở có đăng ký kinh doanh (P44 = 1). Kiểm tra lại!',)
                            );
                          }
                          else if (int.parse(_gio.text) == 0 && p46 == 2) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: '${thanhvien
                                      .c00} có 0 giờ làm việc trong 7 ngày qua mà P46 = 2!',)
                            );
                          }
                          else if (int.parse(_gio.text) != 0 && p46 == 1) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: '${thanhvien.c00} có ${_gio
                                      .text} giờ làm việc trong 7 ngày qua mà P46 = 1!',)
                            );
                          }
                          else if (int.parse(_gio.text) >= 65) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UINotificationDialog(
                                      notification: 'Thành viên ${thanhvien
                                          .c00} có P45 - Số giờ thực tế làm việc/tuần = ${_gio
                                          .text} quá cao, trên 8 giờ/ngày. Có đúng không?',
                                      onpress: () {
                                        p44_46ViewModel.P44_46Next(
                                            thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c39: p44,
                                              c40: int.parse(_gio.text),
                                              c40A: p46,
                                            ));
                                      },
                                    )
                            );
                          }
                          else {
                            p44_46ViewModel.P44_46Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c39: p44,
                              c40: int.parse(_gio.text),
                              c40A: p46,
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