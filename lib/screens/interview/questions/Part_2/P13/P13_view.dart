import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P13_viewmodel.dart';

class P13View extends StatefulWidget {
  const P13View({Key? key}) : super(key: key);

  @override
  State<P13View> createState() => _P13ViewState();
}

class _P13ViewState extends State<P13View> {
  late P13ViewModel p13ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p13ViewModel = context.read();
      p13ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p13ViewModel.thanhvien;
              groupValue = p13ViewModel.thanhvien.c11 ?? 0;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p13
                UIRichText(
                  text1: "P13. Hiện nay, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có đang theo học một trường lớp nào "
                      "thuộc Hệ thống giáo dục quốc dân không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "Có",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 1 ? 0 : 1;
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
                      groupValue = groupValue == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Không",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 2 ? 0 : 2;
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
                      groupValue = groupValue == 2 ? 0 : 2;
                    });
                  },
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
                          p13ViewModel.P13Back(thanhvien.c09);
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
                          if(groupValue == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'P13 - Tình trạng đi học nhập vào chưa đúng!',)
                            );
                          } else if(groupValue == 2 && (thanhvien.c04! >= 15 && thanhvien.c04! < 18)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} có '
                                      'tuổi = ${thanhvien.c04} đang trong độ tuổi đi học mà hiện không đi học (P13 = 2). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();

                                  },
                                )
                            );
                          }
                          else if(groupValue == 2 && (thanhvien.c04! >= 15 && thanhvien.c04! < 18)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} ở '
                                      'khu vực thành thị: Tuổi tròn ${thanhvien.c04}'
                                      ' mà hiện không đi học (P13 = 2). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();

                                  },
                                )
                            );
                          }
                          else if(groupValue == 1 && thanhvien.c04! >= 60){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} có '
                                      'tuổi = ${thanhvien.c04} mà đang đi học (P13 = 2). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();

                                  },
                                )
                            );
                          }
                          else if(groupValue == 2 && thanhvien.c10! == 5){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} chuyển '
                                      'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();

                                  },
                                )
                            );
                          }else {
                            p13ViewModel.P13Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: groupValue,
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
    );
  }
}