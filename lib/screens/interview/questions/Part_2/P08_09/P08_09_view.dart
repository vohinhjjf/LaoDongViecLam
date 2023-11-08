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
import 'P08_09_viewmodel.dart';

class P08_09View extends StatefulWidget {
  const P08_09View({Key? key}) : super(key: key);

  @override
  State<P08_09View> createState() => _P08_09ViewState();
}

class _P08_09ViewState extends State<P08_09View> {
  late P08_09ViewModel p08_09ViewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  int p08 = 0, p09 = 0, month = 0;
  bool check_draw = true;

  final _honnhan = [
    "CHƯA VỢ/CHỒNG",
    "CÓ VỢ/CHỒNG",
    "GÓA",
    "LY HÔN",
    "LY THÂN",
  ];

  final _thuongtru = [
    "DƯỚI 1 THÁNG",
    "1 ĐẾN DƯỚI 6 THÁNG",
    "6 ĐẾN DƯỚI 12 THÁNG",
    "12 ĐẾN DƯỚI 5 NĂM",
    "5 NĂM TRỞ LÊN",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p08_09ViewModel = context.read();
      p08_09ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
          () => {
                setState(() {
                  thanhvien = p08_09ViewModel.thanhvien;
                  p08 = p08_09ViewModel.thanhvien.c07 ?? 0;
                  p09 = p08_09ViewModel.thanhvien.c08 ?? 0;
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
                //p08
                UIRichText(
                  text1: "P08. Tình trạng hôn nhân hiện nay của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " là gì?",
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _honnhan.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _honnhan[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p08 == index + 1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p08 = p08 == index + 1 ? 0 : index + 1;
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
                          p08 = p08 == index + 1 ? 0 : index + 1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //p09
                UIRichText(
                  text1: "P09. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã thường trú ở phường, thị trấn hay xã này được bao lâu?",
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _thuongtru.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thuongtru[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p09 == index + 1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p09 = p09 == index + 1 ? 0 : index + 1;
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
                          p09 = p09 == index + 1 ? 0 : index + 1;
                        });
                      },
                    );
                  },
                ),
                //Button
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: () {
                      p08_09ViewModel.P08_09Back();
                    }),
                    UINextButton(ontap: () {
                      if (p08 == 0) {
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(
                                  waring:
                                      'Thành viên ${thanhvien.c00} có P08-Tình trạng hôn nhân nhập vào chưa đúng!',
                                ));
                      } else if (p09 == 0) {
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(
                                  waring:
                                      'Thời gian thường trú nhập vào chưa đúng!',
                                ));
                      } else if (thanhvien.c01 == 2 &&
                          (p08 == 1 || p08 == 3 || p08 == 4)) {
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(
                                  waring: 'Thành '
                                      'viên ${thanhvien.c00} có P01-Quan hệ với '
                                      'chủ hộ là vợ/chồng mà tình trạng hôn nhân '
                                      'là ${_honnhan[p08 - 1]}. Kiểm tra lại!',
                                ));
                      } else if (thanhvien.c01 == 5 && p08 == 1) {
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(
                                  waring: 'Thành '
                                      'viên ${thanhvien.c00} có P01-Quan hệ với '
                                      'chủ hộ là bố/mẹ mà tình trạng hôn nhân '
                                      'là ${_honnhan[p08 - 1]}. Kiểm tra lại!',
                                ));
                      } else {
                        p08_09ViewModel.P08_09Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c07: p08,
                          c08: p09,
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
