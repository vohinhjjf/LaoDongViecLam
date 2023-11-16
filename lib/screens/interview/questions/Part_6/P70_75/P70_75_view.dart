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
import 'P70_75_viewmodel.dart';

class P70_75View extends StatefulWidget {
  const P70_75View({Key? key}) : super(key: key);

  @override
  State<P70_75View> createState() => _P70_75ViewState();
}

class _P70_75ViewState extends State<P70_75View> {
  late P70_75ViewModel p70_75viewModel;
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _dondep = TextEditingController();
  final _sanxuat = TextEditingController();
  final _suachua = TextEditingController();
  final _giupdo = TextEditingController();
  final _chamsoc = TextEditingController();
  int p70 =0;
  bool check_draw = true;

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
              _dondep.text = p70_75viewModel.thanhvien.c65 == null ? "" : p70_75viewModel.thanhvien.c69.toString();
              _sanxuat.text = p70_75viewModel.thanhvien.c66 == null ? "" : p70_75viewModel.thanhvien.c69.toString();
              _suachua.text = p70_75viewModel.thanhvien.c67 == null ? "" : p70_75viewModel.thanhvien.c69.toString();
              _giupdo.text = p70_75viewModel.thanhvien.c68 == null ? "" : p70_75viewModel.thanhvien.c69.toString();
              _chamsoc.text = p70_75viewModel.thanhvien.c69 == null ? "" : p70_75viewModel.thanhvien.c69.toString();
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
                  //P70
                  Visibility(
                      visible: thanhvien.c63 != 0,
                      child: Column(
                        children: [
                          UIRichText(
                            text1: "P70. Với công việc trên, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                            text2: thanhvien.c00 ?? "",
                            text3: " là người làm "
                                "chính hay phụ giúp ${BaseLogic.getInstance().getMember(thanhvien)} trong hộ/gia đình?",
                            textColor: Colors.black,
                            textFontSize:fontLarge,
                          ),
                          const SizedBox(height: 10,),
                          ListTile(
                            title: const UIText(
                              text: "Là người làm chính",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
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
                              text: "Là người phụ giúp",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
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
                    text1: "P71. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để dọn dẹp nhà cửa, giặt quần áo, "
                        "nấu ăn, chế biến đồ ăn uống của hộ, đi mua đồ lương thực, "
                        "thực phẩm cho hộ?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _dondep,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
                    onFieldSubmitted: (v){
                      FocusScope.of(context).requestFocus(focus);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 3,
                    autofocus: true,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10,),
                  //p72
                  UIRichText(
                    text1: "P72. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để sản xuất sản phẩm cho gia đình "
                        "sử dụng như đóng giường tủ bàn ghế, làm gốm, may quần áo, "
                        "dệt thảm, sửa chữa các đồ dùng bị hỏng của gia đình, "
                        "sơn lại tường, …?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _sanxuat,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập số giờ';
                      }
                      return null;
                    },
                    focusNode: focus,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    maxLength: 3,
                    autofocus: true,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10,),
                  //p73
                  UIRichText(
                    text1: "P73. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để tự xây sửa, cơi nới, mở rộng "
                        "nhà cửa hoặc các công trình xây dựng của hộ?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _suachua,
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
                    autofocus: true,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10,),
                  //p74
                  UIRichText(
                    text1: "P74. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                        "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _giupdo,
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
                    autofocus: true,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10,),
                  //p75
                  UIRichText(
                    text1: "P75. Trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm bao nhiêu giờ để chăm sóc trẻ em dưới 18 tuổi của hộ?\n(ĐƠN VỊ TÍNH: GIỜ)",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _chamsoc,
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
                    autofocus: true,
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
              p70_75viewModel.P70_75Back(thanhvien);
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if(thanhvien.c63 != 0 && p70 == 0){
                  showDialog(
                      context: context,
                      builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P70-Loại người làm nhập vào chưa đúng!',)
                  );
                }
                else if((thanhvien.c59 ?? 0) + int.parse(_dondep.text)
                    + int.parse(_sanxuat.text) + int.parse(_suachua.text)
                    + int.parse(_giupdo.text) + int.parse(_chamsoc.text) > 140){
                  showDialog(
                      context: context,
                      builder: (_) => const UIWarningDialog(waring: 'Tổng thu nhập tất cả các công việc và công việc không được > 140 giờ/tuần!',)
                  );
                }
                else if (int.parse(_dondep.text) >= 70 ||
                    (thanhvien.c59 != null && thanhvien.c59! + int.parse(_dondep.text) >= 90)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            'dành thời gian dọn dẹp nhà cửa, giặt quần áo, nấu ăn, chế biến dồ ăn uống '
                            'của hộ, đi mua đồ lương thực, thực phẩm cho hộ trong 1 tuần quá nhiều. Có đúng không?',
                        onpress: (){
                          Navigator.of(context).pop();
                          if (int.parse(_sanxuat.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_sanxuat.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "có thời gian sản xuất sản phẩm cho gia đình sử dụng "
                                      "như đóng giường tủ bàn ghế, làm gốm, may quần áo, "
                                      "dệt thảm, sửa chữa các đồ dùng bị hỏng của gia đình, "
                                      "sơn lại tường,…. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_suachua.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_suachua.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian tự xây sửa, cơi nới, mở rộng "
                                                "nhà cửa hoặc các công trình xây dựng của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if (int.parse(_giupdo.text) >= 70 ||
                                                  (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                          "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                                          "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if (int.parse(_chamsoc.text) >= 70 ||
                                                            (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                                    "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    thangDT: thanhvien.thangDT,
                                                                    namDT: thanhvien.namDT,
                                                                    c64: p70,
                                                                    c65: int.parse(_dondep.text),
                                                                    c66: int.parse(_sanxuat.text),
                                                                    c67: int.parse(_suachua.text),
                                                                    c68: int.parse(_giupdo.text),
                                                                    c69: int.parse(_chamsoc.text),
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            thangDT: thanhvien.thangDT,
                                                            namDT: thanhvien.namDT,
                                                            c64: p70,
                                                            c65: int.parse(_dondep.text),
                                                            c66: int.parse(_sanxuat.text),
                                                            c67: int.parse(_suachua.text),
                                                            c68: int.parse(_giupdo.text),
                                                            c69: int.parse(_chamsoc.text),
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if (int.parse(_chamsoc.text) >= 70 ||
                                                  (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                          "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          thangDT: thanhvien.thangDT,
                                                          namDT: thanhvien.namDT,
                                                          c64: p70,
                                                          c65: int.parse(_dondep.text),
                                                          c66: int.parse(_sanxuat.text),
                                                          c67: int.parse(_suachua.text),
                                                          c68: int.parse(_giupdo.text),
                                                          c69: int.parse(_chamsoc.text),
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  thangDT: thanhvien.thangDT,
                                                  namDT: thanhvien.namDT,
                                                  c64: p70,
                                                  c65: int.parse(_dondep.text),
                                                  c66: int.parse(_sanxuat.text),
                                                  c67: int.parse(_suachua.text),
                                                  c68: int.parse(_giupdo.text),
                                                  c69: int.parse(_chamsoc.text),
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if (int.parse(_giupdo.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                                "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if (int.parse(_chamsoc.text) >= 70 ||
                                                  (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                          "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          thangDT: thanhvien.thangDT,
                                                          namDT: thanhvien.namDT,
                                                          c64: p70,
                                                          c65: int.parse(_dondep.text),
                                                          c66: int.parse(_sanxuat.text),
                                                          c67: int.parse(_suachua.text),
                                                          c68: int.parse(_giupdo.text),
                                                          c69: int.parse(_chamsoc.text),
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  thangDT: thanhvien.thangDT,
                                                  namDT: thanhvien.namDT,
                                                  c64: p70,
                                                  c65: int.parse(_dondep.text),
                                                  c66: int.parse(_sanxuat.text),
                                                  c67: int.parse(_suachua.text),
                                                  c68: int.parse(_giupdo.text),
                                                  c69: int.parse(_chamsoc.text),
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_suachua.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_suachua.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian tự xây sửa, cơi nới, mở rộng "
                                      "nhà cửa hoặc các công trình xây dựng của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_giupdo.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                                "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if (int.parse(_chamsoc.text) >= 70 ||
                                                  (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                          "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          thangDT: thanhvien.thangDT,
                                                          namDT: thanhvien.namDT,
                                                          c64: p70,
                                                          c65: int.parse(_dondep.text),
                                                          c66: int.parse(_sanxuat.text),
                                                          c67: int.parse(_suachua.text),
                                                          c68: int.parse(_giupdo.text),
                                                          c69: int.parse(_chamsoc.text),
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  thangDT: thanhvien.thangDT,
                                                  namDT: thanhvien.namDT,
                                                  c64: p70,
                                                  c65: int.parse(_dondep.text),
                                                  c66: int.parse(_sanxuat.text),
                                                  c67: int.parse(_suachua.text),
                                                  c68: int.parse(_giupdo.text),
                                                  c69: int.parse(_chamsoc.text),
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_giupdo.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                      "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_chamsoc.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      thangDT: thanhvien.thangDT,
                                      namDT: thanhvien.namDT,
                                      c64: p70,
                                      c65: int.parse(_dondep.text),
                                      c66: int.parse(_sanxuat.text),
                                      c67: int.parse(_suachua.text),
                                      c68: int.parse(_giupdo.text),
                                      c69: int.parse(_chamsoc.text),
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              thangDT: thanhvien.thangDT,
                              namDT: thanhvien.namDT,
                              c64: p70,
                              c65: int.parse(_dondep.text),
                              c66: int.parse(_sanxuat.text),
                              c67: int.parse(_suachua.text),
                              c68: int.parse(_giupdo.text),
                              c69: int.parse(_chamsoc.text),
                            ));
                          }
                        },
                      )
                  );
                }
                else if (int.parse(_sanxuat.text) >= 70 ||
                    (thanhvien.c59 != null && thanhvien.c59! + int.parse(_sanxuat.text) >= 90)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            "có thời gian sản xuất sản phẩm cho gia đình sử dụng "
                            "như đóng giường tủ bàn ghế, làm gốm, may quần áo, "
                            "dệt thảm, sửa chữa các đồ dùng bị hỏng của gia đình, "
                            "sơn lại tường,…. Có đúng không?",
                        onpress: (){
                          Navigator.of(context).pop();
                          if (int.parse(_suachua.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_suachua.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian tự xây sửa, cơi nới, mở rộng "
                                      "nhà cửa hoặc các công trình xây dựng của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_giupdo.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                                "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if (int.parse(_chamsoc.text) >= 70 ||
                                                  (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                          "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          thangDT: thanhvien.thangDT,
                                                          namDT: thanhvien.namDT,
                                                          c64: p70,
                                                          c65: int.parse(_dondep.text),
                                                          c66: int.parse(_sanxuat.text),
                                                          c67: int.parse(_suachua.text),
                                                          c68: int.parse(_giupdo.text),
                                                          c69: int.parse(_chamsoc.text),
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  thangDT: thanhvien.thangDT,
                                                  namDT: thanhvien.namDT,
                                                  c64: p70,
                                                  c65: int.parse(_dondep.text),
                                                  c66: int.parse(_sanxuat.text),
                                                  c67: int.parse(_suachua.text),
                                                  c68: int.parse(_giupdo.text),
                                                  c69: int.parse(_chamsoc.text),
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_giupdo.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                      "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_chamsoc.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      thangDT: thanhvien.thangDT,
                                      namDT: thanhvien.namDT,
                                      c64: p70,
                                      c65: int.parse(_dondep.text),
                                      c66: int.parse(_sanxuat.text),
                                      c67: int.parse(_suachua.text),
                                      c68: int.parse(_giupdo.text),
                                      c69: int.parse(_chamsoc.text),
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              thangDT: thanhvien.thangDT,
                              namDT: thanhvien.namDT,
                              c64: p70,
                              c65: int.parse(_dondep.text),
                              c66: int.parse(_sanxuat.text),
                              c67: int.parse(_suachua.text),
                              c68: int.parse(_giupdo.text),
                              c69: int.parse(_chamsoc.text),
                            ));
                          }
                        },
                      )
                  );
                }
                else if (int.parse(_suachua.text) >= 70 ||
                    (thanhvien.c59 != null && thanhvien.c59! + int.parse(_suachua.text) >= 90)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            "dành thời gian tự xây sửa, cơi nới, mở rộng "
                            "nhà cửa hoặc các công trình xây dựng của hộ. Có đúng không?",
                        onpress: (){
                          Navigator.of(context).pop();
                          if (int.parse(_giupdo.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                                      "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if (int.parse(_chamsoc.text) >= 70 ||
                                        (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                                "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                thangDT: thanhvien.thangDT,
                                                namDT: thanhvien.namDT,
                                                c64: p70,
                                                c65: int.parse(_dondep.text),
                                                c66: int.parse(_sanxuat.text),
                                                c67: int.parse(_suachua.text),
                                                c68: int.parse(_giupdo.text),
                                                c69: int.parse(_chamsoc.text),
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        thangDT: thanhvien.thangDT,
                                        namDT: thanhvien.namDT,
                                        c64: p70,
                                        c65: int.parse(_dondep.text),
                                        c66: int.parse(_sanxuat.text),
                                        c67: int.parse(_suachua.text),
                                        c68: int.parse(_giupdo.text),
                                        c69: int.parse(_chamsoc.text),
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if (int.parse(_chamsoc.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      thangDT: thanhvien.thangDT,
                                      namDT: thanhvien.namDT,
                                      c64: p70,
                                      c65: int.parse(_dondep.text),
                                      c66: int.parse(_sanxuat.text),
                                      c67: int.parse(_suachua.text),
                                      c68: int.parse(_giupdo.text),
                                      c69: int.parse(_chamsoc.text),
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              thangDT: thanhvien.thangDT,
                              namDT: thanhvien.namDT,
                              c64: p70,
                              c65: int.parse(_dondep.text),
                              c66: int.parse(_sanxuat.text),
                              c67: int.parse(_suachua.text),
                              c68: int.parse(_giupdo.text),
                              c69: int.parse(_chamsoc.text),
                            ));
                          }
                        },
                      )
                  );
                }
                else if (int.parse(_giupdo.text) >= 70 ||
                    (thanhvien.c59 != null && thanhvien.c59! + int.parse(_giupdo.text) >= 90)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            "dành thời gian chăm sóc, giúp đỡ hoặc hỗ trợ cho các thành viên (từ 18 "
                            "tuổi trở lên) của hộ bị khuyết tật, ốm đau, già yếu. Có đúng không?",
                        onpress: (){
                          Navigator.of(context).pop();
                          if (int.parse(_chamsoc.text) >= 70 ||
                              (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                                      "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      thangDT: thanhvien.thangDT,
                                      namDT: thanhvien.namDT,
                                      c64: p70,
                                      c65: int.parse(_dondep.text),
                                      c66: int.parse(_sanxuat.text),
                                      c67: int.parse(_suachua.text),
                                      c68: int.parse(_giupdo.text),
                                      c69: int.parse(_chamsoc.text),
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              thangDT: thanhvien.thangDT,
                              namDT: thanhvien.namDT,
                              c64: p70,
                              c65: int.parse(_dondep.text),
                              c66: int.parse(_sanxuat.text),
                              c67: int.parse(_suachua.text),
                              c68: int.parse(_giupdo.text),
                              c69: int.parse(_chamsoc.text),
                            ));
                          }
                        },
                      )
                  );
                }
                else if (int.parse(_chamsoc.text) >= 70 ||
                    (thanhvien.c59 != null && thanhvien.c59! + int.parse(_chamsoc.text) >= 90)){
                  showDialog(
                      context: context,
                      builder: (_) => UINotificationDialog(
                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} '
                            "dành thời gian chăm sóc trẻ em dưới 18 tuổi của hộ. Có đúng không?",
                        onpress: (){
                          Navigator.of(context).pop();
                          p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            thangDT: thanhvien.thangDT,
                            namDT: thanhvien.namDT,
                            c64: p70,
                            c65: int.parse(_dondep.text),
                            c66: int.parse(_sanxuat.text),
                            c67: int.parse(_suachua.text),
                            c68: int.parse(_giupdo.text),
                            c69: int.parse(_chamsoc.text),
                          ));
                        },
                      )
                  );
                }
                else {
                  p70_75viewModel.P70_75Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    thangDT: thanhvien.thangDT,
                    namDT: thanhvien.namDT,
                    c64: p70,
                    c65: int.parse(_dondep.text),
                    c66: int.parse(_sanxuat.text),
                    c67: int.parse(_suachua.text),
                    c68: int.parse(_giupdo.text),
                    c69: int.parse(_chamsoc.text),
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