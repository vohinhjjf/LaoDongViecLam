import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
                //p47
                UIRichText(
                  text1: "P47. Tháng trước, ",
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
                  itemCount: _khoangtien.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _khoangtien[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p47 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p47 = p47 == index+1 ? 0 : index+1;
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
                          p47 = p47 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
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
                          p47ViewModel.P47Back();
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
                          if(p47 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'P47 - Khoảng mức tiền công/lương/lợi nhuận nhận được từ CV chính nhập vào chưa đúng!',)
                            );
                          }
                          else {
                            p47ViewModel.P47Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c41: p47,
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
          child:  DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}