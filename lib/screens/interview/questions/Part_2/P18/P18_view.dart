import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P18_viewmodel.dart';

class P18View extends StatefulWidget {
  const P18View({Key? key}) : super(key: key);

  @override
  State<P18View> createState() => _P18ViewState();
}

class _P18ViewState extends State<P18View> {
  late P18ViewModel p18ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p18a = 0, p18b =0, p18c =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p18ViewModel = context.read();
      p18ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p18ViewModel.thanhvien;
              p18a = p18ViewModel.thanhvien.c16A ?? 0;
              p18b = p18ViewModel.thanhvien.c16B ?? 0;
              p18c = p18ViewModel.thanhvien.c16C ?? 0;
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
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p18
                UIRichText(
                  text1: "P18. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có được công nhận hoặc được cấp các loại "
                      "bằng cấp/chứng chỉ nghề/kỹ năng nghề sau đây không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                // const UIText(
                //   text: "1. CÓ\n2. KHÔNG",
                //   textColor: Colors.black,
                //   textFontSize:fontLarge,
                // ),
                // const SizedBox(height: 5,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: const [
                //     SizedBox(
                //       width: 40,
                //       child: UIText(
                //         text: "1",
                //         textColor: Colors.black,
                //         textFontSize: fontLarge,
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //     SizedBox(width: 10,),
                //     SizedBox(
                //       width: 40,
                //       child: UIText(
                //         text: "2",
                //         textColor: Colors.black,
                //         textFontSize: fontLarge,
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "CNKT không có bằng/chứng chỉ",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          RoundCheckBox(
                            isChecked: p18a == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18a = p18a == 1 ? 0 : 1;
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
                            isChecked: p18a == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18a = p18a == 2 ? 0 : 2;
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
                // const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Kỹ năng nghề dưới 3 tháng",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          RoundCheckBox(
                            isChecked: p18b == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18b = p18b == 1 ? 0 : 1;
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
                            isChecked: p18b == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18b = p18b == 2 ? 0 : 2;
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
                // const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Chứng chỉ nghề dưới 3 tháng",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          RoundCheckBox(
                            isChecked: p18c == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18c = p18c == 1 ? 0 : 1;
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
                            isChecked: p18c == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p18c = p18c == 2 ? 0 : 2;
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
                //Button
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p18ViewModel.P18Back(thanhvien.c13, thanhvien.c15A);
                    }),
                    UINextButton(ontap: (){
                      if(p18a == 0 || p18b == 0 || p18c == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} có P18 - Công nhận hoặc bằng cấp/chứng chỉ/kỹ năng bị bỏ trống!',)
                        );
                      }else {
                        p18ViewModel.P18Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c16A: p18a,
                          c16B: p18b,
                          c16C: p18c,
                        ));
                      }
                    }),
                  ],
                )
              ],
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