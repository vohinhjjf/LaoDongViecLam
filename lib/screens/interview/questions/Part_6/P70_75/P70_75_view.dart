import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P70_75_viewmodel.dart';

class P70_75View extends StatefulWidget {
  const P70_75View({Key? key}) : super(key: key);

  @override
  State<P70_75View> createState() => _P70_75ViewState();
}

class _P70_75ViewState extends State<P70_75View> {
  late P70_75ViewModel p70_75viewModel;
  final _formKey = GlobalKey<FormState>();
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _dondep = TextEditingController();
  final _sanxuat = TextEditingController();
  final _suachua = TextEditingController();
  final _giupdo = TextEditingController();
  final _chamsoc = TextEditingController();
  int p70 =0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p70_75viewModel = context.read();
      p70_75viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p70_75viewModel.thanhvien;
              p70 = p70_75viewModel.thanhvien.c64 ?? 0;
              _dondep.text = p70_75viewModel.thanhvien.c65.toString();
              _sanxuat.text = p70_75viewModel.thanhvien.c66.toString();
              _suachua.text = p70_75viewModel.thanhvien.c67.toString();
              _giupdo.text = p70_75viewModel.thanhvien.c68.toString();
              _chamsoc.text = p70_75viewModel.thanhvien.c69.toString();
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
                  //P70
                  Visibility(
                      visible: thanhvien.c69 != 0,
                      child: Column(
                        children: [
                          UIRichText(
                            text1: "P70. Với công việc trên, ",
                            text2: thanhvien.c00 ?? "",
                            text3: " là người làm "
                                "chính hay phụ giúp thành viên trong hộ/gia đình?",
                            textColor: Colors.black,
                            textFontSize:fontLarge,
                          ),
                          const SizedBox(height: 10,),
                          ListTile(
                            title: const UIText(
                              text: "LÀ NGƯỜI LÀM CHÍNH",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: RoundCheckBox(
                              isChecked: p70 == 1 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p70 = p70 == 1 ? 0 : 1;
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
                                p70 = p70 == 1 ? 0 : 1;
                              });
                            },
                          ),
                          ListTile(
                            title: const UIText(
                              text: "LÀ NGƯỜI PHỤ GIÚP",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: RoundCheckBox(
                              isChecked: p70 == 2 ? true : false,
                              onTap: (selected) {
                                setState(() {
                                  p70 = p70 == 2 ? 0 : 2;
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
                                p70 = p70 == 2 ? 0 : 2;
                              });
                            },
                          ),
                          const SizedBox(height: 10,),
                        ],
                      )
                  ),
                  //p71
                  UIRichText(
                    text1: "P71. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để dọn dẹp nhà cửa, giặt quần áo, "
                        "nấu ăn, chế biến đồ ăn uống của hộ, đi mua đồ lương thực, "
                        "thực phẩm cho hộ? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _dondep,
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
                  const SizedBox(height: 10,),
                  //p72
                  UIRichText(
                    text1: "P72. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để sản xuất sản phẩm cho gia đình "
                        "sử dụng như đóng giường tủ bàn ghế, làm gốm, may quần áo, "
                        "dệt thảm, sửa chữa các đồ dùng bị hỏng của gia đình, "
                        "sơn lại tường, …? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _sanxuat,
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
                  const SizedBox(height: 10,),
                  //p73
                  UIRichText(
                    text1: "P73. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để tự xây sửa, cơi nới, mở rộng "
                        "nhà cửa hoặc các công trình xây dựng của hộ? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _suachua,
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
                  const SizedBox(height: 10,),
                  //p74
                  UIRichText(
                    text1: "P74. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                        "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _giupdo,
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
                  const SizedBox(height: 10,),
                  //p75
                  UIRichText(
                    text1: "P75. Trong 7 ngày qua, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để chăm sóc trẻ em dưới 18 tuổi của hộ? (ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _chamsoc,
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
                  const SizedBox(height: 10,),
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
                          p70_75viewModel.P70_75Back();
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
                            if(thanhvien.c69 != 0 && p70 == 0){
                              showDialog(
                                  context: context,
                                  builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P70 - Loại người làm nhập vào chưa đúng!',)
                              );
                            }
                            else {
                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c64: p70,
                                c65: int.parse(_dondep.text),
                                c66: int.parse(_sanxuat.text),
                                c67: int.parse(_suachua.text),
                                c68: int.parse(_giupdo.text),
                                c69: int.parse(_chamsoc.text),
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
    );
  }
}