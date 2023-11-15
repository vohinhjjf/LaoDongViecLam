import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P65_66_viewmodel.dart';

class P65_66View extends StatefulWidget {
  const P65_66View({Key? key}) : super(key: key);

  @override
  State<P65_66View> createState() => _P65_66ViewState();
}

class _P65_66ViewState extends State<P65_66View> {
  late P65_66ViewModel p65_66ViewModel;
  var thanhvien = thongTinThanhVienModel();
  final _gio = TextEditingController();
  final _thunhap = TextEditingController();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p65_66ViewModel = context.read();
      p65_66ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              thanhvien = p65_66ViewModel.thanhvien;
              _gio.text = ((p65_66ViewModel.thanhvien.c40 ?? 0)
                  + (p65_66ViewModel.thanhvien.c53 ?? 0)
                  + (p65_66ViewModel.thanhvien.c57 ?? 0)).toString();
              _thunhap.text = ((p65_66ViewModel.thanhvien.c42 ?? 0)
                  + (p65_66ViewModel.thanhvien.c55 ?? 0)
                  + (p65_66ViewModel.thanhvien.c58 ?? 0)).toString();
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p65
                UIRichText(
                  text1: "P65. Trong 7 ngày qua, tổng số giờ làm tất cả các công "
                      "việc của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: ", bao gồm công việc chính và các"
                      " công việc khác nếu có, là:\n(ĐƠN VỊ TÍNH: GIỜ)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UITextFormField(
                  controller: _gio,
                  readOnly: true,
                ),
                //p62
                const SizedBox(height: 10,),
                UIRichText(
                  text1: "P66. Tháng trước, tổng thu nhập từ tất cả các công việc "
                      "của ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " bao gồm công việc chính và các công "
                      "việc khác nếu có, là:\n(ĐƠN VỊ TÍNH: NGHÌN ĐỒNG)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UITextFormField(
                  controller: _thunhap,
                  readOnly: true,
                ),
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
              p65_66ViewModel.P65_66Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(int.parse(_gio.text) > 84){
                warningDialog('${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P65 - Tổng thời gian làm tất cả các công việc = ${_gio.text} quá lớn!', 1);
              }
              else if(int.parse(_thunhap.text) > 900000){
                warningDialog('${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_thunhap.text} quá lớn!', 2);
              }
              else if(int.parse(_gio.text) >= 60){
                notifiDialog('${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P65 - Tổng thời gian làm tất cả các công việc = ${_gio.text} có đúng không?',
                    1, (){
                      Navigator.pop(context);
                      if(int.parse(_thunhap.text) >= 400000){
                        notifiDialog('${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_gio.text} có đúng không?',
                            2, (){
                              Navigator.of(context).pop();
                              p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c59: int.parse(_gio.text),
                                c60: int.parse(_thunhap.text),
                              ));
                            } );
                      }
                      else {
                        p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c59: int.parse(_gio.text),
                          c60: int.parse(_thunhap.text),
                        ));
                      }
                    });
              }
              else if(int.parse(_thunhap.text) >= 400000){
                notifiDialog('${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_gio.text} có đúng không?',
                    2, (){
                      Navigator.of(context).pop();
                      p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                        idho: thanhvien.idho,
                        idtv: thanhvien.idtv,
                        c59: int.parse(_gio.text),
                        c60: int.parse(_thunhap.text),
                      ));
                    } );
              }
              else {
                p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c59: int.parse(_gio.text),
                  c60: int.parse(_thunhap.text),
                ));
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

  warningDialog(String warning, int index){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
              text: warning,
              textAlign: TextAlign.center,
              textColor: Colors.black,
              textFontSize: fontLarge
          ),
          content: Container(
            height: 50,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                //65
                Visibility(
                  visible: index == 1 && thanhvien.c40 != null,
                  child: MaterialButton(
                      height: 50,
                      minWidth: (MediaQuery.of(context).size.width-80),
                      child: const UIText(
                        text: "Sửa P45 - Số giờ thực tế cho CV chính",
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        p65_66ViewModel.replaceQuestion(0);
                      }
                  ),
                ),
                Visibility(
                  visible: index == 1 && thanhvien.c55 != null,
                  child: MaterialButton(
                      height: 50,
                      minWidth: (MediaQuery.of(context).size.width-80),
                      child: const UIText(
                        text: "Sửa P59 - Số giờ thực tế cho CV thứ 2",
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        p65_66ViewModel.replaceQuestion(2);
                      }
                  ),
                ),
                Visibility(
                    visible: index == 1 && thanhvien.c57 != null,
                    child: MaterialButton(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width-80),
                        child: const UIText(
                          text: "Sửa P63 - Số giờ thực tế cho CV khác",
                          textColor: mPrimaryColor,
                          textFontSize: fontLarge,
                          isBold: true,
                        ),
                        onPressed: () {
                          p65_66ViewModel.replaceQuestion(4);
                        }
                    ),
                ),
                //66
                Visibility(
                  visible: index == 2 && thanhvien.c42 != null,
                  child: MaterialButton(
                      height: 50,
                      minWidth: (MediaQuery.of(context).size.width-80),
                      child: const UIText(
                        text: "Sửa P48 - Số tiền nhận được từ CV chính",
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        p65_66ViewModel.replaceQuestion(1);
                      }
                  ),
                ),
                Visibility(
                  visible: index == 2 && thanhvien.c55 != null,
                  child: MaterialButton(
                      height: 50,
                      minWidth: (MediaQuery.of(context).size.width-80),
                      child: const UIText(
                        text: "Sửa P61 - Số tiền nhận được CV thứ 2",
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        p65_66ViewModel.replaceQuestion(3);
                      }
                  ),
                ),
                Visibility(
                  visible: index == 2 && thanhvien.c57 != null,
                  child: MaterialButton(
                      height: 50,
                      minWidth: (MediaQuery.of(context).size.width-80),
                      child: const UIText(
                        text: "Sửa P64 - Số tiền nhận được từ CV khác",
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        p65_66ViewModel.replaceQuestion(4);
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  notifiDialog(String notifi, int index, Function() onpress){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
            text: notifi,
            textColor: Colors.black,
            textAlign: TextAlign.center,
            textFontSize:fontLarge,
          ),
          content: Container(
            height: 50,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    height: 50,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    onPressed: onpress,
                    child: const UIText(
                      text: 'Có',
                      textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    )
                ),
                MaterialButton(
                    height: 50,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    onPressed: (){
                      Navigator.of(context).pop();
                      warningDialog("Sửa thông tin số ${index == 1 ? "giờ làm việc" : "tiền nhận được"} từ tất cả các công việc", index);
                    },
                    child: const UIText(
                      text: 'Không',
                      textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}