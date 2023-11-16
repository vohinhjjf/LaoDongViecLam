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
import 'P67_68_viewmodel.dart';

class P67_68View extends StatefulWidget {
  const P67_68View({Key? key}) : super(key: key);

  @override
  State<P67_68View> createState() => _P67_68ViewState();
}

class _P67_68ViewState extends State<P67_68View> {
  late P67_68ViewModel p67_68ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p67 =0, p68 =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p67_68ViewModel = context.read();
      p67_68ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p67_68ViewModel.thanhvien;
              p67 = p67_68ViewModel.thanhvien.c61 ?? 0;
              p68 = p67_68ViewModel.thanhvien.c62 ?? 0;
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
                //p67
                UIRichText(
                  text1: "P67. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có muốn làm thêm giờ không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p67 == 1,
                  onTap1: (value){
                    setState(() {
                      p67 = p67 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p67 = p67 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p67 == 2,
                  onTap1: (value){
                    setState(() {
                      p67 = p67 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p67 = p67 == 2 ? 0 : 2;
                    });
                  },
                ),
                //p68
                Visibility(
                  visible: p67 == 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        UIRichText(
                          text1: "P68. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có thể bắt đầu làm thêm giờ trong vòng 2 tuần tới không?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        UIListTile(
                          text: "Có",
                          check: p68 == 1,
                          onTap1: (value){
                            setState(() {
                              p68 = p68 == 1 ? 0 : 1;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p68 = p68 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        UIListTile(
                          text: "Không",
                          check: p68 == 2,
                          onTap1: (value){
                            setState(() {
                              p68 = p68 == 2 ? 0 : 2;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p68 = p68 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
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
              p67_68ViewModel.P67_68Back();
            }),
            UINextButton(ontap: (){
              if(p67 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P67 - Có muốn làm thêm giờ nhập vào chưa đúng!',)
                );
              }
              else if(p67 != 2 && p68 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P68 - Có thể bắt đầu làm thêm trong vòng 2 tuần tới nhập vào chưa đúng!',)
                );
              }
              else if(p67 == 1  && thanhvien.c59! >= 64){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có Tổng số giờ làm việc quá cao trên 64 giờ mà vẫn muốn làm thêm giờ. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        p67_68ViewModel.P67_68Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c61: p67,
                          c62: p67 == 2 ? null : p68,
                        ));
                      },
                    )
                );
              }
              else {
                if(p67 == 1) {
                  p67_68ViewModel.P67_68Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c61: p67,
                    c62: p68,
                  ));
                } else {
                  p67_68ViewModel.P67_68Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c61: p67,
                  ));
                }
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
}