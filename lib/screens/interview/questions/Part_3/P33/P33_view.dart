import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P33_viewmodel.dart';

class P33View extends StatefulWidget {
  const P33View({Key? key}) : super(key: key);

  @override
  State<P33View> createState() => _P33ViewState();
}

class _P33ViewState extends State<P33View> {
  late P33ViewModel p33ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _orther = TextEditingController();
  int p33a = 0, p33b =0, p33c =0, p33d = 0, p33e =0, p33f =0, p33g = 0, p33h =0, p33i =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p33ViewModel = context.read();
      p33ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p33ViewModel.thanhvien;
              p33a = p33ViewModel.thanhvien.c30_A ?? 0;
              p33b = p33ViewModel.thanhvien.c30_B ?? 0;
              p33c = p33ViewModel.thanhvien.c30_C ?? 0;
              p33d = p33ViewModel.thanhvien.c30_D ?? 0;
              p33e = p33ViewModel.thanhvien.c30_E ?? 0;
              p33f = p33ViewModel.thanhvien.c30_F ?? 0;
              p33g = p33ViewModel.thanhvien.c30_G ?? 0;
              p33h = p33ViewModel.thanhvien.c30_H ?? 0;
              p33i = p33ViewModel.thanhvien.c30_I ?? 0;
              _orther.text = p33ViewModel.thanhvien.c30_IK.toString();
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
                  //p33
                  UIRichText(
                    text1: "P33. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã tìm việc hoặc bắt đầu hoạt động sản xuất"
                        " kinh doanh bằng cách nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 45,
                        child: UIText(
                          text: "Có",
                          textColor: Colors.black,
                          textFontSize: fontSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 45,
                        child: UIText(
                          text: "Không",
                          textColor: Colors.black,
                          textFontSize: fontSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  //a
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Nộp đơn xin việc",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33a,
                              onChanged: (value) {
                                setState(() {
                                  p33a = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33a,
                              onChanged: (value) {
                                setState(() {
                                  p33a = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //b
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Liên hệ/Tư vấn cơ sở dịch vụ việc làm",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33b,
                              onChanged: (value) {
                                setState(() {
                                  p33b = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33b,
                              onChanged: (value) {
                                setState(() {
                                  p33b = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //c
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Qua bạn bè/người thân",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33c,
                              onChanged: (value) {
                                setState(() {
                                  p33c = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33c,
                              onChanged: (value) {
                                setState(() {
                                  p33c = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //d
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Đặt quảng cáo tìm việc",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33d,
                              onChanged: (value) {
                                setState(() {
                                  p33d = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33d,
                              onChanged: (value) {
                                setState(() {
                                  p33d = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //e
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Qua thông báo tuyển dụng (trên mạng/báo in)",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33e,
                              onChanged: (value) {
                                setState(() {
                                  p33e = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33e,
                              onChanged: (value) {
                                setState(() {
                                  p33e = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //f
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Đã tham gia phỏng vấn",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33f,
                              onChanged: (value) {
                                setState(() {
                                  p33f = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33f,
                              onChanged: (value) {
                                setState(() {
                                  p33f = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //g
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UIText(
                          text: "Tìm việc tự do",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33g,
                              onChanged: (value) {
                                setState(() {
                                  p33g = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33g,
                              onChanged: (value) {
                                setState(() {
                                  p33g = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //h
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Chuẩn bị để bắt đầu hoạt động sản xuất kinh doanh",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33h,
                              onChanged: (value) {
                                setState(() {
                                  p33h = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33h,
                              onChanged: (value) {
                                setState(() {
                                  p33h = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //i
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UIText(
                          text: "Khác(Ghi cụ thể)",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p33i,
                              onChanged: (value) {
                                setState(() {
                                  p33i = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 12,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33i,
                              onChanged: (value) {
                                setState(() {
                                  p33i = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //
                  Visibility(
                    visible: p33i == 1 ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Cách khác",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        UITextFormField(
                          controller: _orther,
                          validator: (value){
                            if(p33i == 1 && value!.isEmpty){
                              return 'Vui lòng nhập cách khác';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                            FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  //Button
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p33ViewModel.P33Back();
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if (p33a == 0 || p33b == 0 || p33c == 0 ||
                              p33d == 0 ||
                              p33e == 0 || p33f == 0 || p33g == 0 || p33h ==
                              0 || p33i == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P33 - Cách tìm việc nhập vào chưa đúng!',)
                            );
                          } else {
                            p33ViewModel.P33Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c30_A: p33a,
                              c30_B: p33b,
                              c30_C: p33c,
                              c30_D: p33d,
                              c30_E: p33e,
                              c30_F: p33f,
                              c30_G: p33g,
                              c30_H: p33h,
                              c30_I: p33i,
                              c30_IK: _orther.text,
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