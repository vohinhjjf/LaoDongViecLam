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
import 'P83_viewmodel.dart';

class P83View extends StatefulWidget {
  const P83View({Key? key}) : super(key: key);

  @override
  State<P83View> createState() => _P83ViewState();
}

class _P83ViewState extends State<P83View> {
  late P83ViewModel p83ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();
  final _orther = TextEditingController();
  int p83a = 0, p83b =0, p83c =0, p83d = 0, p83e =0, p83f =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p83ViewModel = context.read();
      p83ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p83ViewModel.thanhvien;
              doisongho = p83ViewModel.doisongho;
              p83a = p83ViewModel.doisongho.c62_M8A ?? 0;
              p83b = p83ViewModel.doisongho.c62_M8B ?? 0;
              p83c = p83ViewModel.doisongho.c62_M8C ?? 0;
              p83d = p83ViewModel.doisongho.c62_M8D ?? 0;
              p83e = p83ViewModel.doisongho.c62_M8E ?? 0;
              p83f = p83ViewModel.doisongho.c62_M8F ?? 0;
              _orther.text = p83ViewModel.doisongho.c62_M8FK ?? "";
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
                  //p83
                  UIRichText(
                    text1: "P83. Tính từ đầu năm đến thời điểm hiện nay, hộ "
                        "${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " chịu ảnh hưởng tiêu cực của sự kiện nào dưới đây?",
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
                              text: "Thiên tai",
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
                              groupValue: p83a,
                              onChanged: (value) {
                                setState(() {
                                  p83a = value;
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
                              groupValue: p83a,
                              onChanged: (value) {
                                setState(() {
                                  p83a = value;
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
                              text: "Giá hàng hóa, dịch vụ tăng cao",
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
                              groupValue: p83b,
                              onChanged: (value) {
                                setState(() {
                                  p83b = value;
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
                              groupValue: p83b,
                              onChanged: (value) {
                                setState(() {
                                  p83b = value;
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
                              text: "Dịch bệnh đối với con người",
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
                              groupValue: p83c,
                              onChanged: (value) {
                                setState(() {
                                  p83c = value;
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
                              groupValue: p83c,
                              onChanged: (value) {
                                setState(() {
                                  p83c = value;
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
                              text: "Dịch bệnh đối với vật nuôi, cây trồng",
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
                              groupValue: p83d,
                              onChanged: (value) {
                                setState(() {
                                  p83d = value;
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
                              groupValue: p83d,
                              onChanged: (value) {
                                setState(() {
                                  p83d = value;
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
                              text: "Hỏa hoạn, cháy nổ",
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
                              groupValue: p83e,
                              onChanged: (value) {
                                setState(() {
                                  p83e = value;
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
                              groupValue: p83e,
                              onChanged: (value) {
                                setState(() {
                                  p83e = value;
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
                        const UIText(
                          text: "Khác (Ghi rõ)",
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
                              groupValue: p83f,
                              onChanged: (value) {
                                setState(() {
                                  p83f = value;
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
                              groupValue: p83f,
                              onChanged: (value) {
                                setState(() {
                                  p83f = value;
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
                    visible: p83f == 1 ? true : false,
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
                            if(p83f == 1 && value!.isEmpty){
                              return 'Vui lòng nhập nguyên nhân khác';
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
                      ],
                    ),
                  ),
                  //Button
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p83ViewModel.P83Back(doisongho);
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if (p83a == 0 || p83b == 0 || p83c == 0 ||
                              p83d == 0 || p83e == 0 || p83f == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có P83 - Các sự kiện tiêu cực nhập vào chưa đúng!',)
                            );
                          } else {
                            if(p83f == 1) {
                              p83ViewModel.P83Next(DoiSongHoModel(
                                idho: thanhvien.idho,
                                thangDT: thanhvien.thangDT,
                                namDT: thanhvien.namDT,
                                c62_M8A: p83a,
                                c62_M8B: p83b,
                                c62_M8C: p83c,
                                c62_M8D: p83d,
                                c62_M8E: p83e,
                                c62_M8F: p83f,
                                c62_M8FK: _orther.text,
                              ));
                            } else {
                              p83ViewModel.P83Next(DoiSongHoModel(
                                idho: thanhvien.idho,
                                thangDT: thanhvien.thangDT,
                                namDT: thanhvien.namDT,
                                c62_M8A: p83a,
                                c62_M8B: p83b,
                                c62_M8C: p83c,
                                c62_M8D: p83d,
                                c62_M8E: p83e,
                                c62_M8F: p83f,
                              ));
                            }
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