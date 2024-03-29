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
import 'P47_viewmodel.dart';

class P47View extends StatefulWidget {
  const P47View({Key? key}) : super(key: key);

  @override
  State<P47View> createState() => _P47ViewState();
}

class _P47ViewState extends State<P47View> {
  late P47ViewModel p47ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p47 = 0;
  bool check_draw = true;

  var _khoangtien = [
    "Không có thu nhập",
    "Dưới 1 triệu",
    "Từ 1 triệu đến dưới 10 triệu",
    "Từ 10 triệu đến dưới 20 triệu",
    "Từ 20 triệu đến dưới 50 triệu",
    "Từ 50 triệu đến dưới 100 triệu",
    "Từ 100 triệu trở lên",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p47ViewModel = context.read();
      p47ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p47ViewModel.thanhvien;
              p47 = p47ViewModel.thanhvien.c41 ?? 0;
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
                //p47
                UIRichText(
                  text1: "P47. Tháng trước, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " nhận được khoảng bao nhiêu tiền công/tiền lương hoặc "
                      "lợi nhuận từ công việc này? Tiền công/tiền lương bao gồm "
                      "tiền làm thêm giờ, tiền thưởng, tiền"
                      " phụ cấp nghề và tiền phúc lợi khác?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _khoangtien.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _khoangtien[index].toString(),
                      check: p47 == index+1,
                      onTap1: (value){
                        setState(() {
                          p47 = p47 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p47 = p47 == index+1 ? 0 : index+1;
                        });
                      },
                    );
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
              p47ViewModel.P47Back();
            }),
            UINextButton(ontap: (){
              if(p47 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P47-Khoảng mức tiền công/lương/lợi nhuận nhận được từ CV chính nhập vào chưa đúng!',)
                );
              }
              else {
                p47ViewModel.P47Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c41: p47,
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