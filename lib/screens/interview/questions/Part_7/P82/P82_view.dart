import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P82_viewmodel.dart';

class P82View extends StatefulWidget {
  const P82View({Key? key}) : super(key: key);

  @override
  State<P82View> createState() => _P82ViewState();
}

class _P82ViewState extends State<P82View> {
  late P82ViewModel p82ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();
  final _orther = TextEditingController();
  int p82a = 0, p82b =0, p82c =0, p82d = 0, p82e =0, p82f =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p82ViewModel = context.read();
      p82ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p82ViewModel.thanhvien;
              doisongho = p82ViewModel.doisongho;
              p82a = p82ViewModel.doisongho.c62_M7A ?? 0;
              p82b = p82ViewModel.doisongho.c62_M7B ?? 0;
              p82c = p82ViewModel.doisongho.c62_M7C ?? 0;
              p82d = p82ViewModel.doisongho.c62_M7D ?? 0;
              p82e = p82ViewModel.doisongho.c62_M7E ?? 0;
              p82f = p82ViewModel.doisongho.c62_M7F ?? 0;
              _orther.text = p82ViewModel.doisongho.c62_M7FK ?? "";
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
                  //p82
                  UIRichText(
                    text1: "P82. Các nguyên nhân làm chi tiêu cho các mặt hàng lương "
                        "thực, thực phẩm của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " giảm đi so với tháng trước là gì?",
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
                  //a
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: UIText(
                              text: "Thu nhập giảm",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
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
                              groupValue: p82a,
                              onChanged: (value) {
                                setState(() {
                                  p82a = value;
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
                              groupValue: p82a,
                              onChanged: (value) {
                                setState(() {
                                  p82a = value;
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
                              text: "Do ảnh hưởng của thiên tai",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
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
                              groupValue: p82b,
                              onChanged: (value) {
                                setState(() {
                                  p82b = value;
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
                              groupValue: p82b,
                              onChanged: (value) {
                                setState(() {
                                  p82b = value;
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
                              text: "Do ảnh hưởng của giá hàng hóa tăng lên",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
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
                              groupValue: p82c,
                              onChanged: (value) {
                                setState(() {
                                  p82c = value;
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
                              groupValue: p82c,
                              onChanged: (value) {
                                setState(() {
                                  p82c = value;
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
                              text: "Do ảnh hưởng của dịch bệnh đối với con người",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
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
                              groupValue: p82d,
                              onChanged: (value) {
                                setState(() {
                                  p82d = value;
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
                              groupValue: p82d,
                              onChanged: (value) {
                                setState(() {
                                  p82d = value;
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
                              text: "Do ảnh hưởng của dịch bệnh đối với vật nuôi, cây trồng",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
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
                              groupValue: p82e,
                              onChanged: (value) {
                                setState(() {
                                  p82e = value;
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
                              groupValue: p82e,
                              onChanged: (value) {
                                setState(() {
                                  p82e = value;
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
                            text: "Nguyên nhân khác (Ghi rõ)",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p82f,
                              onChanged: (value) {
                                setState(() {
                                  p82f = value;
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
                              groupValue: p82f,
                              onChanged: (value) {
                                setState(() {
                                  p82f = value;
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
                    visible: p82f == 1 ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Nguyên nhân khác",
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
                            if(p82f == 1 && value!.isEmpty){
                              return 'Vui lòng nhập nguyên nhân khác';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                            FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                          ],
                          keyboardType: TextInputType.text,
                          style: const TextStyle( color: Colors.black),
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Button
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p82ViewModel.P82Back();
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if (p82a == 0 || p82b == 0 || p82c == 0 ||
                              p82d == 0 || p82e == 0 || p82f == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P82 - Các nguyên nhân làm chi tiêu giảm đi nhập vào chưa đúng!',)
                            );
                          } else {
                            p82ViewModel.P82Next(DoiSongHoModel(
                              idho: doisongho.idho,
                              c62_M7A: p82a,
                              c62_M7B: p82b,
                              c62_M7C: p82c,
                              c62_M7D: p82d,
                              c62_M7E: p82e,
                              c62_M7F: p82f,
                              c62_M7FK: p82f == 1 ? _orther.text : "",
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
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}