import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P97_viewmodel.dart';

class P97View extends StatefulWidget {
  const P97View({Key? key}) : super(key: key);

  @override
  State<P97View> createState() => _P97ViewState();
}

class _P97ViewState extends State<P97View> {
  late P97ViewModel p97ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p97a = 0, p97b =0, p97c =0, p97d = 0, p97e =0,
      p97f =0, p97g = 0, p97h =0, p97i =0, p97j = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p97ViewModel = context.read();
      p97ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p97ViewModel.thanhvien;
              p97a = p97ViewModel.thanhvien.c97_A ?? 0;
              p97b = p97ViewModel.thanhvien.c97_B ?? 0;
              p97c = p97ViewModel.thanhvien.c97_C ?? 0;
              p97d = p97ViewModel.thanhvien.c97_D ?? 0;
              p97e = p97ViewModel.thanhvien.c97_E ?? 0;
              p97f = p97ViewModel.thanhvien.c97_F ?? 0;
              p97g = p97ViewModel.thanhvien.c97_G ?? 0;
              p97h = p97ViewModel.thanhvien.c97_H ?? 0;
              p97i = p97ViewModel.thanhvien.c97_I ?? 0;
              p97j = p97ViewModel.thanhvien.c97_J ?? 0;
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
                //p97
                UIRichText(
                  text1: "P97. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thể đánh giá hiểu biết của mình về các sản phẩm, "
                      "dịch vụ sau đây của các tổ chức được cấp phép hoạt động?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                //a
                const UIText(
                  text: "a. Tài khoản thanh toán",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97a == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97a = p97a == 1 ? 0 : 1;
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
                      p97a = p97a == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97a == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97a = p97a == 2 ? 0 : 2;
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
                      p97a = p97a == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97a == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97a = p97a == 3 ? 0 : 3;
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
                      p97a = p97a == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //b
                const UIText(
                  text: "b.  Ví điện tử/thẻ trả trước",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97b == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97b = p97b == 1 ? 0 : 1;
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
                      p97b = p97b == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97b == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97b = p97b == 2 ? 0 : 2;
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
                      p97b = p97b == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97b == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97b = p97b == 3 ? 0 : 3;
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
                      p97b = p97b == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //c
                const UIText(
                  text: "c. Thẻ ghi nợ (nội địa, quốc tế…………)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97c == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97c = p97c == 1 ? 0 : 1;
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
                      p97c = p97c == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97c == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97c = p97c == 2 ? 0 : 2;
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
                      p97c = p97c == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97c == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97c = p97c == 3 ? 0 : 3;
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
                      p97c = p97c == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //d
                const UIText(
                  text: "d. Thẻ tín dụng",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97d == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97d = p97d == 1 ? 0 : 1;
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
                      p97d = p97d == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97d == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97d = p97d == 2 ? 0 : 2;
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
                      p97d = p97d == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97d == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97d = p97d == 3 ? 0 : 3;
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
                      p97d = p97d == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //e
                const UIText(
                  text: "e. Tiền gửi tại các tổ chức tín dụng để hưởng lãi (Sổ "
                      "tiết kiệm, chứng chỉ tiền gửi)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97e == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97e = p97e == 1 ? 0 : 1;
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
                      p97e = p97e == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97e == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97e = p97e == 2 ? 0 : 2;
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
                      p97e = p97e == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97e == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97e = p97e == 3 ? 0 : 3;
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
                      p97e = p97e == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //f
                const UIText(
                  text: "f. Sản phẩm hưu trí (gồm bảo hiểm xã hội và bảo hiểm "
                      "hưu trí tự nguyện)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97f == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97f = p97f == 1 ? 0 : 1;
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
                      p97f = p97f == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97f == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97f = p97f == 2 ? 0 : 2;
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
                      p97f = p97f == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97f == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97f = p97f == 3 ? 0 : 3;
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
                      p97f = p97f == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //g
                const UIText(
                  text: "g.  Vay vốn",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97g == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97g = p97g == 1 ? 0 : 1;
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
                      p97g = p97g == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97g == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97g = p97g == 2 ? 0 : 2;
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
                      p97g = p97g == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97g == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97g = p97g == 3 ? 0 : 3;
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
                      p97g = p97g == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //h
                const UIText(
                  text: "h. Sản phẩm đầu tư (gồm cổ phiếu/ tín phiếu/trái phiếu/sản phẩm ủy thác đầu tư)",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97h == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97h = p97h == 1 ? 0 : 1;
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
                      p97h = p97h == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97h == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97h = p97h == 2 ? 0 : 2;
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
                      p97h = p97h == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97h == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97h = p97h == 3 ? 0 : 3;
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
                      p97h = p97h == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //i
                const UIText(
                  text: "i. Bảo hiểm nhân thọ/phi nhân thọ",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97i == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97i = p97i == 1 ? 0 : 1;
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
                      p97i = p97i == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97i == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97i = p97i == 2 ? 0 : 2;
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
                      p97i = p97i == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97i == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97i = p97i == 3 ? 0 : 3;
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
                      p97i = p97i == 3 ? 0 : 3;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                //j
                const UIText(
                  text: "j. Tài chính vi mô",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "1. KHÔNG BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97j == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97j = p97j == 1 ? 0 : 1;
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
                      p97j = p97j == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "2. CÓ NGHE ĐẾN HOẶC CÓ BIẾT",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97j == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97j = p97j == 2 ? 0 : 2;
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
                      p97j = p97j == 2 ? 0 : 2;
                    });
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: const UIText(
                    text: "3. BIẾT RÕ",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p97j == 3 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p97j = p97j == 3 ? 0 : 3;
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
                      p97j = p97j == 3 ? 0 : 3;
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
                          p97ViewModel.P97Back();
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
                          p97ViewModel.P97Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c97_A: p97a,
                            c97_B: p97b,
                            c97_C: p97c,
                            c97_D: p97d,
                            c97_E: p97e,
                            c97_F: p97f,
                            c97_G: p97g,
                            c97_H: p97h,
                            c97_I: p97i,
                            c97_J: p97j,
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