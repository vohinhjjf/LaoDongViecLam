import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p33
                  UIRichText(
                    text1: "P33. ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã tìm việc hoặc bắt đầu hoạt động sản xuất"
                        " kinh doanh bằng cách nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: "1. CÓ\n2. KHÔNG",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 40,
                        child: UIText(
                          text: "1",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 40,
                        child: UIText(
                          text: "2",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  //a
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Nộp đơn xin việc",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33a == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33a = p33a == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33a == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33a = p33a == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //b
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Liên hệ/Tư vấn cơ sở dịch vụ việc làm",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33b == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33b = p33b == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33b == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33b = p33b == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //c
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Qua bạn bè/người thân",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33c == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33c = p33c == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33c == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33c = p33c == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //d
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Đặt quảng cáo tìm việc",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33d == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33d = p33d == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33d == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33d = p33d == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //e
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Qua thông báo tuyển dụng (trên mạng/báo in)",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33e == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33e = p33e == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33e == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33e = p33e == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //f
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Đã tham gia phỏng vấn",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33f == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33f = p33f == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33f == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33f = p33f == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //g
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UIText(
                          text: "Tìm việc tự do",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33g == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33g = p33g == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33g == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33g = p33g == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //h
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Chuẩn bị để bắt đầu hoạt động sản xuất kinh doanh",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p33h == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33h = p33h == 1 ? 0 : 1;
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
                            const SizedBox(width: 10,),
                            RoundCheckBox(
                              isChecked: p33h == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p33h = p33h == 2 ? 0 : 2;
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
                          ],
                        )
                      ],
                    ),
                  ),
                  //i
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UIText(
                          text: "Khác(Ghi cụ thể)",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
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
                              onChanged: (value){
                                setState(() {
                                  p33i = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                            const SizedBox(width: 10,),
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p33i,
                              onChanged: (value){
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
                        TextFormField(
                          autofocus: true,
                          controller: _orther,
                          validator: (value){
                            if(p33i == 1 && value!.isEmpty){
                              return 'Vui lòng nhập cách khác';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                    child: Container(
                      padding: const EdgeInsets.only(right: 4),
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.black54, width: 2))),
                      child: IconButton(
                        onPressed: () {
                          p33ViewModel.P33Back();
                        },
                        icon: const Icon(
                          Icons.navigate_before,
                          color: Colors.black54,
                          size: 35,
                        ),
                      ),
                    )), //back
                ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.black54, width: 2))),
                      child: IconButton(
                        onPressed: () {
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
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.black54,
                          size: 35,
                        ),
                      ),
                    )), //next
              ],
            ),
          )
        ],
      ),
    );
  }
}