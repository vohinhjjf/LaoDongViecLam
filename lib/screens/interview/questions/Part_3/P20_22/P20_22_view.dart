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
import 'P20_22_viewmodel.dart';

class P20_22View extends StatefulWidget {
  const P20_22View({Key? key}) : super(key: key);

  @override
  State<P20_22View> createState() => _P20_22ViewState();
}

class _P20_22ViewState extends State<P20_22View> {
  late P20_22ViewModel p20_22ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p20 = 0, p21 =0, p22 =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p20_22ViewModel = context.read();
      p20_22ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p20_22ViewModel.thanhvien;
              p20 = p20_22ViewModel.thanhvien.c18 ?? 0;
              p21 = p20_22ViewModel.thanhvien.c19 ?? 0;
              p22 = p20_22ViewModel.thanhvien.c20 ?? 0;
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
                //p20
                UIRichText(
                  text1: "P20. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có tham gia hoặc thực hiện"
                      " bất kỳ công việc sản xuất, kinh doanh từ 1 giờ trở lên "
                      "để tạo ra thu nhập không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p20 == 1,
                  onTap1: (value){
                    setState(() {
                      p20 = p20 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p20 = p20 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p20 == 2,
                  onTap1: (value){
                    setState(() {
                      p20 = p20 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p20 = p20 == 2 ? 0 : 2;
                    });
                  },
                ),
                Visibility(
                    visible: p20 == 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        UIRichText(
                          text1: "P21. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có giúp thành viên của hộ hoặc của gia đình "
                              "trong công việc họ được nhận tiền công/tiền lương "
                              "hoặc thu lợi nhuận thậm chí chỉ trong 1 giờ không?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        UIListTile(
                          text: "Có",
                          check: p21 == 1,
                          onTap1: (value){
                            setState(() {
                              p21 = p21 == 1 ? 0 : 1;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p21 = p21 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        UIListTile(
                          text: "Không",
                          check: p21 == 2,
                          onTap1: (value){
                            setState(() {
                              p21 = p21 == 2 ? 0 : 2;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p21 = p21 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
                Visibility(
                    visible: p20 == 2 && p21 == 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        UIRichText(
                          text1: "P22. Mặc dù không làm việc trong 7 ngày qua, nhưng"
                              " có phải ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " vẫn có công việc được trả công/trả"
                              " lương hoặc công việc sản xuất kinh doanh và dự định"
                              " sẽ quay trở lại làm công việc đó không?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        UIListTile(
                          text: "Có",
                          check: p22 == 1,
                          onTap1: (value){
                            setState(() {
                              p22 = p22 == 1 ? 0 : 1;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p22 = p22 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        UIListTile(
                          text: "Không",
                          check: p22 == 2,
                          onTap1: (value){
                            setState(() {
                              p22 = p22 == 2 ? 0 : 2;
                            });
                          },
                          onTap2: (){
                            setState(() {
                              p22 = p22 == 2 ? 0 : 2;
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
              p20_22ViewModel.P20_22Back();
            }),
            UINextButton(ontap: (){
              if(p20 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P20-Tham gia việc sản xuất kinh doanh từ 1 giờ trở lên nhập vào chưa đúng!',)
                );
              }
              else if(p20 == 2 && p21 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P21-Giúp thành viên của hộ gia đình trong công việc nhập vào chưa đúng!',)
                );
              }
              else if(p20 == 2 && p21 == 2 && p22 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P22-Không làm việc trong 7 ngày qua, việc vẫn trả được lương, trả công nhập vào chưa đúng!',)
                );
              }
              else if(p22 == 2){
                if(thanhvien.c02 == 1 && (thanhvien.c04! >= 22 && thanhvien.c04! <= 60)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là Nam, ${thanhvien.c04} tuổi đang không làm công việc gì để tạo thu nhập. Có đúng không?',
                        onpress: (){
                          p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c18: p20,
                            c19: p20 == 2 ? p21 : null,
                            c20: p20 == 2 && p21 == 2 ? p22 : null,
                          ));
                        },
                      )
                  );
                }
                else if(thanhvien.c02 == 2 && (thanhvien.c04! >= 22 && thanhvien.c04! <= 55)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là Nữ, ${thanhvien.c04} tuổi đang không làm công việc gì để tạo thu nhập. Có đúng không?',
                        onpress: (){
                          p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c18: p20,
                            c19: p20 == 2 ? p21 : null,
                            c20: p20 == 2 && p21 == 2 ? p22 : null,
                          ));
                        },
                      )
                  );
                }
                else {
                  p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c18: p20,
                    c19: p20 == 2 ? p21 : null,
                    c20: p20 == 2 && p21 == 2 ? p22 : null,
                  ));
                }
              }
              else {
                p20_22ViewModel.P20_22Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c18: p20,
                  c19: p20 == 2 ? p21 : null,
                  c20: p20 == 2 && p21 == 2 ? p22 : null,
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