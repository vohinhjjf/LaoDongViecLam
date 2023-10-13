import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P80_viewmodel.dart';

class P80View extends StatefulWidget {
  const P80View({Key? key}) : super(key: key);

  @override
  State<P80View> createState() => _P80ViewState();
}

class _P80ViewState extends State<P80View> {
  late P80ViewModel p80ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _orther = TextEditingController();
  int p80a = 0, p80b =0, p80c =0, p80d = 0, p80e =0, p80f =0, p80g = 0, p80h =0, p80i =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p80ViewModel = context.read();
      p80ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p80ViewModel.thanhvien;
              p80a = p80ViewModel.thanhvien.c62_M5A ?? 0;
              p80b = p80ViewModel.thanhvien.c62_M5B ?? 0;
              p80c = p80ViewModel.thanhvien.c62_M5C ?? 0;
              p80d = p80ViewModel.thanhvien.c62_M5D ?? 0;
              p80e = p80ViewModel.thanhvien.c62_M5E ?? 0;
              p80f = p80ViewModel.thanhvien.c62_M5F ?? 0;
              p80g = p80ViewModel.thanhvien.c62_M5G ?? 0;
              p80h = p80ViewModel.thanhvien.c62_M5H ?? 0;
              p80i = p80ViewModel.thanhvien.c62_M5I ?? 0;
              _orther.text = p80ViewModel.thanhvien.c62_M5IK ?? "";
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
                  //p80
                  UIRichText(
                    text1: "P80. Các nguyên nhân làm thu nhập hiện nay của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " giảm đi so với tháng ${thanhvien.thangDT} của năm trước là gì?",
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
                              isChecked: p80a == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80a = p80a == 1 ? 0 : 1;
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
                              isChecked: p80a == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80a = p80a == 2 ? 0 : 2;
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
                              isChecked: p80b == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80b = p80b == 1 ? 0 : 1;
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
                              isChecked: p80b == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80b = p80b == 2 ? 0 : 2;
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
                              isChecked: p80c == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80c = p80c == 1 ? 0 : 1;
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
                              isChecked: p80c == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80c = p80c == 2 ? 0 : 2;
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
                              isChecked: p80d == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80d = p80d == 1 ? 0 : 1;
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
                              isChecked: p80d == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80d = p80d == 2 ? 0 : 2;
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
                              isChecked: p80e == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80e = p80e == 1 ? 0 : 1;
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
                              isChecked: p80e == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80e = p80e == 2 ? 0 : 2;
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
                              isChecked: p80f == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80f = p80f == 1 ? 0 : 1;
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
                              isChecked: p80f == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80f = p80f == 2 ? 0 : 2;
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
                          child: const UIText(
                            text: "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              isChecked: p80g == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80g = p80g == 1 ? 0 : 1;
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
                              isChecked: p80g == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80g = p80g == 2 ? 0 : 2;
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
                              isChecked: p80h == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80h = p80h == 1 ? 0 : 1;
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
                              isChecked: p80h == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80h = p80h == 2 ? 0 : 2;
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
                              isChecked: p80i == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80i = p80i == 1 ? 0 : 1;
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
                              isChecked: p80i == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p80i = p80i == 2 ? 0 : 2;
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
                    visible: p80i == 1 ? true : false,
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
                            if(p80i == 1 && value!.isEmpty){
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
                          p80ViewModel.P80Back();
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
                            if (p80a == 0 || p80b == 0 || p80c == 0 ||
                                p80d == 0 || p80e == 0 || p80f == 0 ||
                                p80g == 0 || p80h == 0 || p80i == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UIWarningDialog(
                                        waring: 'Thành viên ${thanhvien
                                            .c00} có P80 - Các nguyên nhân làm thu nhập giảm đi nhập vào chưa đúng!',)
                              );
                            } else {
                              p80ViewModel.P80Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c62_M5A: p80a,
                                c62_M5B: p80b,
                                c62_M5C: p80c,
                                c62_M5D: p80d,
                                c62_M5E: p80e,
                                c62_M5F: p80f,
                                c62_M5G: p80g,
                                c62_M5H: p80h,
                                c62_M5I: p80i,
                                c62_M5IK: p80i == 1 ? _orther.text : "",
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