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
import 'P76_77_viewmodel.dart';

class P76_77View extends StatefulWidget {
  const P76_77View({Key? key}) : super(key: key);

  @override
  State<P76_77View> createState() => _P76_77ViewState();
}

class _P76_77ViewState extends State<P76_77View> {
  late P76_77ViewModel p76_77ViewModel;
  var doisongho = DoiSongHoModel();
  var thanhvien = thongTinThanhVienModel();
  int p76 = 0, p77 = 0;

  final _doisong = [
    "Cải thiện hơn",
    "Như cũ",
    "Giảm sút",
    "Không biết",
  ];

  final _thunhap = [
    "Tăng lên",
    "Không thay đổi",
    "Giảm đi",
    "Không biết",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p76_77ViewModel = context.read();
      p76_77ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p76_77ViewModel.thanhvien;
              doisongho = p76_77ViewModel.doisongho;
              p76 = p76_77ViewModel.doisongho.c62_M1 ?? 0;
              p77 = p76_77ViewModel.doisongho.c62_M2 ?? 0;
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
                //p76
                UIRichText(
                  text1: "P76. So với tháng trước, đời sống gia đình hiện nay của hộ ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có được cải thiện hơn không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _doisong.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _doisong[index].toString(),
                      check: p76 == index+1,
                      onTap1: (value){
                        setState(() {
                          p76 = p76 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p76 = p76 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                //p77
                UIRichText(
                  text1: "P77. So với tháng trước, thu nhập hiện nay của hộ ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " thay đổi như thế nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _thunhap.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _thunhap[index].toString(),
                      check: p77 == index+1,
                      onTap1: (value){
                        setState(() {
                          p77 = p77 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p77 = p77 == index+1 ? 0 : index+1;
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
              p76_77ViewModel.P76_77Back();
            }),
            UINextButton(ontap: (){
              if(p76 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P76-Đời sống gia đình nhập vào chưa đúng!',)
                );
              }
              else if(p77 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P77-Thu nhập hiện nay nhập vào chưa đúng!',)
                );
              }
              else if((p76 == 1 && p77 == 3) || (p76 == 3 && p77 == 1)){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Đời sống gia đình ${(p76 == 1 && p77 == 3) ? "được cải thiện":"giảm sút"} mà thu nhập ${(p76 == 1 && p77 == 3) ? "giảm sút":"tăng lên"}. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        p76_77ViewModel.P76_77Next(DoiSongHoModel(
                          idho: thanhvien.idho,
                          thangDT: thanhvien.thangDT,
                          namDT: thanhvien.namDT,
                          c62_M1: p76,
                          c62_M2: p77,
                        ));
                      },
                    )
                );
              }
              else {
                p76_77ViewModel.P76_77Next(DoiSongHoModel(
                  idho: thanhvien.idho,
                  thangDT: thanhvien.thangDT,
                  namDT: thanhvien.namDT,
                  c62_M1: p76,
                  c62_M2: p77,
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