import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P56_58_viewmodel.dart';


class P56_58View extends StatefulWidget {
  const P56_58View({Key? key}) : super(key: key);

  @override
  State<P56_58View> createState() => _P56_58ViewState();
}

class _P56_58ViewState extends State<P56_58View> {
  late P56_58ViewModel p56_58viewModel;
  var thanhvien = thongTinThanhVienModel();
  final _congviec = TextEditingController();
  final _chucdanh = TextEditingController();
  final _machucdanh = TextEditingController();
  final _tencoso = TextEditingController();
  final _hoatdong = TextEditingController();
  final _mahoatdong = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    p56_58viewModel = context.read();
    p56_58viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              thanhvien = p56_58viewModel.thanhvien;
              _congviec.text = p56_58viewModel.thanhvien.c34 ?? "";
              _chucdanh.text = p56_58viewModel.thanhvien.c35A ?? "";
              _tencoso.text = p56_58viewModel.thanhvien.c36 ?? "";
              _hoatdong.text = p56_58viewModel.thanhvien.c37A ?? "";
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        title: const UIText(
          text: UIDescribes.interviewDetails,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //P39
                  const UIText(
                    text: "P55. Mô tả công việc thứ hai",
                    textColor: Colors.black,
                    textFontSize:fontGreater,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _congviec,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //p40
                  UIRichText(
                    text1: "P56. (Câu 56A) Hãy mô tả chức danh (nếu có) của ",
                    text2: thanhvien.c00 ?? "",
                    text3: " trong công việc này?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _chucdanh,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UIText(
                        text: "Chọn mã",
                        textColor: Colors.black,
                        textFontSize:fontGreater,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 56B)",
                        textColor: Colors.orange,
                        textFontSize:fontGreater,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _machucdanh,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //P57
                  const UIText(
                    text: "P57. Tên cơ sở làm công việc này",
                    textColor: Colors.black,
                    textFontSize:fontGreater,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _tencoso,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //p42
                  UIRichText(
                    text1: "P58. (Câu 58A) Hoạt động chính hoặc sản phẩm/dịch vụ chính của cơ sở nơi ",
                    text2: thanhvien.c00 ?? "",
                    text3: " làm việc là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _hoatdong,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UIText(
                        text: "Chọn mã",
                        textColor: Colors.black,
                        textFontSize:fontGreater,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 58B)",
                        textColor: Colors.orange,
                        textFontSize:fontGreater,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _mahoatdong,
                    readOnly: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                ]),
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
                          p56_58viewModel.P56_58Back();
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
                          p56_58viewModel.P56_58Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c50B: _machucdanh.text,
                            c52B: _mahoatdong.text
                          ));
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
      drawer: const DrawerNavigation(),
    );
  }
}