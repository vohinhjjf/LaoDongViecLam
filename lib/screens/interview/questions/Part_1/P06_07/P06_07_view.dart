import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import 'P06_07_viewmodel.dart';

class P06_07View extends StatefulWidget {
  const P06_07View({Key? key}) : super(key: key);

  @override
  State<P06_07View> createState() => _P06_07ViewState();
}

class _P06_07ViewState extends State<P06_07View> {
  late P06_07ViewModel p06_07viewmodel;
  int groupValue = 0, nation = 0;
  String _name = "";

  @override
  void initState() {
    super.initState();
    p06_07viewmodel = context.read();
    p06_07viewmodel.onInit(context);
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
                //p00
                UIText(
                  text: "P06. Hiện nay,$_name đang cư trú ở Việt Nam hay ở nước ngoài?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      groupValue = 1;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "Ở VIỆT NAM",
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
                      groupValue: groupValue,
                      onChanged: (value){
                        setState(() {
                          groupValue = value;
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
                      groupValue = 2;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "Ở NƯỚC NGOÀI",
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
                      groupValue: groupValue,
                      onChanged: (value){
                        setState(() {
                          groupValue = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: groupValue == 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText(
                        text: "P07. Tên và mã nước",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                      ),
                      const SizedBox(height: 10,),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: nation,
                          onChanged: (int? value) {
                            setState(() {
                              nation = value!;
                            });
                          },
                          items: const [ //add items in the dropdown
                            DropdownMenuItem(
                              value: 0,
                              child: Text("- - Chọn mã quốc gia - -"),
                            ),
                          ],
                      ),
                    ],
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
                          p06_07viewmodel.P06_07Back();
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
                          p06_07viewmodel.P06_07Next();
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