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
import 'P61_62_viewmodel.dart';

class P61_62View extends StatefulWidget {
  const P61_62View({Key? key}) : super(key: key);

  @override
  State<P61_62View> createState() => _P61_62ViewState();
}

class _P61_62ViewState extends State<P61_62View> {
  late P61_62ViewModel p61_62ViewModel;
  final _formKey = GlobalKey<FormState>();
  final _tiencong = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p62 =0;
  bool check = false, check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p61_62ViewModel = context.read();
      p61_62ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p61_62ViewModel.thanhvien;
              p62 = p61_62ViewModel.thanhvien.c56 ?? 0;
              if(thanhvien.c41 == 1){
                check = true;
                _tiencong.text = "0";
              }else {
                _tiencong.text = p61_62ViewModel.thanhvien.c55 == null ? "" : p61_62ViewModel.thanhvien.c55.toString();
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p61
                  UIRichText(
                    text1: "P61. Cụ thể, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " nhận được bao nhiêu tiền cho công việc này? "
                        "\n(ĐƠN VỊ TÍNH: NGHÌN ĐỒNG)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _tiencong,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số tiền';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 6,
                    readOnly: check,
                    keyboardType: TextInputType.datetime,
                  ),
                  //p62
                  const SizedBox(height: 10,),
                  UIRichText(
                    text1: "P62. Ngoài hai công việc trên, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " có làm công việc nào khác nữa không? (Không bao "
                        "gồm các công việc tạo ra sản phẩm với mục đích chủ yếu "
                        "để gia đình mình sử dụng)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    title: const UIText(
                      text: "Có",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p62 == 1 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p62 = p62 == 1 ? 0 : 1;
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
                        p62 = p62 == 1 ? 0 : 1;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: "Không",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p62 == 2 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p62 = p62 == 2 ? 0 : 2;
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
                        p62 = p62 == 2 ? 0 : 2;
                      });
                    },
                  ),
                  //Button
                  const SizedBox(height: 90,),
                ],
              ),
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
              p61_62ViewModel.P61_62Back();
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if (p62 == 0) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                      const UIWarningDialog(
                        waring: 'P62-Công việc khác nhập vào chưa đúng!',)
                  );
                }
                else if (int.parse(_tiencong.text) < 100) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                .c00} có thu nhập dưới 100 nghìn đồng/tháng. Có đúng không?',
                            onpress: () {
                              Navigator.of(context).pop();
                              p61_62ViewModel.P61_62Next(
                                  thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c55: int.parse(_tiencong.text),
                                    c56: p62,
                                  ));
                            },
                          )
                  );
                }
                else {
                  p61_62ViewModel.P61_62Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c55: int.parse(_tiencong.text),
                    c56: p62,
                  ));
                }
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