import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P85_viewmodel.dart';

class P85View extends StatefulWidget {
  const P85View({Key? key}) : super(key: key);

  @override
  State<P85View> createState() => _P85ViewState();
}

class _P85ViewState extends State<P85View> {
  late P85ViewModel p85ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p85a = 0, p85b =0, p85c =0, p85d = 0, p85e =0, p85f =0, p85g = 0, p85h =0, p85i =0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p85ViewModel = context.read();
      p85ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p85ViewModel.thanhvien;
              p85a = p85ViewModel.thanhvien.c85_A ?? 0;
              p85b = p85ViewModel.thanhvien.c85_B ?? 0;
              p85c = p85ViewModel.thanhvien.c85_C ?? 0;
              p85d = p85ViewModel.thanhvien.c85_D ?? 0;
              p85e = p85ViewModel.thanhvien.c85_E ?? 0;
              p85f = p85ViewModel.thanhvien.c85_F ?? 0;
              p85g = p85ViewModel.thanhvien.c85_G ?? 0;
              p85h = p85ViewModel.thanhvien.c85_H ?? 0;
              p85i = p85ViewModel.thanhvien.c85_I ?? 0;
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
                //p85
                UIRichText(
                  text1: "P85. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " sử dụng phương tiện thông dụng nhất "
                      "(kể cả đi bộ) mất bao nhiêu thời gian để đi từ nhà đến điểm "
                      "cung ứng dịch vụ gần nhất của các tổ chức tài chính sau đây?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                //a
                const UIText(
                  text: "a. Ngân hàng thương mại (Hội sở, chi nhánh, phòng giao dịch)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85a == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85a = p85a == 1 ? 0 : 1;
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
                      p85a = p85a == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85a == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85a = p85a == 2 ? 0 : 2;
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
                      p85a = p85a == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85a == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85a = p85a == 3 ? 0 : 3;
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
                      p85a = p85a == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85a == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85a = p85a == 4 ? 0 : 4;
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
                      p85a = p85a == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //b
                const UIText(
                  text: "b. Ngân hàng Hợp tác xã Việt Nam (Hội sở, chi nhánh, phòng giao dịch)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85b == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85b = p85b == 1 ? 0 : 1;
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
                      p85b = p85b == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85b == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85b = p85b == 2 ? 0 : 2;
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
                      p85b = p85b == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85b == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85b = p85b == 3 ? 0 : 3;
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
                      p85b = p85b == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85b == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85b = p85b == 4 ? 0 : 4;
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
                      p85b = p85b == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //c
                const UIText(
                  text: "c. Ngân hàng Chính sách xã hội (Hội sở, chi nhánh, phòng giao dịch, điểm giao dịch)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85c == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85c = p85c == 1 ? 0 : 1;
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
                      p85c = p85c == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85c == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85c = p85c == 2 ? 0 : 2;
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
                      p85c = p85c == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85c == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85c = p85c == 3 ? 0 : 3;
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
                      p85c = p85c == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85c == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85c = p85c == 4 ? 0 : 4;
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
                      p85c = p85c == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //d
                const UIText(
                  text: "d. Chi nhánh ngân hàng nước ngoài",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85d == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85d = p85d == 1 ? 0 : 1;
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
                      p85d = p85d == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85d == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85d = p85d == 2 ? 0 : 2;
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
                      p85d = p85d == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85d == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85d = p85d == 3 ? 0 : 3;
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
                      p85d = p85d == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85d == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85d = p85d == 4 ? 0 : 4;
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
                      p85d = p85d == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //e
                const UIText(
                  text: "e. Quỹ tín dụng nhân dân (Trụ sở chính, phòng giao dịch)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85e == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85e = p85e == 1 ? 0 : 1;
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
                      p85e = p85e == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85e == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85e = p85e == 2 ? 0 : 2;
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
                      p85e = p85e == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85e == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85e = p85e == 3 ? 0 : 3;
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
                      p85e = p85e == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85e == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85e = p85e == 4 ? 0 : 4;
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
                      p85e = p85e == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //f
                const UIText(
                  text: "f. Tổ chức tín dụng phi ngân hàng (công ty tài chính, "
                      "công ty cho thuê tài chính, công ty tài chính tiêu dùng)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85f == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85f = p85f == 1 ? 0 : 1;
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
                      p85f = p85f == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85f == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85f = p85f == 2 ? 0 : 2;
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
                      p85f = p85f == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85f == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85f = p85f == 3 ? 0 : 3;
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
                      p85f = p85f == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85f == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85f = p85f == 4 ? 0 : 4;
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
                      p85f = p85f == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //g
                const UIText(
                  text: "g. Tổ chức tài chính vi mô (Trụ sở chính, chi nhánh, phòng giao dịch, điểm giao dịch)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85g == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85g = p85g == 1 ? 0 : 1;
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
                      p85g = p85g == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85g == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85g = p85g == 2 ? 0 : 2;
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
                      p85g = p85g == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85g == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85g = p85g == 3 ? 0 : 3;
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
                      p85g = p85g == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85g == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85g = p85g == 4 ? 0 : 4;
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
                      p85g = p85g == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //h
                const UIText(
                  text: "h. Công ty trung gian thanh toán (Hội sở, chi nhánh)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85h == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85h = p85h == 1 ? 0 : 1;
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
                      p85h = p85h == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85h == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85h = p85h == 2 ? 0 : 2;
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
                      p85h = p85h == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85h == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85h = p85h == 3 ? 0 : 3;
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
                      p85h = p85h == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85h == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85h = p85h == 4 ? 0 : 4;
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
                      p85h = p85h == 4 ? 0 : 4;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //i
                const UIText(
                  text: "i. Công ty bảo hiểm (Hội sở, chi nhánh)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "DƯỚI 15 PHÚT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85i == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85i = p85i == 1 ? 0 : 1;
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
                      p85i = p85i == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 15 PHÚT ĐẾN DƯỚI 1 TIẾNG",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85i == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85i = p85i == 2 ? 0 : 2;
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
                      p85i = p85i == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "TỪ 1 TIẾNG TRỞ LÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85i == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85i = p85i == 3 ? 0 : 3;
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
                      p85i = p85i == 3 ? 0 : 3;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p85i == 4 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p85i = p85i == 4 ? 0 : 4;
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
                      p85i = p85i == 4 ? 0 : 4;
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
                          p85ViewModel.P85Back();
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
                          p85ViewModel.P85Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c85_A: p85a,
                            c85_B: p85b,
                            c85_C: p85c,
                            c85_D: p85d,
                            c85_E: p85e,
                            c85_F: p85f,
                            c85_G: p85g,
                            c85_H: p85h,
                            c85_I: p85i,
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