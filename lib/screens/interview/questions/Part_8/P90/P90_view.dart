import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P90_viewmodel.dart';

class P90View extends StatefulWidget {
  const P90View({Key? key}) : super(key: key);

  @override
  State<P90View> createState() => _P90ViewState();
}

class _P90ViewState extends State<P90View> {
  late P90ViewModel p90ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p90a = 0, p90b =0, p90c =0, p90d = 0, p90e =0,
      p90f =0, p90g = 0, p90h =0, p90i =0, p90j = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p90ViewModel = context.read();
      p90ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p90ViewModel.thanhvien;
              p90a = p90ViewModel.dichVuTaiChinhModel.c90_A ?? 0;
              p90b = p90ViewModel.dichVuTaiChinhModel.c90_B ?? 0;
              p90c = p90ViewModel.dichVuTaiChinhModel.c90_C ?? 0;
              p90d = p90ViewModel.dichVuTaiChinhModel.c90_D ?? 0;
              p90e = p90ViewModel.dichVuTaiChinhModel.c90_E ?? 0;
              p90f = p90ViewModel.dichVuTaiChinhModel.c90_F ?? 0;
              p90g = p90ViewModel.dichVuTaiChinhModel.c90_G ?? 0;
              p90h = p90ViewModel.dichVuTaiChinhModel.c90_H ?? 0;
              p90i = p90ViewModel.dichVuTaiChinhModel.c90_I ?? 0;
              p90j = p90ViewModel.dichVuTaiChinhModel.c90_J ?? 0;
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
          textFontSize: fontLarge,
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
                //p90
                UIRichText(
                  text1: "P90. Trong 12 tháng qua, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thực hiện "
                      "từ 1 lần trở lên những giao dịch sau qua tài khoản thanh "
                      "toán tại ngân hàng hay không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      width: 45,
                      child: UIText(
                        text: "Có",
                        textColor: Colors.black,
                        textFontSize: fontSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 45,
                      child: UIText(
                        text: "Không",
                        textColor: Colors.black,
                        textFontSize: fontSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                //a
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Rút tiền",
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
                            groupValue: p90a,
                            onChanged: (value){
                              setState(() {
                                p90a = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90a,
                            onChanged: (value){
                              setState(() {
                                p90a = value;
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Nhận tiền từ người khác đang cư trú tại Việt Nam",
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
                            groupValue: p90b,
                            onChanged: (value){
                              setState(() {
                                p90b = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90b,
                            onChanged: (value){
                              setState(() {
                                p90b = value;
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
                //c
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Nhận tiền từ người khác (bao gồm cả người đang "
                                "cư trú tại Việt Nam và ở nước ngoài)",
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
                            groupValue: p90c,
                            onChanged: (value){
                              setState(() {
                                p90c = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90c,
                            onChanged: (value){
                              setState(() {
                                p90c = value;
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
                //d
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Chuyển/gửi tiền cho người khác đang cư trú tại Việt Nam",
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
                            groupValue: p90d,
                            onChanged: (value){
                              setState(() {
                                p90d = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90d,
                            onChanged: (value){
                              setState(() {
                                p90d = value;
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
                //e
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Chuyển tiền cho người khác (bao gồm cả người "
                                "đang cư trú tại Việt Nam và ở nước ngoài)",
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
                            groupValue: p90e,
                            onChanged: (value){
                              setState(() {
                                p90e = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90e,
                            onChanged: (value){
                              setState(() {
                                p90e = value;
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
                //f
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Nhận lương hoặc tiền công (bao gồm cả lương hưu)",
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
                            groupValue: p90f,
                            onChanged: (value){
                              setState(() {
                                p90f = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90f,
                            onChanged: (value){
                              setState(() {
                                p90f = value;
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
                //g
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex:1,
                        child: UIText(
                          text: "Thanh toán hóa đơn tiện ích (điện, nước, truyền hình)",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p90g,
                            onChanged: (value){
                              setState(() {
                                p90g = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90g,
                            onChanged: (value){
                              setState(() {
                                p90g = value;
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
                //h
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Thanh toán học phí (cho bản thân, người trong gia đình)",
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
                            groupValue: p90h,
                            onChanged: (value){
                              setState(() {
                                p90h = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90h,
                            onChanged: (value){
                              setState(() {
                                p90h = value;
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
                //i
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex:1,
                        child: UIText(
                          text: "Thanh toán hóa đơn mua hàng qua mạng",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p90i,
                            onChanged: (value){
                              setState(() {
                                p90i = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90i,
                            onChanged: (value){
                              setState(() {
                                p90i = value;
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
                //j
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex:1,
                        child: const UIText(
                          text: "Nhận tiền từ việc kinh doanh/buôn bán sản phẩm nông nghiệp.",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 1,
                            groupValue: p90j,
                            onChanged: (value){
                              setState(() {
                                p90j = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Colors.indigo,
                          ),
                          const SizedBox(width: 12,),
                          GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            value: 2,
                            groupValue: p90j,
                            onChanged: (value){
                              setState(() {
                                p90j = value;
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
                          p90ViewModel.P90Back();
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
                          p90ViewModel.P90Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c90_A: p90a,
                            c90_B: p90b,
                            c90_C: p90c,
                            c90_D: p90d,
                            c90_E: p90e,
                            c90_F: p90f,
                            c90_G: p90g,
                            c90_H: p90h,
                            c90_I: p90i,
                            c90_J: p90j,
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