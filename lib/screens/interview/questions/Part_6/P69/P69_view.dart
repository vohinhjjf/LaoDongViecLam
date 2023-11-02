import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P69_viewmodel.dart';

class P69View extends StatefulWidget {
  const P69View({Key? key}) : super(key: key);

  @override
  State<P69View> createState() => _P69ViewState();
}

class _P69ViewState extends State<P69View> {
  late P69ViewModel p69ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _gio = TextEditingController();
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p69ViewModel = context.read();
      p69ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p69ViewModel.thanhvien;
              _gio.text = p69ViewModel.thanhvien.c63 == null ? "" : p69ViewModel.thanhvien.c63.toString();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p69
                  UIRichText(
                    text1: "P69. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu "
                        "giờ để trồng trọt hoặc thu hoạch hoặc chăn nuôi gia súc, "
                        "gia cầm hoặc nuôi trồng, đánh bắt thủy hải sản hoặc săn "
                        "bắt, thu nhặt sản phẩm tự nhiên với mục đích chủ yếu là "
                        "để cho hộ gia đình mình sử dụng? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _gio,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
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
                        p69ViewModel.P69Back(thanhvien);
                      }),
                      UINextButton(ontap: (){
                        if(_formKey.currentState!.validate()) {
                          p69ViewModel.P69Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c63: int.parse(_gio.text)
                          ));
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
            canvasColor: Colors.transparent,
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(onTap: (){
                check_draw = false;
          },)
              : const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}