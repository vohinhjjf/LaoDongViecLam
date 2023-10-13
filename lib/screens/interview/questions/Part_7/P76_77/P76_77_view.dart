import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P76_77_viewmodel.dart';

class P76_77View extends StatefulWidget {
  const P76_77View({Key? key}) : super(key: key);

  @override
  State<P76_77View> createState() => _P76_77ViewState();
}

class _P76_77ViewState extends State<P76_77View> {
  late P76_77ViewModel p76_77ViewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  int p76 = 0, p77 = 0;

  var _doisong = [
    "CẢI THIỆN HƠN",
    "NHƯ CŨ",
    "GIẢM SÚT",
    "KHÔNG BIẾT",
  ];

  var _thunhap = [
    "TĂNG LÊN",
    "KHÔNG THAY ĐỔI",
    "GIẢM ĐI",
    "KHÔNG BIẾT",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p76_77ViewModel = context.read();
      p76_77ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p76_77ViewModel.thanhvien;
              p76 = p76_77ViewModel.thanhvien.c62_M1 ?? 0;
              p77 = p76_77ViewModel.thanhvien.c62_M2 ?? 0;
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
                //p76
                UIRichText(
                  text1: "P76. So với tháng trước, đời sống gia đình hiện nay của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có được cải thiện hơn không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _doisong.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _doisong[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p76 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p76 = p76 == index+1 ? 0 : index+1;
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
                          p76 = p76 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                //p77
                UIRichText(
                  text1: "P76. So với tháng trước, thu nhập hiện nay của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " thay đổi như thế nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _thunhap.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thunhap[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p77 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p77 = p77 == index+1 ? 0 : index+1;
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
                          p77 = p77 == index+1 ? 0 : index+1;
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
                          p76_77ViewModel.P76_77Back();
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
                          if(p76 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P76 - Đời sống gia đình nhập vào chưa đúng!',)
                            );
                          }
                          else if(p77 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P77 - Thu nhập hiện nay nhập vào chưa đúng!',)
                            );
                          }
                          else if((p76 == 1 && p77 == 3) || (p76 == 3 && p77 == 1)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Đời sống gia đình ${(p76 == 1 && p77 == 3) ? "được cải thiện":"giảm sút"} mà thu nhập ${(p76 == 1 && p77 == 3) ? "giảm sút":"tăng lên"}. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p76_77ViewModel.P76_77Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c62_M1: p76,
                                      c62_M2: p77,
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p76_77ViewModel.P76_77Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c62_M1: p76,
                              c62_M2: p77,
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