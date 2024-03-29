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
import 'P60_viewmodel.dart';

class P60View extends StatefulWidget {
  const P60View({Key? key}) : super(key: key);

  @override
  State<P60View> createState() => _P60ViewState();
}

class _P60ViewState extends State<P60View> {
  late P60ViewModel p60ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p60 = 0;
  bool check_draw = true;

  final _khoangtien = [
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
      p60ViewModel = context.read();
      p60ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p60ViewModel.thanhvien;
              p60 = p60ViewModel.thanhvien.c54 ?? 0;
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
                //p60
                UIRichText(
                  text1: "P60. Tháng trước, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " nhận được khoảng bao nhiêu tiền"
                      " công/tiền lương hoặc lợi nhuận từ công việc này? Tiền công"
                      "/tiền lương bao gồm tiền làm thêm giờ, tiền thưởng, tiền"
                      " phụ cấp nghề và tiền phúc lợi khác?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _khoangtien.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _khoangtien[index].toString(),
                      check: p60 == index+1,
                      onTap1: (value){
                        setState(() {
                          p60 = p60 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p60 = p60 == index+1 ? 0 : index+1;
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
              p60ViewModel.P60Back();
            }),
            UINextButton(ontap: (){
              if(p60 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P60-Khoảng mức tiền công/lương/lợi nhuận nhận được từ CV thứ 2 nhập vào chưa đúng!',)
                );
              }
              else {
                p60ViewModel.P60Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c54: p60
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