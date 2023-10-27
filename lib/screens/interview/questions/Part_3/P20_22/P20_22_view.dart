import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P20_22_viewmodel.dart';

class P20_22View extends StatefulWidget {
  const P20_22View({Key? key}) : super(key: key);

  @override
  State<P20_22View> createState() => _P20_22ViewState();
}

class _P20_22ViewState extends State<P20_22View> {
  late P20_22ViewModel p20_22ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p20 = 0, p21 =0, p22 =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p20_22ViewModel = context.read();
      p20_22ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p20_22ViewModel.thanhvien;
              p20 = p20_22ViewModel.thanhvien.c18 ?? 0;
              p21 = p20_22ViewModel.thanhvien.c19 ?? 0;
              p22 = p20_22ViewModel.thanhvien.c20 ?? 0;
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
                //p20
                UIRichText(
                  text1: "P20. Trong 7 ngày qua, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có tham gia hoặc thực hiện"
                      " bất kỳ công việc sản xuất, kinh doanh từ 1 giờ trở lên "
                      "để tạo ra thu nhập không?",
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
                    isChecked: p20 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p20 = p20 == 1 ? 0 : 1;
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
                      p20 = p20 == 1 ? 0 : 1;
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
                    isChecked: p20 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p20 = p20 == 2 ? 0 : 2;
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
                      p20 = p20 == 2 ? 0 : 2;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                Visibility(
                    visible: p20 == 2,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P21. Trong 7 ngày qua, ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có giúp thành viên của hộ hoặc của gia đình "
                              "trong công việc họ được nhận tiền công/tiền lương "
                              "hoặc thu lợi nhuận thậm chí chỉ trong 1 giờ không?",
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
                            isChecked: p21 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p21 = p21 == 1 ? 0 : 1;
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
                              p21 = p21 == 1 ? 0 : 1;
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
                            isChecked: p21 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p21 = p21 == 2 ? 0 : 2;
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
                              p21 = p21 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
                Visibility(
                    visible: p20 == 2 && p21 == 2,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P22. Mặc dù không làm việc trong 7 ngày qua, nhưng"
                              " có phải ",
                          text2: thanhvien.c00 ?? "",
                          text3: " vẫn có công việc được trả công/trả"
                              " lương hoặc công việc sản xuất kinh doanh và dự định"
                              " sẽ quay trở lại làm công việc đó không?",
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
                            isChecked: p22 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p22 = p22 == 1 ? 0 : 1;
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
                              p22 = p22 == 1 ? 0 : 1;
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
                            isChecked: p22 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p22 = p22 == 2 ? 0 : 2;
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
                              p22 = p22 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
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
                          p20_22ViewModel.P20_22Back();
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
                          if(p20 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P20 - Sản xuất kinh doanh, làm nông nghiệp nhập vào chưa đúng!',)
                            );
                          }
                          else if(p20 == 2 && p21 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P21 - Giúp thành viên của hộ gia đình trong công việc nhập vào chưa đúng!',)
                            );
                          }
                          else if(p20 == 2 && p21 == 2 && p22 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P22 - Không làm việc trong 7 ngày qua, việc vẫn trả được lương, trả công nhập vào chưa đúng!',)
                            );
                          }
                          else if(p22 == 2){
                            if(thanhvien.c02 == 1 && (thanhvien.c04! >= 22 && thanhvien.c04! <= 60)){
                              showDialog(
                                  context: context,
                                  builder: (_) => UINotificationDialog(
                                    notification: '${thanhvien.c02 == 1 ? "Ông" : "Bà"} ${thanhvien.c00} ${thanhvien.c04} tuổi nhưng không làm việc gì từ 1 giờ trở lên để tạo thu nhập. Có đúng không?',
                                    onpress: (){
                                      p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c18: p20,
                                        c19: p20 == 2 ? p21 : null,
                                        c20: p20 == 2 && p21 == 2 ? p22 : null,
                                      ));
                                    },
                                  )
                              );
                            }
                            else if(thanhvien.c02 == 2 && (thanhvien.c04! >= 22 && thanhvien.c04! <= 55)){
                              showDialog(
                                  context: context,
                                  builder: (_) => UINotificationDialog(
                                    notification: '${thanhvien.c02 == 1 ? "Ông" : "Bà"} ${thanhvien.c00} ${thanhvien.c04} tuổi nhưng không làm việc gì từ 1 giờ trở lên để tạo thu nhập. Có đúng không?',
                                    onpress: (){
                                      p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c18: p20,
                                        c19: p20 == 2 ? p21 : null,
                                        c20: p20 == 2 && p21 == 2 ? p22 : null,
                                      ));
                                    },
                                  )
                              );
                            }
                            else {
                              p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c18: p20,
                                c19: p20 == 2 ? p21 : null,
                                c20: p20 == 2 && p21 == 2 ? p22 : null,
                              ));
                            }
                          }
                          else {
                            p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c18: p20,
                              c19: p20 == 2 ? p21 : null,
                              c20: p20 == 2 && p21 == 2 ? p22 : null,
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
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}