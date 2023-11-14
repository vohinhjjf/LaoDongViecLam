import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/base/base_logic.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import '../../../../../components/uis.dart';
import 'P05_viewmodel.dart';

class P05View extends StatefulWidget {
  const P05View({Key? key}) : super(key: key);

  @override
  State<P05View> createState() => _P05ViewState();
}

class _P05ViewState extends State<P05View> {
  late P05ViewModel p05viewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  int groupValue = 0;
  bool check_draw = true;

   String moiquanhe(){
    String _mqh = "";
    switch (thanhvien.c01){
      case 3: _mqh ="CON ĐẺ";break;
      case 4: _mqh ="CHÁU NỘI/NGOẠI";break;
      case 5: _mqh ="BỐ/MẸ";break;
      case 6: _mqh ="QUAN HỆ GIA ĐÌNH KHÁC";break;
      case 7: _mqh ="NGƯỜI GIÚP VIỆC";break;
      case 8: _mqh = thanhvien.c01K!;break;
    }
    return _mqh;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p05viewModel = context.read();
      p05viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p05viewModel.thanhvien;
              groupValue = p05viewModel.thanhvien.c04A ?? 0;
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
                //p05
                UIRichText(
                  text1: "P05. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có con dưới 3 tuổi sống cùng hộ không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "Có",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 1 ? 0 : 1;
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
                      groupValue = groupValue == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Không",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 2 ? 0 : 2;
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
                      groupValue = groupValue == 2 ? 0 : 2;
                    });
                  },
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
              p05viewModel.P05Back();
            }),
            UINextButton(ontap: (){
              if(groupValue == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P05-Có con dưới 3 tuổi nhập vào chưa đúng!',)
                );
              }
              else if(groupValue == 1 && thanhvien.c01 == 1 && (thanhvien.c04! < 18 || thanhvien.c04! > 65)){
                showDialog(
                    context: context,
                    builder: (_) =>  UINotificationDialog(
                      notification: 'Chủ hộ có tuổi dưới 15 mà có con 3 tuổi sống cùng hộ. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(thanhvien.c01! >= 3 && groupValue == 1){
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (_) =>  UINotificationDialog(
                                notification: 'Mối quan hệ chủ hộ là ${moiquanhe()} '
                                    'mà có con dưới 3 tuổi sống cùng hộ. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  p05viewModel.P05Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c04A: groupValue
                                  ));
                                },
                              )
                          );
                        }else {
                          p05viewModel.P05Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c04A: groupValue
                          ));
                        }
                      },
                    )
                );
              }
              else if(thanhvien.c01! >= 3 && groupValue == 1){
                showDialog(
                    context: context,
                    builder: (_) =>  UINotificationDialog(
                      notification: 'Mối quan hệ chủ hộ là ${moiquanhe()} '
                          'mà có con dưới 3 tuổi sống cùng hộ. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        p05viewModel.P05Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c04A: groupValue
                        ));
                      },
                    )
                );
              }
              else {
                p05viewModel.P05Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c04A: groupValue
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
}