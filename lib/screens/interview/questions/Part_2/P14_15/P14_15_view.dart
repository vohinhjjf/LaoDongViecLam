import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P14_15_viewmodel.dart';

class P14_15View extends StatefulWidget {
  const P14_15View({Key? key}) : super(key: key);

  @override
  State<P14_15View> createState() => _P14_15ViewState();
}

class _P14_15ViewState extends State<P14_15View> {
  late P14_15ViewModel p14_15ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p14 = 0, p15 =0;
  bool check = true;

  var _trinhdo = [
    "CHƯA BAO GIỜ ĐI HỌC",
    "CHƯA HỌC XONG TIỂU HỌC",
    "TIỂU HỌC",
    "TRUNG HỌC CƠ SỞ",
    "TRUNG HỌC PHỔ THÔNG",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p14_15ViewModel = context.read();
      p14_15ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p14_15ViewModel.thanhvien;
              p14 = p14_15ViewModel.thanhvien.c12 ?? 0;
              p15 = p14_15ViewModel.thanhvien.c13 ?? 0;
              if(thanhvien.c04! >= 15 && thanhvien.c04! <= 24){
                check = false;
              }
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
                //p14
                Visibility(
                  visible: check,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P14. Hiện nay, ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có đang theo học đào tạo nghề "
                              "ngắn hạn hoặc bổ sung kiến thức, kỹ năng gì không?",
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
                            checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
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
                            text: "KHÔNG",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
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
                            checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            uncheckedColor: Colors.white,
                            uncheckedWidget: Container(),
                          ),
                          onTap: () {
                            setState(() {
                              p14 = p14 == 2 ? 0 : 2;
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                      ],
                    )
                ),
                //p15
                UIRichText(
                  text1: "P15. Trình độ giáo dục phổ thông cao nhất mà ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã tốt nghiệp/đạt được là gì?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _trinhdo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _trinhdo[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p15 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p15 = p15 == index+1 ? 0 : index+1;
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
                          p15 = p15 == index+1 ? 0 : index+1;
                        });
                      },
                    );
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
                          p14_15ViewModel.P14_15Back();
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
                          if(p14 == 0 && check){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'P14 - Tình trạng học đào tạo nghề nhập vào chưa đúng!',)
                            );
                          }
                          else if(p15 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'P15 - Trình độ giáo dục nhập vào chưa đúng!',)
                            );
                          }
                          else if(p14 == 1 && p15 == 4 && (thanhvien.c03B == '2009' || thanhvien.c04! <= 14)
                              && thanhvien.thangDT! < 6){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} sinh năm 2009 và đang đi học mà có '
                                    'trình độ phổ thông đạt được là đã tốt nghiệp THCS',)
                            );
                          }
                          else if(p14 == 1 && p15 == 5 && (int.parse(thanhvien.c03B!) >= 2006 || thanhvien.c04! >= 17)
                              && (thanhvien.thangDT ?? 0) < 6){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} sinh năm 2006 và đang đi học mà có '
                                    'trình độ phổ thông đạt được là đã tốt nghiệp THPT',)
                            );
                          }
                          else if(thanhvien.c11 == 1 && p15 == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} đang đi học mà có '
                                    'trình độ phổ thông đạt được là chưa bao giờ học',)
                            );
                          }
                          else if(thanhvien.c10M == 5 && p14 == 2){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} chuyển đến nơi '
                                      'ở mới để đi học mà hiện không theo học đào '
                                      'tạo nghề. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c04! > 15 && p15 == 2){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trên 15 tuổi, '
                                                'đang đi học mà có trình độ phổ thông dạt '
                                                'được là chưa học xong tiểu học. Có đúng không?',
                                            onpress: (){
                                              p14_15ViewModel.P14_15Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c12: p14,
                                                c13: p15,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p14_15ViewModel.P14_15Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c04: thanhvien.c04,
                                        c12: p14,
                                        c13: p15,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c04! > 15 && p15 == 2){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} trên 15 tuổi, '
                                      'đang đi học mà có trình độ phổ thông dạt '
                                      'được là chưa học xong tiểu học. Có đúng không?',
                                  onpress: (){
                                    p14_15ViewModel.P14_15Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c12: p14,
                                      c13: p15,
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p14_15ViewModel.P14_15Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c12: p14,
                              c13: p15,
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