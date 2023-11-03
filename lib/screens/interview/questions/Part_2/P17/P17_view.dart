import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P17_viewmodel.dart';

class P17View extends StatefulWidget {
  const P17View({Key? key}) : super(key: key);

  @override
  State<P17View> createState() => _P17ViewState();
}

class _P17ViewState extends State<P17View> {
  late P17ViewModel p17ViewModel;
  final _formKey = GlobalKey<FormState>();
  final _nganh = TextEditingController();
  final _nam = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  bool check_draw = true;

  String trinhdo(){
    if (thanhvien.c14F == 1){
       return "Tiến sỹ";
    }else if (thanhvien.c14E == 1){
      return "Thạc sỹ";
    }else if (thanhvien.c14D == 1){
      return "Đại học";
    }else if (thanhvien.c14C == 1){
      return "Cao đẳng";
    }else if (thanhvien.c14B == 1){
      return "Trung cấp";
    }else if (thanhvien.c14A == 1){
      return "Sơ cấp/Giấy phép lái xe ô tô";
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p17ViewModel = context.read();
      p17ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p17ViewModel.thanhvien;
              _nganh.text = p17ViewModel.thanhvien.c15A ?? "";
              _nam.text = p17ViewModel.thanhvien.c15C != null ? p17ViewModel.thanhvien.c15C.toString(): "";
            })
          });
    });
  }

  Widget UIName(){
    return UIText(text: thanhvien.c00 ?? "", isBold: true,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //UIGPSButton()
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p08
                  UIRichText(
                    text1: "P17. Với trình độ học vấn cao nhất là ${trinhdo()}, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã được đào tạo chuyên ngành gì và năm tốt nghiệp ngành đó là năm nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: "- Ngành",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _nganh,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập tên ngành';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: "- Năm tốt nghiệp",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _nam,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập năm';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 4,
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle( color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  //Button
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p17ViewModel.P17Back();
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          if (int.parse(_nam.text) < 1956 ||
                              int.parse(_nam.text) > 2023) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} có năm tốt nghiệp chưa hợp lý!',)
                            );
                          }
                          /*else if (int.parse(_nam.text) >=
                                (2023 - thanhvien.c04!) &&
                                int.parse(_nam.text) <= 2023) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UIWarningDialog(
                                        waring: 'Thành viên ${thanhvien
                                            .c00} sinh năm ${2023 -
                                            thanhvien.c04!}, '
                                            'tốt nghiệp năm = ${_nam
                                            .text} khi ${thanhvien.c04! -
                                            (2023 - int.parse(_nam
                                                .text))} tuổi. Kiểm tra lại!',)
                              );
                            }*/
                          else if (int.parse(_nam.text) <
                              (2023 - thanhvien.c04!)) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    UIWarningDialog(
                                      waring: 'Thành viên ${thanhvien
                                          .c00} tốt nghiệp năm = ${_nam.text}'
                                          ' trước năm sinh ${2023 -
                                          thanhvien.c04!}. Kiểm tra lại!',)
                            );
                          }
                          else {
                            p17ViewModel.P17Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              //c15A: _nganh.text,
                              c15C: int.parse(_nam.text),
                            ));
                          }
                        }
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
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