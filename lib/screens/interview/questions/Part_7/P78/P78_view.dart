import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P78_viewmodel.dart';

class P78View extends StatefulWidget {
  const P78View({Key? key}) : super(key: key);

  @override
  State<P78View> createState() => _P78ViewState();
}

class _P78ViewState extends State<P78View> {
  late P78ViewModel p78ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _orther = TextEditingController();
  int p78a = 0, p78b =0, p78c =0, p78d = 0, p78e =0, p78f =0, p78g = 0, p78h =0, p78i =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p78ViewModel = context.read();
      p78ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p78ViewModel.thanhvien;
              p78a = p78ViewModel.thanhvien.c62_M3A ?? 0;
              p78b = p78ViewModel.thanhvien.c62_M3B ?? 0;
              p78c = p78ViewModel.thanhvien.c62_M3C ?? 0;
              p78d = p78ViewModel.thanhvien.c62_M3D ?? 0;
              p78e = p78ViewModel.thanhvien.c62_M3E ?? 0;
              p78f = p78ViewModel.thanhvien.c62_M3F ?? 0;
              p78g = p78ViewModel.thanhvien.c62_M3G ?? 0;
              p78h = p78ViewModel.thanhvien.c62_M3H ?? 0;
              p78i = p78ViewModel.thanhvien.c62_M3I ?? 0;
              _orther.text = p78ViewModel.thanhvien.c62_M3IK ?? "";
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
                  //p78
                  UIRichText(
                    text1: "P78. Các nguyên nhân làm thu nhập hiện nay của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " giảm đi so với tháng trước là gì?",
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
                              text: "Có thành viên mất việc làm/tạm nghỉ việc",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78a == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78a = p78a == 1 ? 0 : 1;
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
                              isChecked: p78a == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78a = p78a == 2 ? 0 : 2;
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
                              text: "Chi phí đầu vào cho các hoạt động SXKD của hộ tăng",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78b == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78b = p78b == 1 ? 0 : 1;
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
                              isChecked: p78b == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78b = p78b == 2 ? 0 : 2;
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
                              text: "Giá bán các sản phẩm từ các hoạt động SXKD của hộ giảm",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78c == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78c = p78c == 1 ? 0 : 1;
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
                              isChecked: p78c == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78c = p78c == 2 ? 0 : 2;
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
                              text: "Quy mô các hoạt động SXKD của hộ giảm",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78d == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78d = p78d == 1 ? 0 : 1;
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
                              isChecked: p78d == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78d = p78d == 2 ? 0 : 2;
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
                              text: "Do ảnh hưởng của thiên tai",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78e == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78e = p78e == 1 ? 0 : 1;
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
                              isChecked: p78e == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78e = p78e == 2 ? 0 : 2;
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
                              text: "Do ảnh hưởng của dịch bệnh đối với con người",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78f == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78f = p78f == 1 ? 0 : 1;
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
                              isChecked: p78f == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78f = p78f == 2 ? 0 : 2;
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
                        const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78g == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78g = p78g == 1 ? 0 : 1;
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
                              isChecked: p78g == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78g = p78g == 2 ? 0 : 2;
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
                              text: "Do ảnh hưởng của hỏa hoạn, cháy nổ",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78h == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78h = p78h == 1 ? 0 : 1;
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
                              isChecked: p78h == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78h = p78h == 2 ? 0 : 2;
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
                        const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Nguyên nhân khác (Ghi rõ)",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p78i == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78i = p78i == 1 ? 0 : 1;
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
                              isChecked: p78i == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p78i = p78i == 2 ? 0 : 2;
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
                    visible: p78i == 1 ? true : false,
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
                            if(p78i == 1 && value!.isEmpty){
                              return 'Vui lòng nhập nguyên nhân khác';
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
                          p78ViewModel.P78Back();
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
                            if (p78a == 0 || p78b == 0 || p78c == 0 ||
                                p78d == 0 || p78e == 0 || p78f == 0 ||
                                p78g == 0 || p78h == 0 || p78i == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UIWarningDialog(
                                        waring: 'Thành viên ${thanhvien
                                            .c00} có P78 - Các nguyên nhân làm thu nhập giảm đi nhập vào chưa đúng!',)
                              );
                            } else {
                              p78ViewModel.P78Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c62_M3A: p78a,
                                c62_M3B: p78b,
                                c62_M3C: p78c,
                                c62_M3D: p78d,
                                c62_M3E: p78e,
                                c62_M3F: p78f,
                                c62_M3G: p78g,
                                c62_M3H: p78h,
                                c62_M3I: p78i,
                                c62_M3IK: _orther.text,
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