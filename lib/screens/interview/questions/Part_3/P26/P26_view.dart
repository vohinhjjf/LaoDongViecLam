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
import 'P26_viewmodel.dart';

class P26View extends StatefulWidget {
  const P26View({Key? key}) : super(key: key);

  @override
  State<P26View> createState() => _P26ViewState();
}

class _P26ViewState extends State<P26View> {
  late P26ViewModel p26ViewModel;
  int p26 =0;
  var thanhvien = thongTinThanhVienModel();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p26ViewModel = context.read();
      p26ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p26ViewModel.thanhvien;
              p26 = p26ViewModel.thanhvien.c24 ?? 0;
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
                //p26
                UIRichText(
                  text1: "P26. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có làm công việc gì trong ngành trồng trọt/chăn nuôi, "
                      "thủy sản hay lâm nghiệp không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p26 == 1,
                  onTap1: (value){
                    setState(() {
                      p26 = p26 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p26 = p26 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p26 == 2,
                  onTap1: (value){
                    setState(() {
                      p26 = p26 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p26 = p26 == 2 ? 0 : 2;
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
              p26ViewModel.P26Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(p26 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P26 - Có làm việc trong ngành trồng trọt/chăn nuôi/thủy sản hay lâm nghiệp nhập vào chưa đúng!',)
                );
              }else {
                p26ViewModel.P26Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c24: p26,
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