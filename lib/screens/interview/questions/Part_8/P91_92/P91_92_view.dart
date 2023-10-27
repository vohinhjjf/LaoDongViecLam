import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P91_92_viewmodel.dart';

class P91_92View extends StatefulWidget {
  const P91_92View({Key? key}) : super(key: key);

  @override
  State<P91_92View> createState() => _P91_92ViewState();
}

class _P91_92ViewState extends State<P91_92View> {
  late P91_92ViewModel p91_92ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p91a = 0, p91b =0, p92 =0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p91_92ViewModel = context.read();
      p91_92ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p91_92ViewModel.thanhvien;
              p91a = p91_92ViewModel.dichVuTaiChinhModel.c91_A ?? 0;
              p91b = p91_92ViewModel.dichVuTaiChinhModel.c91_B ?? 0;
              p92 = p91_92ViewModel.dichVuTaiChinhModel.c92 ?? 0;
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
                //p91
                UIRichText(
                  text1: "P91. Trong 12 tháng qua, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thực hiện "
                      "từ 1 lần trở lên những giao dịch sau từ tài khoản thanh "
                      "toán của mình thông qua hệ thống máy ATM của các ngân hàng hay không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    UIText(
                      text: "CÓ",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 10,),
                    UIText(
                      text: "KHÔNG",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                //a
                Padding(
                    padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Rút tiền mặt",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p91a,
                            onChanged: (value){
                              setState(() {
                                p91a = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 15,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p91a,
                            onChanged: (value){
                              setState(() {
                                p91a = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //b
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Giao dịch khác (truy vấn số dư; đổi mật khẩu…)",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p91b,
                            onChanged: (value){
                              setState(() {
                                p91b = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 15,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p91b,
                            onChanged: (value){
                              setState(() {
                                p91b = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //p92
                const SizedBox(height: 10,),
                UIRichText(
                  text1: "P92. Trong 12 tháng qua, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có để dành tiền/tiết kiệm tiền để sử dụng cho tương lai không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p92 = 1;
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
                      groupValue: p92,
                      onChanged: (value){
                        setState(() {
                          p92 = value;
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
                      p92 = 2;
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
                      groupValue: p92,
                      onChanged: (value){
                        setState(() {
                          p92 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
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
                          p91_92ViewModel.P91_92Back();
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
                          p91_92ViewModel.P91_92Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c91_A: p91a,
                            c91_B: p91b,
                            c92: p92,
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