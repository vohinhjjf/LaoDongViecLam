import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P13_14_viewmodel.dart';

class P13_14View extends StatefulWidget {
  const P13_14View({Key? key}) : super(key: key);

  @override
  State<P13_14View> createState() => _P13_14ViewState();
}

class _P13_14ViewState extends State<P13_14View> {
  late P13_14ViewModel p13_14ViewModel;
  var thanhvien = thongTinThanhVienModel();
  var thongtinho = thongTinHoModel();
  int p13 = 0, p14 = 0, tuoi = 0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p13_14ViewModel = context.read();
      p13_14ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p13_14ViewModel.thanhvien;
              thongtinho = p13_14ViewModel.thongtinho;
              p13 = p13_14ViewModel.thanhvien.c11 ?? 0;
              p14 = p13_14ViewModel.thanhvien.c12 ?? 0;
              tuoi = p13_14ViewModel.thanhvien.c04 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p13
                UIRichText(
                  text1: "P13. Hiện nay, ${BaseLogic.getInstance().getMember(thanhvien)} ",
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
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p13 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p13 = p13 == 1 ? 0 : 1;
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
                      p13 = p13 == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Không",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p13 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p13 = p13 == 2 ? 0 : 2;
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
                      p13 = p13 == 2 ? 0 : 2;
                    });
                  },
                ),
                //p14
                Visibility(
                    visible: tuoi >= 15 && tuoi <= 24 && p13 == 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        UIRichText(
                          text1: "P14. Hiện nay, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có đang theo học đào tạo nghề "
                              "ngắn hạn hoặc bổ sung kiến thức, kỹ năng gì không?",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: const UIText(
                            text: "Có",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p14 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p14 = p14 == 1 ? 0 : 1;
                              });
                            },
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            checkedColor: Colors.white,
                            checkedWidget: const Icon(Icons.check,
                                size: 30, color: GFColors.PRIMARY),
                            uncheckedColor: Colors.white,
                            uncheckedWidget: Container(),
                          ),
                          onTap: () {
                            setState(() {
                              p14 = p14 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        ListTile(
                          title: const UIText(
                            text: "Không",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p14 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p14 = p14 == 2 ? 0 : 2;
                              });
                            },
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            checkedColor: Colors.white,
                            checkedWidget: const Icon(Icons.check,
                                size: 30, color: GFColors.PRIMARY),
                            uncheckedColor: Colors.white,
                            uncheckedWidget: Container(),
                          ),
                          onTap: () {
                            setState(() {
                              p14 = p14 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )),
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
              p13_14ViewModel.P13_14Back(thanhvien.c09);
            }),
            UINextButton(ontap: (){
              if(p13 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P13-Tình trạng đi học nhập vào chưa đúng!',)
                );
              }
              else if (p14 == 0 && tuoi >= 15 && tuoi <= 24 && p13 == 2) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(
                      waring:
                      'P14-Tình trạng học đào tạo nghề nhập vào chưa đúng!',
                    ));
              }
              else if(thongtinho.ttnt == 1 && (thanhvien.c04 == 16 || thanhvien.c04 == 17) && p13 == 2){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành viên ${thanhvien.c00} ở khu vực thành thị: '
                          'Tuổi tròn ${thanhvien.c04} mà hiện không đi học (P13 = 2). Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p13 == 2 && (tuoi >= 15 && tuoi < 18)){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: 'Thành viên ${thanhvien.c00} có '
                                    'tuổi = ${thanhvien.c04} đang trong độ tuổi đi học phổ thông mà hiện không đi học (P13 = 2). Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p13 == 2 && thanhvien.c10M != null && thanhvien.c10M == 6){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification: 'Thành viên ${thanhvien.c00} chuyển '
                                              'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                                          onpress: (){
                                            Navigator.of(context).pop();
                                            if(p14 == 1 && tuoi > 60){
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => UINotificationDialog(
                                                    notification:
                                                    '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                                    onpress: () {
                                                      Navigator.of(context).pop();
                                                      if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                                        p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c11: p13,
                                                            c12: p14
                                                        ));
                                                      }
                                                      else {
                                                        p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c11: p13,
                                                        ));
                                                      }
                                                    },
                                                  ));
                                            }
                                            else if (thanhvien.c10M == 6 && p14 == 2) {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => UINotificationDialog(
                                                    notification:
                                                    '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                                        'ở mới để đi học mà hiện không theo học đào '
                                                        'tạo nghề. Có đúng không?',
                                                    onpress: () {
                                                      Navigator.of(context).pop();
                                                      if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                                        p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c11: p13,
                                                            c12: p14
                                                        ));
                                                      }
                                                      else {
                                                        p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c11: p13,
                                                        ));
                                                      }
                                                    },
                                                  ));
                                            }
                                            else {
                                              if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                                p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                    idho: thanhvien.idho,
                                                    idtv: thanhvien.idtv,
                                                    c11: p13,
                                                    c12: p14
                                                ));
                                              }
                                              else {
                                                p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                ));
                                              }
                                            }
                                          },
                                        )
                                    );
                                  }
                                  else if(p14 == 1 && tuoi > 60){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else if (thanhvien.c10M == 6 && p14 == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                              'ở mới để đi học mà hiện không theo học đào '
                                              'tạo nghề. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else {
                                    if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                          idho: thanhvien.idho,
                                          idtv: thanhvien.idtv,
                                          c11: p13,
                                          c12: p14
                                      ));
                                    }
                                    else {
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                      ));
                                    }
                                  }
                                },
                              )
                          );
                        }
                        else if(p13 == 2 && thanhvien.c10M != null && thanhvien.c10M == 6){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: 'Thành viên ${thanhvien.c00} chuyển '
                                    'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p14 == 1 && tuoi > 60){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else if (thanhvien.c10M == 6 && p14 == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                              'ở mới để đi học mà hiện không theo học đào '
                                              'tạo nghề. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else {
                                    if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                          idho: thanhvien.idho,
                                          idtv: thanhvien.idtv,
                                          c11: p13,
                                          c12: p14
                                      ));
                                    }
                                    else {
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                      ));
                                    }
                                  }
                                },
                              )
                          );
                        }
                        else if(p14 == 1 && tuoi > 60){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else if (thanhvien.c10M == 6 && p14 == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                    'ở mới để đi học mà hiện không theo học đào '
                                    'tạo nghề. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else {
                          if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c11: p13,
                                c12: p14
                            ));
                          }
                          else {
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                            ));
                          }
                        }
                      },
                    )
                );
              }
              else if(p13 == 2 && (tuoi >= 15 && tuoi < 18)){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành viên ${thanhvien.c00} có '
                          'tuổi = ${thanhvien.c04} đang trong độ tuổi đi học phổ thông mà hiện không đi học (P13 = 2). Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p13 == 2 && thanhvien.c10M != null && thanhvien.c10M == 6){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: 'Thành viên ${thanhvien.c00} chuyển '
                                    'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p14 == 1 && tuoi > 60){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else if (thanhvien.c10M == 6 && p14 == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                              'ở mới để đi học mà hiện không theo học đào '
                                              'tạo nghề. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else {
                                    if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                          idho: thanhvien.idho,
                                          idtv: thanhvien.idtv,
                                          c11: p13,
                                          c12: p14
                                      ));
                                    }
                                    else {
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                      ));
                                    }
                                  }
                                },
                              )
                          );
                        }
                        else if(p14 == 1 && tuoi > 60){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else if (thanhvien.c10M == 6 && p14 == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                    'ở mới để đi học mà hiện không theo học đào '
                                    'tạo nghề. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else {
                          if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c11: p13,
                                c12: p14
                            ));
                          }
                          else {
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                            ));
                          }
                        }
                      },
                    )
                );
              }
              else if(p13 == 2 && (tuoi >= 5 && tuoi <= 15)){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${thanhvien.c04} '
                          'đang trong độ tuổi đi học mà hiện không đi học (P13 = 2). Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p13 == 2 && thanhvien.c10M != null && thanhvien.c10M == 6){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: 'Thành viên ${thanhvien.c00} chuyển '
                                    'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p14 == 1 && tuoi > 60){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else if (thanhvien.c10M == 6 && p14 == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification:
                                          '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                              'ở mới để đi học mà hiện không theo học đào '
                                              'tạo nghề. Có đúng không?',
                                          onpress: () {
                                            Navigator.of(context).pop();
                                            if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c11: p13,
                                                  c12: p14
                                              ));
                                            }
                                            else {
                                              p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c11: p13,
                                              ));
                                            }
                                          },
                                        ));
                                  }
                                  else {
                                    if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                          idho: thanhvien.idho,
                                          idtv: thanhvien.idtv,
                                          c11: p13,
                                          c12: p14
                                      ));
                                    }
                                    else {
                                      p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                      ));
                                    }
                                  }
                                },
                              )
                          );
                        }
                        else if(p14 == 1 && tuoi > 60){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else if (thanhvien.c10M == 6 && p14 == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                    'ở mới để đi học mà hiện không theo học đào '
                                    'tạo nghề. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else {
                          if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c11: p13,
                                c12: p14
                            ));
                          }
                          else {
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                            ));
                          }
                        }
                      },
                    )
                );
              }
              else if(p13 == 1 && tuoi >= 60){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành viên ${thanhvien.c00} có '
                          'tuổi = ${thanhvien.c04} mà đang đi học (P13 = 2). Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p14 == 1 && tuoi > 60){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else if (thanhvien.c10M == 6 && p14 == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                    'ở mới để đi học mà hiện không theo học đào '
                                    'tạo nghề. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else {
                          if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c11: p13,
                                c12: p14
                            ));
                          }
                          else {
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                            ));
                          }
                        }
                      },
                    )
                );
              }
              else if(p13 == 2 && thanhvien.c10M != null && thanhvien.c10M == 6){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành viên ${thanhvien.c00} chuyển '
                          'đến nơi ở mới để đi học mà hiện (P13 = 2). Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p14 == 1 && tuoi > 60){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else if (thanhvien.c10M == 6 && p14 == 2) {
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification:
                                '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                                    'ở mới để đi học mà hiện không theo học đào '
                                    'tạo nghề. Có đúng không?',
                                onpress: () {
                                  Navigator.of(context).pop();
                                  if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c11: p13,
                                        c12: p14
                                    ));
                                  }
                                  else {
                                    p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c11: p13,
                                    ));
                                  }
                                },
                              ));
                        }
                        else {
                          if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c11: p13,
                                c12: p14
                            ));
                          }
                          else {
                            p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                            ));
                          }
                        }
                      },
                    )
                );
              }
              else if(p14 == 1 && tuoi > 60){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification:
                      '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có tuổi = ${thanhvien.c04} mà P14 = Đang đi học. Có đúng không?',
                      onpress: () {
                        Navigator.of(context).pop();
                        if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                          p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                              c12: p14
                          ));
                        }
                        else {
                          p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c11: p13,
                          ));
                        }
                      },
                    ));
              }
              else if (thanhvien.c10M == 6 && p14 == 2) {
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification:
                      '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} chuyển đến nơi '
                          'ở mới để đi học mà hiện không theo học đào '
                          'tạo nghề. Có đúng không?',
                      onpress: () {
                        Navigator.of(context).pop();
                        if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                          p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c11: p13,
                              c12: p14
                          ));
                        }
                        else {
                          p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c11: p13,
                          ));
                        }
                      },
                    ));
              }
              else {
                if(tuoi >= 15 && tuoi <= 24 && p13 == 2){
                  p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                      idho: thanhvien.idho,
                      idtv: thanhvien.idtv,
                      c11: p13,
                      c12: p14
                  ));
                }
                else {
                  p13_14ViewModel.P13_14Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c11: p13,
                  ));
                }
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