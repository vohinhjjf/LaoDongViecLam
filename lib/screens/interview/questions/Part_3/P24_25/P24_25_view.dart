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
import 'P24_25_viewmodel.dart';

class P24_25View extends StatefulWidget {
  const P24_25View({Key? key}) : super(key: key);

  @override
  State<P24_25View> createState() => _P24_25ViewState();
}

class _P24_25ViewState extends State<P24_25View> {
  late P24_25ViewModel p24_25ViewModel;
  int p23 = 0, p24 = 0, p25 =0;
  var thanhvien = thongTinThanhVienModel();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p24_25ViewModel = context.read();
      p24_25ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p24_25ViewModel.thanhvien;
              p23 = p24_25ViewModel.thanhvien.c21 ?? 0;
              p24 = p24_25ViewModel.thanhvien.c22 ?? 0;
              p25 = p24_25ViewModel.thanhvien.c23 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p24
                UIRichText(
                  text1: "P24. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: p23 == 6
                      ? " có chắc chắn sẽ quay lại làm công việc đang"
                      " tạm nghỉ trong vòng 30 ngày sau khi kết thúc kì nghỉ thai sản không?"
                      : " có chắc chắn sẽ quay lại làm công việc đang"
                      " tạm nghỉ trong vòng 30 ngày tới không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p24 == 1,
                  onTap1: (value){
                    setState(() {
                      p24 = p24 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p24 = p24 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p24 == 2,
                  onTap1: (value){
                    setState(() {
                      p24 = p24 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p24 = p24 == 2 ? 0 : 2;
                    });
                  },
                ),
                //p25
                Visibility(
                    visible: p24 == 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        UIRichText(
                          text1: "P25. Trong thời gian tạm nghỉ, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có được nhận tiền công/tiền lương hoặc hưởng "
                              "lợi từ công việc đó không?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        UIListTile(
                          text: "Có",
                          check: p25 == 1,
                          onTap1: (value){
                            setState(() {
                              p25 = p25 == 1 ? 0 : 1;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p25 = p25 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        UIListTile(
                          text: "Không",
                          check: p25 == 2,
                          onTap1: (value){
                            setState(() {
                              p25 = p25 == 2 ? 0 : 2;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p25 = p25 == 2 ? 0 : 2;
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
              p24_25ViewModel.P24_25Back();
            }),
            UINextButton(ontap: (){
              if(p24 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P24-Quay lại công việc trong 30 ngày nhập vào chưa đúng!',)
                );
              }
              else if(p25 == 0 && p24 == 2){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P25-Có thu nhập trong thời gian tạm nghỉ nhập vào chưa đúng!',)
                );
              }else {
                p24_25ViewModel.P24_25Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c22: p24,
                  c23: p24 == 2 ? p25 : null,
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