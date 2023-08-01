import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import 'P08_09_viewmodel.dart';

class P08_09View extends StatefulWidget {
  const P08_09View({Key? key}) : super(key: key);

  @override
  State<P08_09View> createState() => _P08_09ViewState();
}

class _P08_09ViewState extends State<P08_09View> {
  late P08_09ViewModel p08_09ViewModel;
  final _name = "";
  int p08 = 0, p09 = 0, month = 0;

  var _honnhan = [
    "CHƯA VỢ/CHỒNG",
    "CÓ VỢ/CHỒNG",
    "GÓA",
    "LY HÔN",
    "LY THÂN",
  ];

  var _thuongtru = [
    "DƯỚI 1 THÁNG",
    "1 ĐẾN DƯỚI 6 THÁNG",
    "6 ĐẾN DƯỚI 12 THÁNG",
    "12 ĐẾN DƯỚI 5 NĂM",
    "5 NĂM TRỞ LÊN",
  ];

  @override
  void initState() {
    super.initState();
    p08_09ViewModel = context.read();
    p08_09ViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //UIGPSButton()
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
                UIText(
                  text: "P08. Tình trạng hôn nhân hiện nay của $_name là gì?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _honnhan.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          p08 = index+1;
                        });
                      },
                      child: ListTile(
                        title: UIText(
                          text: _honnhan[index].toString(),
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        leading: GFRadio(
                          type: GFRadioType.custom,
                          size: GFSize.LARGE,
                          activeBorderColor: Colors.black,
                          activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                          value: index+1,
                          groupValue: p08,
                          onChanged: (value) {
                            setState(() {
                              p08 = value;
                            });
                          },
                          inactiveIcon: null,
                          radioColor: Colors.indigo,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                //p09
                UIText(
                  text: "P09. $_name đã thường trú ở phường, thị trấn hay xã này được bao lâu?",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _thuongtru.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          p09 = index+1;
                        });
                      },
                      child: ListTile(
                        title: UIText(
                          text: _thuongtru[index].toString(),
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        leading: GFRadio(
                          type: GFRadioType.custom,
                          size: GFSize.LARGE,
                          activeBorderColor: Colors.black,
                          activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                          value: index+1,
                          groupValue: p09,
                          onChanged: (value) {
                            setState(() {
                              p09 = value;
                            });
                          },
                          inactiveIcon: null,
                          radioColor: Colors.indigo,
                        ),
                      ),
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
                          p08_09ViewModel.P08_09Next();
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