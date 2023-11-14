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
import 'P31_32_viewmodel.dart';

class P31_32View extends StatefulWidget {
  const P31_32View({Key? key}) : super(key: key);

  @override
  State<P31_32View> createState() => _P31_32ViewState();
}

class _P31_32ViewState extends State<P31_32View> {
  late P31_32ViewModel p31_32ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p31 =0, p32 =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p31_32ViewModel = context.read();
      p31_32ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p31_32ViewModel.thanhvien;
              p31 = p31_32ViewModel.thanhvien.c29 ?? 0;
              p32 = p31_32ViewModel.thanhvien.c30 ?? 0;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p31
                UIRichText(
                  text1: "P31. Trong 30 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có chủ động tìm kiếm việc làm hoặc chuẩn bị để bắt "
                      "đầu hoạt động sản xuất kinh doanh không?",
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
                    isChecked: p31 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p31 = p31 == 1 ? 0 : 1;
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
                      p31 = p31 == 1 ? 0 : 1;
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
                    isChecked: p31 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p31 = p31 == 2 ? 0 : 2;
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
                      p31 = p31 == 2 ? 0 : 2;
                    });
                  },
                ),
                //p32
                Visibility(
                  visible: p31 == 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        UIRichText(
                          text1: "P32. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " không tìm việc có phải là do đã tìm được việc"
                              " hoặc đã sẵn sàng hoạt động kinh doanh?",
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
                            isChecked: p32 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p32 = p32 == 1 ? 0 : 1;
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
                              p32 = p32 == 1 ? 0 : 1;
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
                            isChecked: p32 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p32 = p32 == 2 ? 0 : 2;
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
                              p32 = p32 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
                //Button
                const SizedBox(height: 90,),
              ],
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
              p31_32ViewModel.P31_32Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(p31 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P31 - Việc chủ động tìm kiếm việc làm nhập vào chưa đúng!',)
                );
              } else if(p31 == 2 && p32 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P32 - Quyết định không tìm việc hoặc đã sẵn sàng hoạt động kinh doanh nhập vào chưa đúng!',)
                );
              } else {
                p31_32ViewModel.P31_32Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c29: p31,
                  c30: p32,
                ));
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