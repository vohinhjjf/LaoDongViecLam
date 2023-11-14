import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
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
                  //p08
                  UIRichText(
                    text1: "P17. Với trình độ học vấn cao nhất là ${trinhdo()}, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã được đào tạo chuyên ngành gì và năm tốt nghiệp ngành đó là năm nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: "- Ngành",
                    textColor: Colors.black,
                    isBold: true,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 5,),
                  UITextFormField(
                    controller: _nganh,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Tên ngành chưa được nhập';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: "- Năm tốt nghiệp",
                    textColor: Colors.black,
                    isBold: true,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 5,),
                  UITextFormField(
                    controller: _nam,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Năm TN chưa được nhập';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 4,
                    keyboardType: TextInputType.datetime,
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
              p17ViewModel.P17Back();
            }),
            UINextButton(ontap: (){
              int namHT = DateTime.now().year;
              if(_formKey.currentState!.validate()) {
                if (int.parse(_nam.text) < 1957 ||
                    int.parse(_nam.text) > namHT) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: 'Thành viên ${thanhvien
                                .c00} có năm tốt nghiệp chưa hợp lý!',
                          )
                  );
                }
                else if(_nganh.text.length < 5){
                  showDialog(
                      context: context,
                      builder: (_) =>
                      const UIWarningDialog(
                        waring: 'Mô tả quá ngắn!',
                      )
                  );
                }
                else if (thanhvien.c03B != "9998" && int.parse(_nam.text) <
                    int.parse(thanhvien.c03B!)) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: 'Thành viên ${thanhvien
                                .c00} có P17C - Năm tốt nghiệp = ${_nam.text}'
                                ' trước năm sinh = ${thanhvien.c03B}. Kiểm tra lại!',)
                  );
                }
                else if (thanhvien.c03B == "9998" && int.parse(_nam.text) <
                    (namHT - thanhvien.c04!)) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: 'Thành viên ${thanhvien
                                .c00} có tuổi tốt nghiệp tính được = ${int.parse(_nam.text) - (namHT - thanhvien.c04!)}'
                                ' > tuổi hiện tại = ${thanhvien.c04}. Kiểm tra lại!',)
                  );
                }
                else if (thanhvien.c03B != "9998" && int.parse(_nam.text) -
                    int.parse(thanhvien.c03B!) < 10) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: 'Thành viên ${thanhvien
                                .c00} sinh năm ${thanhvien.c03B}, tốt nghiệp năm = ${_nam.text}'
                                ' khi tuổi ${int.parse(_nam.text) - int.parse(thanhvien.c03B!)} tuổi. Kiểm tra lại!',)
                  );
                }
                else if (thanhvien.c03B == "9998" && int.parse(_nam.text) -
                    (namHT - thanhvien.c04!) < 10) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UIWarningDialog(
                            waring: 'Thành viên ${thanhvien
                                .c00} có tuổi tốt nghiệp tính được = ${int.parse(_nam.text) -
                                (namHT - thanhvien.c04!)}. Kiểm tra lại!',)
                  );
                }
                else if (thanhvien.c03B != "9998" && int.parse(_nam.text) -
                    int.parse(thanhvien.c03B!) > 60) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: 'Thành viên ${thanhvien
                                .c00} sinh năm ${thanhvien.c03B}, tốt nghiệp năm = ${_nam.text}'
                                ' khi tuổi ${int.parse(_nam.text) - int.parse(thanhvien.c03B!)} tuổi. Có đúng không?',
                            onpress: () {
                              Navigator.of(context).pop();
                              if (thanhvien.c03B == "9998" && int.parse(_nam.text) -
                                  (namHT - thanhvien.c04!) > 10) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        UINotificationDialog(
                                          notification: 'Thành viên ${thanhvien
                                              .c00} có tuổi tốt nghiệp tính được = ${int.parse(_nam.text) -
                                              (namHT - thanhvien.c04!)}. Có đúng không?',
                                          onpress: () {
                                            p17ViewModel.P17Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c15A: _nganh.text,
                                              c15C: int.parse(_nam.text),
                                            ));
                                          },)
                                );
                              }
                              else {
                                p17ViewModel.P17Next(thongTinThanhVienModel(
                                  idho: thanhvien.idho,
                                  idtv: thanhvien.idtv,
                                  c15A: _nganh.text,
                                  c15C: int.parse(_nam.text),
                                ));
                              }
                            },)
                  );
                }
                else if (thanhvien.c03B == "9998" && int.parse(_nam.text) -
                    (namHT - thanhvien.c04!) > 10) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          UINotificationDialog(
                            notification: 'Thành viên ${thanhvien
                                .c00} có tuổi tốt nghiệp tính được = ${int.parse(_nam.text) -
                                (namHT - thanhvien.c04!)}. Có đúng không?',
                            onpress: () {
                              p17ViewModel.P17Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c15A: _nganh.text,
                                c15C: int.parse(_nam.text),
                              ));
                            },)
                  );
                }
                else {
                  p17ViewModel.P17Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c15A: _nganh.text,
                    c15C: int.parse(_nam.text),
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