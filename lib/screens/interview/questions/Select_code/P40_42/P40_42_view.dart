import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P40_42_viewmodel.dart';


class P40_42View extends StatefulWidget {
  const P40_42View({Key? key}) : super(key: key);

  @override
  State<P40_42View> createState() => _P40_42ViewState();
}

class _P40_42ViewState extends State<P40_42View> {
  late P40_42ViewModel p40_42viewModel;
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
    p40_42viewModel = context.read();
    p40_42viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              thanhvien = p40_42viewModel.thanhvien;
              _congviec.text = p40_42viewModel.thanhvien.c34 ?? "";
              _chucdanh.text = p40_42viewModel.thanhvien.c35A ?? "";
              _tencoso.text = p40_42viewModel.thanhvien.c36 ?? "";
              _hoatdong.text = p40_42viewModel.thanhvien.c37A ?? "";
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
                    text: "P39. Mô tả công việc chính",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
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
                    text1: "P40. (Câu 40A) Hãy mô tả chức danh (nếu có) của ",
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
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 40B)",
                        textColor: Colors.orange,
                        textFontSize:fontLarge,
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
                  //P41
                  const UIText(
                    text: "P41. Tên cơ sở làm việc chính",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
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
                    text1: "P42. (Câu 42A) Hoạt động chính hoặc sản phẩm/dịch vụ chính của cơ sở nơi ",
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
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 40B)",
                        textColor: Colors.orange,
                        textFontSize:fontLarge,
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
                          p40_42viewModel.P40_42Back();
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
                          p40_42viewModel.P40_42Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c35B: _machucdanh.text,
                            c37B: _mahoatdong.text
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