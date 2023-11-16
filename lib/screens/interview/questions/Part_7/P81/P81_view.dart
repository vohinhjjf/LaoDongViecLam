import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P81_viewmodel.dart';

class P81View extends StatefulWidget {
  const P81View({Key? key}) : super(key: key);

  @override
  State<P81View> createState() => _P81ViewState();
}

class _P81ViewState extends State<P81View> {
  late P81ViewModel p81ViewModel;
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();
  int p81 = 0;

  var _thaydoi = [
    "Tăng lên",
    "Không thay đổi",
    "Giảm đi",
    "Không biết",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p81ViewModel = context.read();
      p81ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p81ViewModel.thanhvien;
              doisongho = p81ViewModel.doisongho;
              p81 = p81ViewModel.doisongho.c62_M6 ?? 0;
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
                //p81
                UIRichText(
                  text1: "P81. So với tháng trước, chi tiêu cho các mặt hàng lương "
                      "thực, thực phẩm của hộ ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " thay đổi như thế nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _thaydoi.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _thaydoi[index].toString(),
                      check: p81 == index+1,
                      onTap1: (value){
                        setState(() {
                          p81 = p81 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p81 = p81 == index+1 ? 0 : index+1;
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
              p81ViewModel.P81Back(doisongho);
            }),
            UINextButton(ontap: (){
              if(p81 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P81-Chi tiêu cho các mặt hàng nhập vào chưa đúng!',)
                );
              }
              else {
                p81ViewModel.P81Next(DoiSongHoModel(
                    idho: thanhvien.idho,
                    thangDT: thanhvien.thangDT,
                    namDT: thanhvien.namDT,
                    c62_M6: p81
                ));
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}