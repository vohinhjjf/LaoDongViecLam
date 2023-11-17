import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:LDVL2024/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P98_viewmodel.dart';

class P98View extends StatefulWidget {
  const P98View({Key? key}) : super(key: key);

  @override
  State<P98View> createState() => _P98ViewState();
}

class _P98ViewState extends State<P98View> {
  late P98ViewModel p98ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p98a = 0, p98b =0, p98c =0, p98d = 0, p98e =0, p98f =0, p98g = 0, p98h =0, p98i =0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p98ViewModel = context.read();
      p98ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p98ViewModel.thanhvien;
              p98a = p98ViewModel.dichVuTaiChinhModel.c98_A ?? 0;
              p98b = p98ViewModel.dichVuTaiChinhModel.c98_B ?? 0;
              p98c = p98ViewModel.dichVuTaiChinhModel.c98_C ?? 0;
              p98d = p98ViewModel.dichVuTaiChinhModel.c98_D ?? 0;
              p98e = p98ViewModel.dichVuTaiChinhModel.c98_E ?? 0;
              p98f = p98ViewModel.dichVuTaiChinhModel.c98_F ?? 0;
              p98g = p98ViewModel.dichVuTaiChinhModel.c98_G ?? 0;
              p98h = p98ViewModel.dichVuTaiChinhModel.c98_H ?? 0;
              p98i = p98ViewModel.dichVuTaiChinhModel.c98_I ?? 0;
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
          textAlign: TextAlign.start,
          textFontSize: fontLarge,
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
                //p98
                UIRichText(
                  text1: "P98. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thể cho biết mức độ tin tưởng của bản thân vào các "
                      "tổ chức tài chính sau đây để gửi tiền hoặc sử dụng sản "
                      "phẩm/dịch vụ tài chính",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                //a
                const UIText(
                  text: "a. Ngân hàng thương mại",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98a == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98a = p98a == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98a = p98a == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98a == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98a = p98a == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98a = p98a == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98a == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98a = p98a == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98a = p98a == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98a == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98a = p98a == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98a = p98a == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //b
                const UIText(
                  text: "b. Ngân hàng Hợp tác xã Việt Nam",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98b == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98b = p98b == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98b = p98b == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98b == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98b = p98b == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98b = p98b == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98b == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98b = p98b == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98b = p98b == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98b == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98b = p98b == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98b = p98b == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //c
                const UIText(
                  text: "c. Ngân hàng Chính sách xã hội",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98c == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98c = p98c == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98c = p98c == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98c == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98c = p98c == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98c = p98c == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98c == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98c = p98c == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98c = p98c == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98c == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98c = p98c == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98c = p98c == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //d
                const UIText(
                  text: "d. Chi nhánh ngân hàng nước ngoài",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98d == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98d = p98d == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98d = p98d == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98d == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98d = p98d == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98d = p98d == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98d == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98d = p98d == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98d = p98d == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98d == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98d = p98d == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98d = p98d == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //e
                const UIText(
                  text: "e. Quỹ tín dụng nhân dân",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98e == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98e = p98e == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98e = p98e == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98e == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98e = p98e == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98e = p98e == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98e == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98e = p98e == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98e = p98e == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98e == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98e = p98e == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98e = p98e == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //f
                const UIText(
                  text: "f. Tổ chức tín dụng phi ngân hàng",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98f == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98f = p98f == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98f = p98f == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98f == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98f = p98f == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98f = p98f == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98f == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98f = p98f == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98f = p98f == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98f == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98f = p98f == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98f = p98f == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //g
                const UIText(
                  text: "g. Tổ chức tài chính vi mô",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98g == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98g = p98g == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98g = p98g == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98g == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98g = p98g == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98g = p98g == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98g == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98g = p98g == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98g = p98g == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98g == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98g = p98g == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98g = p98g == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //h
                const UIText(
                  text: "h. Công ty trung gian thanh toán",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98h == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98h = p98h == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98h = p98h == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98h == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98h = p98h == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98h = p98h == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98h == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98h = p98h == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98h = p98h == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98h == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98h = p98h == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98h = p98h == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //i
                const UIText(
                  text: "i. Công ty bảo hiểm",
                  textColor: Colors.black,
                  textFontSize: fontMedium,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98i == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98i = p98i == 1 ? 0 : 1;
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
                  onTap: (){
                    setState(() {
                      p98i = p98i == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "ÍT TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98i == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98i = p98i == 2 ? 0 : 2;
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
                  onTap: (){
                    setState(() {
                      p98i = p98i == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TIN TƯỞNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98i == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98i = p98i == 3 ? 0 : 3;
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
                  onTap: (){
                    setState(() {
                      p98i = p98i == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG CÓ ĐÁNH GIÁ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p98i == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p98i = p98i == 4 ? 0 : 4;
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
                  onTap: (){
                    setState(() {
                      p98i = p98i == 4 ? 0 : 4;
                    });
                  },
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
                          p98ViewModel.P98Back();
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
                          p98ViewModel.P98Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c98_A: p98a,
                            c98_B: p98b,
                            c98_C: p98c,
                            c98_D: p98d,
                            c98_E: p98e,
                            c98_F: p98f,
                            c98_G: p98g,
                            c98_H: p98h,
                            c98_I: p98i,
                          ));
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