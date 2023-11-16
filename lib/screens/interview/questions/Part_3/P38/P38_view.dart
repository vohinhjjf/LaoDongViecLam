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
import 'P38_viewmodel.dart';

class P38View extends StatefulWidget {
  const P38View({Key? key}) : super(key: key);

  @override
  State<P38View> createState() => _P38ViewState();
}

class _P38ViewState extends State<P38View> {
  late P38ViewModel p38ViewModel;
  var thanhvien = thongTinThanhVienModel();
  final _orther = TextEditingController();
  int p38 =0;
  bool check_draw = true;

  var _lydo = [
    "ĐI HỌC/ĐÀO TẠO",
    "LÀM VIỆC NHÀ, VIỆC GIA ĐÌNH",
    "ỐM ĐAU/MẤT KHẢ NĂNG LAO ĐỘNG",
    "LÀM NÔNG NGHIỆP/ THỦY SẢN CHỦ YẾU CHO GIA ĐÌNH SỬ DỤNG",
    "NGHỈ HƯU",
    "KHÁC (GHI CỤ THẾ)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p38ViewModel = context.read();
      p38ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p38ViewModel.thanhvien;
              p38 = p38ViewModel.thanhvien.c33A ?? 0;
              _orther.text = p38ViewModel.thanhvien.c33AK ?? "";
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
                //p38
                UIRichText(
                  text1: "P38. Lý do chính mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " không làm việc là gì?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _lydo.length,
                  itemBuilder: (context, index) {
                    return UIListTile(
                      text: _lydo[index].toString(),
                      check: p38 == index+1,
                      onTap1: (value){
                        setState(() {
                          p38 = p38 == index+1 ? 0 : index+1;
                        });
                      },
                      onTap2: (){
                        setState(() {
                          p38 = p38 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                Visibility(
                  visible: p38 == 6 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const UIText(
                        text: "Lý do khác",
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      const SizedBox(height: 5,),
                      UITextFormField(
                        autofocus: true,
                        controller: _orther,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Vui lòng nhập lý do';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                          FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                        ],
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
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
              p38ViewModel.P38Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(p38 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P38 - Lý do không làm việc nhập vào chưa đúng!',)
                );
              }
              else {
                p38ViewModel.P38Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c33A: p38,
                  c33AK: _orther.text,
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