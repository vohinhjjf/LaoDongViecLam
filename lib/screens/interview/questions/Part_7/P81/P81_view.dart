import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
    "TĂNG LÊN",
    "KHÔNG THAY ĐỔI",
    "GIẢM ĐI",
    "KHÔNG BIẾT",
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
                //p81
                UIRichText(
                  text1: "P81.  So với tháng trước, chi tiêu cho các mặt hàng lương "
                      "thực, thực phẩm của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " thay đổi như thế nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _thaydoi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thaydoi[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p81 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p81 = p81 == index+1 ? 0 : index+1;
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
                          p81 = p81 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                //Button
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p81ViewModel.P81Back(doisongho);
                    }),
                    UINextButton(ontap: (){
                      if(p81 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P81 - Chi tiêu cho các mặt hàng nhập vào chưa đúng!',)
                        );
                      }
                      else {
                        p81ViewModel.P81Next(DoiSongHoModel(
                            idho: thanhvien.idho,
                            c62_M6: p81
                        ));
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
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