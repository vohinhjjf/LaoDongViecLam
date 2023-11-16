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
import 'P15_viewmodel.dart';

class P15View extends StatefulWidget {
  const P15View({Key? key}) : super(key: key);

  @override
  State<P15View> createState() => _P15ViewState();
}

class _P15ViewState extends State<P15View> {
  late P15ViewModel p15ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p15 = 0;
  bool check_draw = true;

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
      p15ViewModel = context.read();
      p15ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
          () => {
                setState(() {
                  thanhvien = p15ViewModel.thanhvien;
                  p15 = p15ViewModel.thanhvien.c13 ?? 0;
                })
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UIGPSButton(), UIEXITButton()],
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
                //p15
                UIRichText(
                  text1: "P15. Trình độ giáo dục phổ thông cao nhất mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã tốt nghiệp/đạt được là gì?",
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _trinhdo.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _trinhdo[index].toString(),
                      check: p15 == index + 1,
                      onTap1: (value){
                        setState(() {
                          p15 = p15 == index + 1 ? 0 : index + 1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p15 = p15 == index + 1 ? 0 : index + 1;
                        });
                      },
                    );
                  },
                ),
                //Button
                const SizedBox(
                  height: 90,
                ),
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
            UIBackButton(ontap: () {
              p15ViewModel.P15Back();
            }),
            UINextButton(ontap: () {
              int namHT = DateTime.now().year;
              if (p15 == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(
                      waring:
                      'P15-Trình độ giáo dục nhập vào chưa đúng!',
                    ));
              } else if (p15 == 4 &&
                  (int.parse(thanhvien.c03B!) >= 2010 || namHT - thanhvien.c04! >= 2010) &&
                  thanhvien.thangDT! < 6) {
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring:
                      '${BaseLogic.getInstance().getMember(thanhvien)} '
                          '${thanhvien.c00} sinh năm 2010 và đang đi học mà có '
                          'trình độ phổ thông đạt được là đã tốt nghiệp THCS!',
                    ));
              } else if (p15 == 5 &&
                  (int.parse(thanhvien.c03B!) >= 2007 ||
                      namHT - thanhvien.c04! >= 2007) &&
                  (thanhvien.thangDT ?? 0) < 6) {
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring:
                      '${BaseLogic.getInstance().getMember(thanhvien)} '
                          '${thanhvien.c00} sinh năm 2007 và đang đi học mà có '
                          'trình độ phổ thông đạt được là đã tốt nghiệp THPT!',
                    ));
              }
              else if (thanhvien.c11 == 1 && p15 == 1) {
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring: '${BaseLogic.getInstance().getMember(thanhvien)} '
                          '${thanhvien.c00} đang đi học mà có '
                          'trình độ phổ thông đạt được là chưa bao giờ học',
                    ));
              }
              else if(thanhvien.c03B != "9998" && ((int.parse(thanhvien.c03B!) >= 2010 && thanhvien.thangDT! < 6) && p15 == 4) || ((int.parse(thanhvien.c03B!) >= 2007 && thanhvien.thangDT! < 6) && p15 == 5)){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring: 'Thành viên ${thanhvien.c00} có trình độ phổ thông cao nhất ${_trinhdo[p15 - 1]} mà năm sinh = ${thanhvien.c03B}. Kiểm tra lại!',
                    ));
              }
              else if(thanhvien.c03B == "9998" && ((namHT - thanhvien.c04! >= 2010 && thanhvien.thangDT! < 6) && p15 == 4) || ((namHT - thanhvien.c04! >= 2007 && thanhvien.thangDT! < 6) && p15 == 5)){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring: 'Thành viên ${thanhvien.c00} có trình độ phổ thông cao nhất ${_trinhdo[p15 - 1]} mà tuổi = ${thanhvien.c04}. Kiểm tra lại!',
                    ));
              }
              //Notifi
              else if (thanhvien.c04! > 15 && p15 == 2) {
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification:
                      '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} trên 15 tuổi, '
                          'đang đi học mà có trình độ phổ thông đạt '
                          'được là chưa học xong tiểu học. Có đúng không?',
                      onpress: () {
                        p15ViewModel.P15Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c13: p15,
                        ));
                      },
                    ));
              }
              else {
                p15ViewModel.P15Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c13: p15,
                ));
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors
                .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(
                  onTap: () {
                    setState(() {
                      check_draw = false;
                    });
                  },
                )
              : const DrawerNavigation()),
      drawerScrimColor: Colors.transparent,
    );
  }
}
