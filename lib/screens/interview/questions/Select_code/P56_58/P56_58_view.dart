import 'package:flutter/cupertino.dart';
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
  final _text_find_nghe = TextEditingController();
  final _text_find_nganh = TextEditingController();
  List list_maNghe = [], list_nghe = [];
  List list_maNganh = [], list_nganh = [];
  String maNghe_macdinh = " ";
  String maNganh_macdinh = "0";

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
              list_maNghe = p56_58viewModel.list_maNghe;
              list_nghe = p56_58viewModel.list_nghe;
              list_maNganh = p56_58viewModel.list_maNganh;
              list_nganh = p56_58viewModel.list_nganh;
              _congviec.text = p56_58viewModel.thanhvien.c49 ?? "";
              _chucdanh.text = p56_58viewModel.thanhvien.c50A ?? "";
              _tencoso.text = p56_58viewModel.thanhvien.c51 ?? "";
              _hoatdong.text = p56_58viewModel.thanhvien.c52A ?? "";
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //P39
                  const UIText(
                    text: "P55. Mô tả công việc thứ hai",
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
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 56B)",
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
                    onTap: (){
                      _showAddNgheDialog(maNghe_macdinh);
                    },
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
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                      UIText(
                        text: "(Đánh mã câu 58B)",
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
                    onTap: (){
                      _showAddNganhDialog(maNganh_macdinh);
                    },
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
                        p56_58viewModel.P56_58Back();
                      }),
                      UINextButton(ontap: (){
                        p56_58viewModel.P56_58Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c50B: _machucdanh.text,
                            c52B: _mahoatdong.text
                        ));
                      }),
                    ],
                  )
                ]),
          ),
        ],
      ),
      drawer: const DrawerNavigation(),
    );
  }

  _showAddNgheDialog(String select_nghe){
    showDialog(
        context: context,
        builder: (context) {
          _text_find_nghe.text = _chucdanh.text;
          String select = '';
          String nghe = select_nghe;
          return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)),
                ),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.clear_fill,color: Colors.redAccent,),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const UIText(
                        text: "Danh mục Nghề",
                        textFontSize: fontLarge,
                        textColor: Colors.blue,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                        child: const UIText(
                          text:"Chọn mã cấp 1",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        //height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButton(
                          value: nghe,
                          items: list_maNghe.map((e) => DropdownMenuItem(
                            value: e["MaC1"].toString(),
                            child: UIText(textColor: Colors.black,text: '${e["MaC1"]}. ${e["TenC1"]}',),
                          )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              nghe = value!;
                              maNghe_macdinh = value;
                              _text_find_nghe.text = "";
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        //width: MediaQuery.of(context).size.width/1.2,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.20),
                        ),
                        child: TextField(
                          controller: _text_find_nghe,
                          onChanged: (value){
                            setState(() {
                              select = _text_find_nghe.text;
                            });
                          },
                          style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: mPrimaryColor)),
                            hintText: "Nhập mã",
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: fontMedium),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                        width: (MediaQuery.of(context).size.width/1.1),
                        height: (p56_58viewModel.queryListNghe(select, nghe, list_nghe).length <= 4) ? p56_58viewModel.queryListNghe(select, nghe, list_nghe).length*60 : 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: p56_58viewModel.queryListNghe(select, nghe, list_nghe).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                  setState(() {
                                    _machucdanh.text = p56_58viewModel.queryListNghe(select, nghe, list_nghe)[index]["Ma"];
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.55,
                                      child: UIText(
                                        textColor: Colors.black,
                                        text: '${p56_58viewModel.queryListNghe(select, nghe, list_nghe)[index]["Ma"]} - ${p56_58viewModel.queryListNghe(select, nghe, list_nghe)[index]["Ten"]}',
                                      ),
                                    ),
                                    IconButton(
                                        alignment: Alignment.centerRight,
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.lightBlue,
                                          //size: fontGreater,
                                        ),
                                        onPressed: () {
                                          _showDetailProduct(p56_58viewModel.queryListNghe(select, nghe, list_nghe)[index]["Ten"], p56_58viewModel.queryListNghe(select, nghe, list_nghe)[index]["MoTa"]);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  _showAddNganhDialog(String select_nganh){
    showDialog(
        context: context,
        builder: (context) {
          _text_find_nganh.text = _hoatdong.text;
          String select = '';
          String nganh = select_nganh;
          return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)),
                ),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.clear_fill,color: Colors.redAccent,),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const UIText(
                        text: "Danh mục Nghề",
                        textFontSize: fontLarge,
                        textColor: Colors.blue,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                        child: const UIText(
                          text:"Chọn mã cấp 1",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        //height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButton(
                          value: nganh,
                          items: list_maNganh.map((e) => DropdownMenuItem(
                            value: e["MaC1"].toString(),
                            child: UIText(textColor: Colors.black,text: '${e["MaC1"]}. ${e["TenC1"]}',),
                          )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              nganh = value!;
                              maNganh_macdinh = value;
                              _text_find_nganh.text = "";
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                        //width: MediaQuery.of(context).size.width/1.2,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid, width: 0.20),
                        ),
                        child: TextField(
                          controller: _text_find_nganh,
                          onChanged: (value){
                            setState(() {
                              select = _text_find_nganh.text;
                            });
                          },
                          style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: mPrimaryColor)),
                            hintText: "Nhập mã",
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: fontMedium),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                        width: (MediaQuery.of(context).size.width/1.1),
                        height: (p56_58viewModel.queryListNganh(select, nganh, list_nganh).length <= 4) ? p56_58viewModel.queryListNganh(select, nganh, list_nganh).length*60 : 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: p56_58viewModel.queryListNganh(select, nganh, list_nganh).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                  setState(() {
                                    _mahoatdong.text = p56_58viewModel.queryListNganh(select, nganh, list_nganh)[index]["Ma"];
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.55,
                                      child: UIText(
                                        textColor: Colors.black,
                                        text: '${p56_58viewModel.queryListNganh(select, nganh, list_nganh)[index]["Ma"]} - ${p56_58viewModel.queryListNganh(select, nganh, list_nganh)[index]["Ten"]}',
                                      ),
                                    ),
                                    IconButton(
                                        alignment: Alignment.centerRight,
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.lightBlue,
                                          //size: fontGreater,
                                        ),
                                        onPressed: () {
                                          _showDetailProduct(p56_58viewModel.queryListNganh(select, nganh, list_nganh)[index]["Ten"], p56_58viewModel.queryListNganh(select, nganh, list_nganh)[index]["MoTa"]);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  _showDetailProduct(String title, String detail){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: EdgeInsets.symmetric(horizontal: 15.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
            text: title,
            textColor: Colors.black,
            textFontSize: fontMedium,
            textAlign: TextAlign.center,
            isBold: true,
          ),
          content: Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black)
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: UIText(
                text: detail,
                textColor: mPrimaryColor,
                textFontSize: fontMedium,
                textAlign: TextAlign.center,
                isBold: true,
              ),
            ),
          ),
          iconColor: Colors.red,
          iconPadding: EdgeInsets.zero,
          icon: IconButton(
              alignment: Alignment.centerRight,
              icon: const Icon(
                CupertinoIcons.clear_fill,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              }
          ),
        )
    );
  }
}