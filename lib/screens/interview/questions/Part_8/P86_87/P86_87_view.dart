import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/dichVuTaiChinh_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P86_87_viewmodel.dart';

class P86_87View extends StatefulWidget {
  const P86_87View({Key? key}) : super(key: key);

  @override
  State<P86_87View> createState() => _P86_87ViewState();
}

class _P86_87ViewState extends State<P86_87View> {
  late P86_87ViewModel p86_87ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p86 =0, p87 =0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p86_87ViewModel = context.read();
      p86_87ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p86_87ViewModel.thanhvien;
              p86 = p86_87ViewModel.dichVuTaiChinhModel.c86 ?? 0;
              p87 = p86_87ViewModel.dichVuTaiChinhModel.c87 ?? 0;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p86
                UIRichText(
                  text1: "P86. Hiện tại, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có tài khoản thanh toán "
                      "(tài khoản có thể thực hiện các giao dịch như chuyển/nhận "
                      "tiền, nộp/rút tiền,…) mở tại ngân hàng không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p86 = 1;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "CÓ",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 1,
                      groupValue: p86,
                      onChanged: (value){
                        setState(() {
                          p86 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      p86 = 2;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "KHÔNG",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 2,
                      groupValue: p86,
                      onChanged: (value){
                        setState(() {
                          p86 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                //p87
                Visibility(
                  visible: p86 == 1 ? true : false,
                  child: Column(
                    children: [
                      UIRichText(
                        text1: "P87. Trong 12 tháng qua, ",
                        text2: thanhvien.c00 ?? "",
                        text3: " có tài khoản "
                            "thanh toán (tài khoản có thể thực hiện các giao dịch như "
                            "chuyển/nhận tiền, nộp/rút tiền,…) mở tại ngân hàng không?",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            p87 = 1;
                          });
                        },
                        child: ListTile(
                          title: const UIText(
                            text: "CÓ",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                          leading: GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p87,
                            onChanged: (value){
                              setState(() {
                                p87 = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            p87 = 2;
                          });
                        },
                        child: ListTile(
                          title: const UIText(
                            text: "KHÔNG",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                          leading: GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p87,
                            onChanged: (value){
                              setState(() {
                                p87 = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  )
                )
              ],
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
                          p86_87ViewModel.P86_87Back();
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
                          p86_87ViewModel.P86_87Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c86: p86,
                            c87: p87,
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
    );
  }
}