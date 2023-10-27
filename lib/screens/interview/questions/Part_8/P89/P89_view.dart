import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P89_viewmodel.dart';

class P89View extends StatefulWidget {
  const P89View({Key? key}) : super(key: key);

  @override
  State<P89View> createState() => _P89ViewState();
}

class _P89ViewState extends State<P89View> {
  late P89ViewModel p89ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p89a = 0, p89b =0, p89c =0, p89d = 0, p89e =0, p89f =0, p89g = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p89ViewModel = context.read();
      p89ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p89ViewModel.thanhvien;
              p89a = p89ViewModel.dichVuTaiChinhModel.c89_A ?? 0;
              p89b = p89ViewModel.dichVuTaiChinhModel.c89_B ?? 0;
              p89c = p89ViewModel.dichVuTaiChinhModel.c89_C ?? 0;
              p89d = p89ViewModel.dichVuTaiChinhModel.c89_D ?? 0;
              p89e = p89ViewModel.dichVuTaiChinhModel.c89_E ?? 0;
              p89f = p89ViewModel.dichVuTaiChinhModel.c89_F ?? 0;
              p89g = p89ViewModel.dichVuTaiChinhModel.c89_G ?? 0;
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
                //p89
                UIRichText(
                  text1: "P89. Trong 12 tháng qua, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có thực hiện từ 1 lần trở lên những giao dịch sau hay không?",
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
                            text: "Nhận tiền từ người đang cư trú tại Việt Nam "
                                "dưới bất kỳ hình thức nào (Ví dụ: nhận tiền qua "
                                "tài khoản, nhận tiền mặt)",
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
                            groupValue: p89a,
                            onChanged: (value){
                              setState(() {
                                p89a = value;
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
                            groupValue: p89a,
                            onChanged: (value){
                              setState(() {
                                p89a = value;
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
                            text: "Chuyển/gửi tiền cho người đang cư trú tại Việt "
                                "Nam dưới bất kỳ hình thức nào (Ví dụ: chuyển/gửi "
                                "tiền qua tài khoản, qua bưu điện)",
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
                            groupValue: p89b,
                            onChanged: (value){
                              setState(() {
                                p89b = value;
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
                            groupValue: p89b,
                            onChanged: (value){
                              setState(() {
                                p89b = value;
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
                            text: "Nhận tiền lương hoặc tiền công (bao gồm cả lương "
                                "hưu) dưới bất kỳ hình thức nào (Ví dụ: nhận qua "
                                "tài khoản, nhận tiền mặt)",
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
                            groupValue: p89c,
                            onChanged: (value){
                              setState(() {
                                p89c = value;
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
                            groupValue: p89c,
                            onChanged: (value){
                              setState(() {
                                p89c = value;
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
                            text: "Thanh toán hóa đơn tiện ích (điện, nước, truyền hình…)",
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
                            groupValue: p89d,
                            onChanged: (value){
                              setState(() {
                                p89d = value;
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
                            groupValue: p89d,
                            onChanged: (value){
                              setState(() {
                                p89d = value;
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
                            groupValue: p89e,
                            onChanged: (value){
                              setState(() {
                                p89e = value;
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
                            groupValue: p89e,
                            onChanged: (value){
                              setState(() {
                                p89e = value;
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
                            text: "Thanh toán hóa đơn mua hàng qua mạng",
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
                            groupValue: p89f,
                            onChanged: (value){
                              setState(() {
                                p89f = value;
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
                            groupValue: p89f,
                            onChanged: (value){
                              setState(() {
                                p89f = value;
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
                          flex: 1,
                          child: UIText(
                            text: "Nhận tiền từ việc kinh doanh/ buôn bán sản phẩm nông nghiệp.",
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
                            groupValue: p89g,
                            onChanged: (value){
                              setState(() {
                                p89g = value;
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
                            groupValue: p89g,
                            onChanged: (value){
                              setState(() {
                                p89g = value;
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
                          p89ViewModel.P89Back();
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
                          p89ViewModel.P89Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c89_A: p89a,
                            c89_B: p89b,
                            c89_C: p89c,
                            c89_D: p89d,
                            c89_E: p89e,
                            c89_F: p89f,
                            c89_G: p89g,
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