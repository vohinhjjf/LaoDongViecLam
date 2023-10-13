import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P84_viewmodel.dart';

class P84View extends StatefulWidget {
  const P84View({Key? key}) : super(key: key);

  @override
  State<P84View> createState() => _P84ViewState();
}

class _P84ViewState extends State<P84View> {
  late P84ViewModel p84ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _orther = TextEditingController();
  int p84a = 0, p84b =0, p84c =0, p84d = 0, p84e =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p84ViewModel = context.read();
      p84ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p84ViewModel.thanhvien;
              p84a = p84ViewModel.thanhvien.c62_M9A ?? 0;
              p84b = p84ViewModel.thanhvien.c62_M9B ?? 0;
              p84c = p84ViewModel.thanhvien.c62_M9C ?? 0;
              p84d = p84ViewModel.thanhvien.c62_M9D ?? 0;
              p84e = p84ViewModel.thanhvien.c62_M9E ?? 0;
              _orther.text = p84ViewModel.thanhvien.c62_M9EK ?? "";
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
                  //p08
                  UIRichText(
                    text1: "P84. Tính từ đầu năm đến thời điểm hiện nay, hộ "
                        "${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã nhận được những nguồn trợ giúp nào?",
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
                              text: "Các chương trình, chính sách chung của Quốc gia",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p84a == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84a = p84a == 1 ? 0 : 1;
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
                              isChecked: p84a == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84a = p84a == 2 ? 0 : 2;
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
                              text: "Các chương trình, chính sách của địa phương",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p84b == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84b = p84b == 1 ? 0 : 1;
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
                              isChecked: p84b == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84b = p84b == 2 ? 0 : 2;
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
                              text: "Các hoạt động từ thiện của các tổ chức và cá nhân khác",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p84c == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84c = p84c == 1 ? 0 : 1;
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
                              isChecked: p84c == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84c = p84c == 2 ? 0 : 2;
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
                              text: "Họ hàng, người thân",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p84d == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84d = p84d == 1 ? 0 : 1;
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
                              isChecked: p84d == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84d = p84d == 2 ? 0 : 2;
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
                        const UIText(
                          text: "Khác (Ghi rõ)",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p84e == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84e = p84e == 1 ? 0 : 1;
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
                              isChecked: p84e == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p84e = p84e == 2 ? 0 : 2;
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
                  //
                  Visibility(
                    visible: p84e == 1 ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Nguồn trợ giúp khác",
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
                            if(p84e == 1 && value!.isEmpty){
                              return 'Vui lòng nhập nguồn khác';
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
                          p84ViewModel.P84Back();
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
                            if (p84a == 0 || p84b == 0 || p84c == 0 ||
                                p84d == 0 || p84e == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UIWarningDialog(
                                        waring: 'Thành viên ${thanhvien
                                            .c00} có P84 - Những nguồn trợ giúp nhập vào chưa đúng!',)
                              );
                            } else {
                              p84ViewModel.P84Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c62_M9A: p84a,
                                c62_M9B: p84b,
                                c62_M9C: p84c,
                                c62_M9D: p84d,
                                c62_M9E: p84e,
                                c62_M9EK: p84e == 1 ? _orther.text : "",
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