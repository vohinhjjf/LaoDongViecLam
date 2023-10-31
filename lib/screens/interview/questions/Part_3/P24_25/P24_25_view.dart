import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P24_25_viewmodel.dart';

class P24_25View extends StatefulWidget {
  const P24_25View({Key? key}) : super(key: key);

  @override
  State<P24_25View> createState() => _P24_25ViewState();
}

class _P24_25ViewState extends State<P24_25View> {
  late P24_25ViewModel p24_25ViewModel;
  int p23 = 0, p24 = 0, p25 =0;
  var thanhvien = thongTinThanhVienModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p24_25ViewModel = context.read();
      p24_25ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p24_25ViewModel.thanhvien;
              p23 = p24_25ViewModel.thanhvien.c21 ?? 0;
              p24 = p24_25ViewModel.thanhvien.c22 ?? 0;
              p25 = p24_25ViewModel.thanhvien.c23 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p24
                UIRichText(
                  text1: "P24. ",
                  text2: thanhvien.c00 ?? "",
                  text3: p23 == 6
                      ? " có chắc chắn sẽ quay lại làm công việc đang"
                      " tạm nghỉ trong vòng 30 ngày sau khi kết thúc kì nghỉ thai sản không?"
                      : " có chắc chắn sẽ quay lại làm công việc đang"
                      " tạm nghỉ trong vòng 30 ngày tới không?",
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
                    isChecked: p24 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p24 = p24 == 1 ? 0 : 1;
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
                      p24 = p24 == 1 ? 0 : 1;
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
                    isChecked: p24 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p24 = p24 == 2 ? 0 : 2;
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
                      p24 = p24 == 2 ? 0 : 2;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //p25
                Visibility(
                    visible: p24 == 2,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P25. Trong thời gian tạm nghỉ, ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có được nhận tiền công/tiền lương hoặc hưởng "
                              "lợi từ công việc đó không?",
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
                            isChecked: p25 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p25 = p25 == 1 ? 0 : 1;
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
                              p25 = p25 == 1 ? 0 : 1;
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
                            isChecked: p25 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p25 = p25 == 2 ? 0 : 2;
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
                              p25 = p25 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
              ],
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
                          p24_25ViewModel.P24_25Back();
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
                          if(p24 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P24 - Quay lại công việc trong 30 ngày nhập vào chưa đúng!',)
                            );
                          }
                          else if(p25 == 0 && p24 == 2){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P25 - Có thu nhập trong thời gian tạm nghỉ nhập vào chưa đúng!',)
                            );
                          }else {
                            p24_25ViewModel.P24_25Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c22: p24,
                              c23: p24 == 2 ? p25 : null,
                            ));
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
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}