import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_logic.dart';
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
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p69
                  UIRichText(
                    text1: "P69. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu "
                        "giờ để trồng trọt hoặc thu hoạch hoặc chăn nuôi gia súc, "
                        "gia cầm hoặc nuôi trồng, đánh bắt thủy hải sản hoặc săn "
                        "bắt, thu nhặt sản phẩm tự nhiên với mục đích chủ yếu là "
                        "để cho hộ gia đình mình sử dụng?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _gio,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 3,
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
              p69ViewModel.P69Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if(int.parse(_gio.text) >= 70){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} dành thời gian làm việc trong 1 tuần quá nhiều. Có đúng không?',
                        onpress: (){
                          Navigator.of(context).pop();
                          if(thanhvien.c24 == 2 && int.parse(_gio.text) >= 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      'trong 7 ngày qua không làm công việc gì trong ngành trồng trọt/chăn nuôi, thủy sản hay lâm nghiệp (C26 = 2) nhưng lại có số giờ làm việc trong những ngành này. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c59 != null && thanhvien.c59! + int.parse(_gio.text) >= 90){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                'trong 7 ngày qua có tổng số giờ làm việc quá nhiều (C66 + C69). Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p69ViewModel.P69Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c63: int.parse(_gio.text)
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p69ViewModel.P69Next(thongTinThanhVienModel(
                                          idho: thanhvien.idho,
                                          idtv: thanhvien.idtv,
                                          c63: int.parse(_gio.text)
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c59 != null && thanhvien.c59! + int.parse(_gio.text) >= 90){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      'trong 7 ngày qua có tổng số giờ làm việc quá nhiều (C66 + C69). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p69ViewModel.P69Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c63: int.parse(_gio.text)
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p69ViewModel.P69Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c63: int.parse(_gio.text)
                            ));
                          }
                        },
                      )
                  );
                }
                else if(thanhvien.c24 == 2 && int.parse(_gio.text) >= 1){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            'trong 7 ngày qua không làm công việc gì trong ngành trồng trọt/chăn nuôi, thủy sản hay lâm nghiệp (C26 = 2) nhưng lại có số giờ làm việc trong những ngành này. Có đúng không?',
                        onpress: (){
                          Navigator.of(context).pop();
                          if(thanhvien.c59 != null && thanhvien.c59! + int.parse(_gio.text) >= 90){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      'trong 7 ngày qua có tổng số giờ làm việc quá nhiều (C66 + C69). Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p69ViewModel.P69Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c63: int.parse(_gio.text)
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p69ViewModel.P69Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c63: int.parse(_gio.text)
                            ));
                          }
                        },
                      )
                  );
                }
                else if(thanhvien.c59 != null && thanhvien.c59! + int.parse(_gio.text) >= 90){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            'trong 7 ngày qua có tổng số giờ làm việc quá nhiều (C66 + C69). Có đúng không?',
                        onpress: (){
                          Navigator.of(context).pop();
                          p69ViewModel.P69Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c63: int.parse(_gio.text)
                          ));
                        },
                      )
                  );
                }
                else {
                  p69ViewModel.P69Next(thongTinThanhVienModel(
                      idho: thanhvien.idho,
                      idtv: thanhvien.idtv,
                      c63: int.parse(_gio.text)
                  ));
                }
              }
            }),
          ],
        ),
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