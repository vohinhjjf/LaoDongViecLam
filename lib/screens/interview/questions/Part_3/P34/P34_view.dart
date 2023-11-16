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
import 'P34_viewmodel.dart';

class P34View extends StatefulWidget {
  const P34View({Key? key}) : super(key: key);

  @override
  State<P34View> createState() => _P34ViewState();
}

class _P34ViewState extends State<P34View> {
  late P34ViewModel p34ViewModel;
  int p34 = 0;
  bool check_draw = true;
  var thanhvien = thongTinThanhVienModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p34ViewModel = context.read();
      p34ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p34ViewModel.thanhvien;
              p34 = p34ViewModel.thanhvien.c30A ?? 0;
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
                //p34
                UIRichText(
                  text1: "P34. Hiện tại, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thực sự cần một công việc để tạo ra thu nhập không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p34 == 1,
                  onTap1: (value){
                    setState(() {
                      p34 = p34 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p34 = p34 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p34 == 2,
                  onTap1: (value){
                    setState(() {
                      p34 = p34 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p34 = p34 == 2 ? 0 : 2;
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
              p34ViewModel.P34Back();
            }),
            UINextButton(ontap: (){
              if(p34 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P34 - Quyết định cần một công việc nhập vào chưa đúng!',)
                );
              }else {
                p34ViewModel.P34Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c30A: p34,
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