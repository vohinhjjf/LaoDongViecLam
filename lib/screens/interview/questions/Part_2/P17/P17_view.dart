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
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
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
                          '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                ],
              ),
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
                          p17ViewModel.P17Back();
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
                                c15A: _nganh.text,
                                c15C: int.parse(_nam.text),
                              ));
                            }
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
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}