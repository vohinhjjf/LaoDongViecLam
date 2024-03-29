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
import 'P27_viewmodel.dart';

class P27View extends StatefulWidget {
  const P27View({Key? key}) : super(key: key);

  @override
  State<P27View> createState() => _P27ViewState();
}

class _P27ViewState extends State<P27View> {
  late P27ViewModel p27ViewModel;
  var thanhvien = thongTinThanhVienModel();
  var _tt = "đang tạm nghỉ";
  int p20 =0,p21 =0,p27 =0;
  bool check_draw = true;

  final _nganh = [
    "Trồng trọt/chăn nuôi",
    "Thủy sản",
    "Lâm nghiệp",
    "Khác",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p27ViewModel = context.read();
      p27ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p27ViewModel.thanhvien;
              p20 = p27ViewModel.thanhvien.c18 ?? 0;
              p21 = p27ViewModel.thanhvien.c19 ?? 0;
              p27 = p27ViewModel.thanhvien.c25 ?? 0;
              if(p20 ==1 || p21 == 1){
                _tt = "đang làm";
              }
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
                //p27
                UIRichText(
                  text1: "P27. Công việc mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " $_tt thuộc ngành trồng trọt/chăn nuôi,"
                      " thủy sản, lâm nghiệp hay ngành khác?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _nganh.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _nganh[index].toString(),
                      check: p27 == index+1,
                      onTap1: (value){
                        setState(() {
                          p27 = p27 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p27 = p27 == index+1 ? 0 : index+1;
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
              p27ViewModel.P27Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(p27 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P27-Công việc thuộc ngành trồng trọt/chăn nuôi/thủy sản hay lâm nghiệp nhập vào chưa đúng!',)
                );
              }else {
                p27ViewModel.P27Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c25: p27,
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