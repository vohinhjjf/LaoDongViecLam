import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P99_viewmodel.dart';

class P99View extends StatefulWidget {
  const P99View({Key? key}) : super(key: key);

  @override
  State<P99View> createState() => _P99ViewState();
}

class _P99ViewState extends State<P99View> {
  late P99ViewModel p99ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p99 =0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p99ViewModel = context.read();
      p99ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p99ViewModel.thanhvien;
              p99 = p99ViewModel.dichVuTaiChinhModel.c99 ?? 0;
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
                //p99
                UIRichText(
                  text1: "P99. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có được dạy về các kiến thức tài chính cơ bản như lãi "
                      "suất; tiền vay; tiết kiệm, thanh toán; lợi nhuận; doanh "
                      "thu; thu nhập; chi tiêu…  khi học tại trường trung học "
                      "phổ thông/trường cao đẳng/trường đại học hoặc trường "
                      "đào tạo nghề không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p99 = 1;
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
                      groupValue: p99,
                      onChanged: (value){
                        setState(() {
                          p99 = value;
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
                      p99 = 2;
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
                      groupValue: p99,
                      onChanged: (value){
                        setState(() {
                          p99 = value;
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
                      p99 = 98;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "KHÔNG NHỚ/KHÔNG BIẾT",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 98,
                      groupValue: p99,
                      onChanged: (value){
                        setState(() {
                          p99 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
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
                          p99ViewModel.P99Back();
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
                          p99ViewModel.P99Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c99: p99,
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