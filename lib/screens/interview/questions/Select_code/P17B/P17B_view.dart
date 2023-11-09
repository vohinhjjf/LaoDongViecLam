import 'package:flutter/cupertino.dart';
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
import 'P17B_viewmodel.dart';


class P17BView extends StatefulWidget {
  const P17BView({Key? key}) : super(key: key);

  @override
  State<P17BView> createState() => _P17BViewState();
}

class _P17BViewState extends State<P17BView> {
  late P17BViewModel p17BviewModel;
  var thanhvien = thongTinThanhVienModel();
  final _daotao = TextEditingController();
  final _madaotao = TextEditingController();
  final _text_find = TextEditingController();
  List list_daotao = [];
  String value = '';

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
              list_daotao = p17BviewModel.list_daotao;
              _daotao.text = p17BviewModel.thanhvien.c15A ?? "";
              _madaotao.text = p17BviewModel.thanhvien.c15B ?? "";
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
                  //p17
                  UIRichText(
                    text1: "P17. Với trình độ học vấn cao nhất là ${trinhdo()}, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " đã được đào tạo chuyên ngành gì và năm tốt nghiệp ngành đó là năm nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _daotao,
                    readOnly: true,
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
                        text: "(Đánh mã câu 17B)",
                        textColor: Colors.orange,
                        textFontSize:fontLarge,
                        isBold: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _madaotao,
                    readOnly: true,
                    onTap: (){
                      _showAddDialog(_daotao.text.toLowerCase());
                    },
                  ),
                  //Button
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        p17BviewModel.P17BBack();
                      }),
                      UINextButton(ontap: (){
                        if (_madaotao.text == "") {
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  UIWarningDialog(
                                    waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien
                                        .c00} có P17B - Mã ngành đào tạo nhập vào chưa đúng!',)
                          );
                        } else {
                          p17BviewModel.P17BNext(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c15B: _madaotao.text
                          ));
                        }
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

  _showAddDialog(String linh_vuc){
    showDialog(
        context: context,
        builder: (context) {
          String select = linh_vuc;
          _text_find.text = linh_vuc;
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
                        text: "Danh mục Đào tạo",
                        textFontSize: fontLarge,
                        textColor: Colors.blue,
                        isBold: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _text_find,
                        onChanged: (value){
                          //Navigator.of(context).pop();
                          setState(() {
                            select = _text_find.text;
                          });
                          //_showAddDialog(linh_vuc, san_pham,_text_find.text, false);
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
                        width: (MediaQuery.of(context).size.width/1.1),
                        height: (p17BviewModel.queryList(list_daotao, select).length <= 4) ? p17BviewModel.queryList(list_daotao, select).length*60 : 400,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: p17BviewModel.queryList(list_daotao, select).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                  setState(() {
                                    _madaotao.text = p17BviewModel.queryList(list_daotao, select)[index]["Ma"];
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.55,
                                      child: UIText(
                                        textColor: Colors.black,
                                        text: '${p17BviewModel.queryList(list_daotao, select)[index]["Ma"]} - ${p17BviewModel.queryList(list_daotao, select)[index]["Ten"]}',
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
                                          _showDetailProduct(p17BviewModel.queryList(list_daotao, select)[index]["Ten"], p17BviewModel.queryList(list_daotao, select)[index]["MoTa"]);
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