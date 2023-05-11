import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../components/uis.dart';
import 'Q3_viewmodel.dart';


class Q3View extends StatefulWidget {
  const Q3View({Key? key}) : super(key: key);

  @override
  State<Q3View> createState() => _Q3ViewState();
}

class _Q3ViewState extends State<Q3View> {
  late Q3ViewModel q3viewModel;
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    q3viewModel = context.read();
    q3viewModel.onInit(context);
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
          UIGPSButton()
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const UIText(
                    text: UIQuestions.q3,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const UIText(
                    text: UIQuestions.q3a,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
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
                        text: "Có",
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
                        onChanged: (value) {
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
                        text: "Không",
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
                        onChanged: (value) {
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
                ]),
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
                          q3viewModel.Q3Back();
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
                          q3viewModel.Q3Next();
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
      //drawer: const DrawerNavigation(),
    );
  }
}