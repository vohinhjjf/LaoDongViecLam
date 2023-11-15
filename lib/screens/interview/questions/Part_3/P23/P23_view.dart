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
import 'P23_viewmodel.dart';

class P23View extends StatefulWidget {
  const P23View({Key? key}) : super(key: key);

  @override
  State<P23View> createState() => _P23ViewState();
}

class _P23ViewState extends State<P23View> {
  late P23ViewModel p23ViewModel;
  final _orther = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p23 = 0;
  bool check_draw = true;

  var _lydo = [
    "CHỜ BẮT ĐẦU CÔNG VIỆC HOẶC HOẠT ĐỘNG KINH DOANH MỚI",
    "LÀM THEO CA/KÍP, THỜI GIAN LINH HOẠT/DO TÍNH CHẤT CÔNG VIỆC",
    "CÔNG VIỆC THEO MÙA/VỤ",
    "NGHỈ HÈ/NGHỈ LỄ/ĐI DU LỊCH",
    "ỐM ĐAU/TAI NẠN",
    "NGHỈ THAI SẢN",
    "ĐI HỌC/ĐÀO TẠO",
    "BẬN VIỆC RIÊNG",
    "NGHỈ GIÃN VIỆC/TẠM NGỪNG SẢN XUẤT/GIẢM KHÁCH HÀNG",
    "THỜI TIẾT XẤU/THIÊN TAI",
    "DO DỊCH BỆNH",
    "ĐÌNH CÔNG/BIỂU TÌNH",
    "KHUYẾT TẬT/ỐM ĐAU LÂU DÀI",
    "KHÁC (GHI CỤ THẾ)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p23ViewModel = context.read();
      p23ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
          () => {
                setState(() {
                  thanhvien = p23ViewModel.thanhvien;
                  p23 = p23ViewModel.thanhvien.c21 ?? 0;
                  _orther.text = p23ViewModel.thanhvien.c21K ?? "";
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
                //p23
                UIRichText(
                  text1: "P23. Lý do chính ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " tạm nghỉ việc trong 7 ngày qua?",
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _lydo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _lydo[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p23 == index + 1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p23 = p23 == index + 1 ? 0 : index + 1;
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
                          p23 = p23 == index + 1 ? 0 : index + 1;
                        });
                      },
                    );
                  },
                ),
                Visibility(
                  visible: p23 == 14 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const UIText(
                        text: "Lý do khác",
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      UITextFormField(
                        controller: _orther,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lý do chưa được nhập';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                          FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                        ],
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
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
              p23ViewModel.P23Back();
            }),
            UINextButton(ontap: () {
              if (p23 == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(
                      waring:
                      'P23-Lý do tạm nghỉ việc bị bỏ trống!',
                    ));
              } else if (thanhvien.c02 == 1 && p23 == 6) {
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(
                      waring:
                      '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là nam mà lý do tạm nghỉ là nghỉ thai sản!',
                    ));
              } else {
                p23ViewModel.P23Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c21: p23,
                  c21K: _orther.text,
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
