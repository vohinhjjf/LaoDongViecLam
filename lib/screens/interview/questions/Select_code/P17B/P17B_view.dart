import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P17B_viewmodel.dart';


class P17BView extends StatefulWidget {
  const P17BView({Key? key}) : super(key: key);

  @override
  State<P17BView> createState() => _P17BViewState();
}

class _P17BViewState extends State<P17BView> {
  late P17BViewModel p17BviewModel;
  var thanhvien = thongTinThanhVienModel();
  final _nganh = TextEditingController();
  final _manganh = TextEditingController();

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
    p17BviewModel = context.read();
    p17BviewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p17BviewModel.thanhvien;
              _nganh.text = p17BviewModel.thanhvien.c15A ?? "";
              _manganh.text = p17BviewModel.thanhvien.c15B ?? "";
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
                  //p17
                  UIRichText(
                    text1: "P17. Với trình độ học vấn cao nhất là ${trinhdo()}, ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã được đào tạo chuyên ngành gì và năm tốt nghiệp ngành đó là năm nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _nganh,
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
                        text: "(Đánh mã câu 40B)",
                        textColor: Colors.orange,
                        textFontSize:fontGreater,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _manganh,
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
                          p17BviewModel.P17BBack();
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
                          p17BviewModel.P17BNext(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c15B: _manganh.text
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