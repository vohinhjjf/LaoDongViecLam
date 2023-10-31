import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P63_64_viewmodel.dart';

class P63_64View extends StatefulWidget {
  const P63_64View({Key? key}) : super(key: key);

  @override
  State<P63_64View> createState() => _P63_64ViewState();
}

class _P63_64ViewState extends State<P63_64View> {
  late P63_64ViewModel p63_64ViewModel;
  final _formKey = GlobalKey<FormState>();
  var thanhvien = thongTinThanhVienModel();
  final _gio = TextEditingController();
  final _tiencong = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p63_64ViewModel = context.read();
      p63_64ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p63_64ViewModel.thanhvien;
              _gio.text = p63_64ViewModel.thanhvien.c57.toString();
              _tiencong.text = p63_64ViewModel.thanhvien.c58.toString();
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
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p63
                  UIRichText(
                    text1: "P63. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm các công việc khác này khoảng bao nhiêu giờ? (ĐƠN VỊ TÍNH: GIỜ)",
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  //p64
                  const SizedBox(height: 10,),
                  UIRichText(
                    text1: "P64. Tháng trước, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " nhận được bao nhiêu "
                        "tiền công/tiền lương hoặc lợi nhuận từ các công việc này? "
                        "Tiền công/tiền lương bao gồm tiền làm thêm giờ, tiền thưởng, "
                        "tiền phụ cấp nghề và tiền phúc lợi khác? (ĐƠN VỊ TÍNH: NGHÌN ĐỒNG)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _tiencong,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số tiền';
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
                          p63_64ViewModel.P63_64Back();
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
                            if (int.parse(_gio.text) > 84) {
                              showDialog(
                                  context: context,
                                  builder: (_) => UIWarningDialog(
                                    waring: 'Thành viên ${thanhvien
                                        .c00} có P63 - Số giờ cho công việc khác = ${_gio
                                        .text} quá lớn!',)
                              );
                            }
                            else if (int.parse(_tiencong.text) > 900000) {
                              showDialog(
                                  context: context,
                                  builder: (_) => UIWarningDialog(
                                    waring: 'Thành viên ${thanhvien
                                        .c00} có P64 - Thu nhập của công việc khác = ${_tiencong
                                        .text} quá lớn!',)
                              );
                            }
                            else if (int.parse(_gio.text) >= 64) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien
                                            .c00} có Số giờ cho công việc khác = ${_gio
                                            .text} có đúng không?',
                                        onpress: () {
                                          Navigator.of(context).pop();
                                          if (int.parse(_tiencong.text) >=
                                              400000) {
                                            showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien
                                                          .c00} có Thu nhập của công việc khác = ${_gio
                                                          .text} có đúng không?',
                                                      onpress: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        p63_64ViewModel
                                                            .P63_64Next(
                                                            thongTinThanhVienModel(
                                                              idho: thanhvien
                                                                  .idho,
                                                              idtv: thanhvien
                                                                  .idtv,
                                                              c57: int.parse(
                                                                  _gio.text),
                                                              c58: int.parse(
                                                                  _tiencong
                                                                      .text),
                                                            ));
                                                      },
                                                    )
                                            );
                                          }
                                          else {
                                            p63_64ViewModel.P63_64Next(
                                                thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c57: int.parse(_gio.text),
                                                  c58: int.parse(
                                                      _tiencong.text),
                                                ));
                                          }
                                        },
                                      )
                              );
                            }
                            else if (int.parse(_tiencong.text) >= 400000) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien
                                            .c00} có Thu nhập của công việc khác = ${_gio
                                            .text} có đúng không?',
                                        onpress: () {
                                          Navigator.of(context).pop();
                                          p63_64ViewModel.P63_64Next(
                                              thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c57: int.parse(_gio.text),
                                                c58: int.parse(_tiencong.text),
                                              ));
                                        },
                                      )
                              );
                            }
                            else {
                              p63_64ViewModel.P63_64Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c57: int.parse(_gio.text),
                                c58: int.parse(_tiencong.text),
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
          child:  DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}