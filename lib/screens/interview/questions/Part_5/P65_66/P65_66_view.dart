import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p65_66ViewModel = context.read();
      p65_66ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p65_66ViewModel.thanhvien;
              _gio.text = (p65_66ViewModel.thanhvien.c40 ?? 0
                  + (p65_66ViewModel.thanhvien.c53 ?? 0)
                  + (p65_66ViewModel.thanhvien.c57 ?? 0)).toString();
              _thunhap.text = (p65_66ViewModel.thanhvien.c42 ?? 0
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
                //p65
                UIRichText(
                  text1: "P65. Trong 7 ngày qua, tổng số giờ làm tất cả các công "
                      "việc của ",
                  text2: thanhvien.c00 ?? "",
                  text3: ", bao gồm công việc chính và các"
                      " công việc khác nếu có, là:",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _gio,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                  ),
                ),
                //p62
                const SizedBox(height: 10,),
                UIRichText(
                  text1: "P66. Tháng trước, tổng thu nhập từ tất cả các công việc "
                      "của ",
                  text2: thanhvien.c00 ?? "",
                  text3: "bao gồm công việc chính và các công "
                      "việc khác nếu có, là:",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _thunhap,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                  ),
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
                          p65_66ViewModel.P65_66Back(thanhvien);
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
                          if(int.parse(_gio.text) > 84){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P65 - Tổng thời gian làm tất cả các công việc = ${_gio.text} quá lớn!',)
                            );
                          }
                          else if(int.parse(_thunhap.text) > 900000){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_thunhap.text} quá lớn!',)
                            );
                          }
                          else if(int.parse(_gio.text) >= 64){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} có P65 - Tổng thời gian làm tất cả các công việc = ${_gio.text} có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(int.parse(_thunhap.text) >= 400000){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_gio.text} có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c59: int.parse(_gio.text),
                                                c60: int.parse(_thunhap.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c59: int.parse(_gio.text),
                                        c60: int.parse(_thunhap.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(int.parse(_thunhap.text) >= 400000){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} có P66 - Thu nhập của tất cả công việc = ${_gio.text} có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c59: int.parse(_gio.text),
                                      c60: int.parse(_thunhap.text),
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p65_66ViewModel.P65_66Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c59: int.parse(_gio.text),
                              c60: int.parse(_thunhap.text),
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
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}