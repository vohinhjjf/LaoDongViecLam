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
import 'P36_37_viewmodel.dart';

class P36_37View extends StatefulWidget {
  const P36_37View({Key? key}) : super(key: key);

  @override
  State<P36_37View> createState() => _P36_37ViewState();
}

class _P36_37ViewState extends State<P36_37View> {
  late P36_37ViewModel p36_37ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p36 = 0, p37 = 0;
  bool check_draw = true;

  var _thoigian = [
    "DƯỚI 1 THÁNG",
    "1 ĐẾN DƯỚI 3 THÁNG",
    "3 ĐẾN DƯỚI 6 THÁNG",
    "6 ĐẾN DƯỚI 12 THÁNG",
    "1 NĂM ĐẾN DƯỚI 2 NĂM",
    "2 NĂM TRỞ LÊN",
  ];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p36_37ViewModel = context.read();
      p36_37ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p36_37ViewModel.thanhvien;
              p36 = p36_37ViewModel.thanhvien.c32 ?? 0;
              p37 = p36_37ViewModel.thanhvien.c33 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p36
                UIRichText(
                  text1: "P36. Nếu có một công việc, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có sẵn sàng làm việc trong vòng 2 tuần tới không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "Có",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p36 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p36 = p36 == 1 ? 0 : 1;
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
                      p36 = p36 == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Không",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p36 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p36 = p36 == 2 ? 0 : 2;
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
                      p36 = p36 == 2 ? 0 : 2;
                    });
                  },
                ),
                //p37
                Visibility(
                    visible: p36 == 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        UIRichText(
                          text1: "P37. Khoảng thời gian ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " không có việc làm và tìm kiếm việc làm hoặc "
                              "chuẩn bị hoạt động sản xuất kinh doanh là bao lâu?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _thoigian.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: UIText(
                                text: _thoigian[index].toString(),
                                textColor: Colors.black,
                                textFontSize: fontLarge,
                                textAlign: TextAlign.start,
                                isBold: false,
                              ),
                              leading: RoundCheckBox(
                                isChecked: p37 == index + 1 ? true : false,
                                onTap: (selected) {
                                  setState(() {
                                    p37 = p37 == index + 1 ? 0 : index + 1;
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
                                  p37 = p37 == index + 1 ? 0 : index + 1;
                                });
                              },
                            );
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
              p36_37ViewModel.P36_37Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(p36 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P36 - Quyết định sẵn sàng làm việc trong vòng 2 tuần tới nhập vào chưa đúng!',)
                );
              } else if(p36 == 1 && p37 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P37 - Khoảng thời gian không có việc làm và tìm kiếm việc làm hoặc chuẩn bị hoạt động SXKD nhập vào chưa đúng!',)
                );
              }
              else {
                p36_37ViewModel.P36_37Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c32: p36,
                  c33: p37,
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