import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P08_09_viewmodel.dart';

class P08_09View extends StatefulWidget {
  const P08_09View({Key? key}) : super(key: key);

  @override
  State<P08_09View> createState() => _P08_09ViewState();
}

class _P08_09ViewState extends State<P08_09View> {
  late P08_09ViewModel p08_09ViewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  int p08 = 0, p09 = 0, month = 0;

  final _honnhan = [
    "CHƯA VỢ/CHỒNG",
    "CÓ VỢ/CHỒNG",
    "GÓA",
    "LY HÔN",
    "LY THÂN",
  ];

  final _thuongtru = [
    "DƯỚI 1 THÁNG",
    "1 ĐẾN DƯỚI 6 THÁNG",
    "6 ĐẾN DƯỚI 12 THÁNG",
    "12 ĐẾN DƯỚI 5 NĂM",
    "5 NĂM TRỞ LÊN",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p08_09ViewModel = context.read();
      p08_09ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p08_09ViewModel.thanhvien;
              p08 = p08_09ViewModel.thanhvien.c07 ?? 0;
              p09 = p08_09ViewModel.thanhvien.c08 ?? 0;
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
                //p08
                UIRichText(
                  text1: "P08. Tình trạng hôn nhân hiện nay của ",
                  text2: thanhvien.c00 ?? "",
                  text3: " là gì?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _honnhan.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _honnhan[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p08 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p08 = p08 == index+1 ? 0 : index+1;
                          });
                        },
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        checkedColor: Colors.white,
                        checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        uncheckedColor: Colors.white,
                        uncheckedWidget: Container(),
                      ),
                      onTap: () {
                        setState(() {
                          p08 = p08 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                //p09
                UIRichText(
                  text1: "P09. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã thường trú ở phường, thị trấn hay xã này được bao lâu?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _thuongtru.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thuongtru[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p09 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p09 = p09 == index+1 ? 0 : index+1;
                          });
                        },
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        checkedColor: Colors.white,
                        checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        uncheckedColor: Colors.white,
                        uncheckedWidget: Container(),
                      ),
                      onTap: () {
                        setState(() {
                          p09 = p09 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
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
                          p08_09ViewModel.P08_09Back();
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
                          if(p08 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P08 - Tình trạng hôn nhân nhập vào chưa đúng!',)
                            );
                          }else if(p09 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thời gian thường trú nhập vào chưa đúng!',)
                            );
                          } else if(thanhvien.c01 == 2 && (p08 == 1 || p08 == 3 || p08 == 4)){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành '
                                    'viên ${thanhvien.c00} có P01 - Quan hệ với '
                                    'chủ hộ là vợ/chồng mà tình trạng hôn nhân '
                                    'là ${_honnhan[p08-1]}. Kiểm tra lại!',)
                            );
                          } else if(thanhvien.c01 == 5 && p08 == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành '
                                    'viên ${thanhvien.c00} có P01 - Quan hệ với '
                                    'chủ hộ là bố/mẹ mà tình trạng hôn nhân '
                                    'là ${_honnhan[p08-1]}. Kiểm tra lại!',)
                            );
                          } else {
                            p08_09ViewModel.P08_09Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c07: p08,
                              c08: p09,
                            ));
                          }
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