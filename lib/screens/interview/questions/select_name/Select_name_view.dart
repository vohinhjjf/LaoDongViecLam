import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../../../components/uis.dart';
import 'Select_name_viewmodel.dart';

class SelectNameView extends StatefulWidget {
  const SelectNameView({Key? key}) : super(key: key);

  @override
  State<SelectNameView> createState() => _SelectNameViewState();
}

class _SelectNameViewState extends State<SelectNameView> {
  late SelectNameViewModel selectNameViewModel;
  int groupValue = 20;
  List<String> list_name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: mPrimaryColor),
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
            padding: const EdgeInsets.fromLTRB(35, 25, 35, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: UIText(
                      text: "Đó là những ai",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
                      textAlign: TextAlign.start,
                      isBold: true,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: list_name.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            groupValue = index;
                          });
                        },
                        child: ListTile(
                          title: UIText(
                            text: list_name[index],
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: GFRadio(
                            type: GFRadioType.custom,
                            size: GFSize.LARGE,
                            activeBorderColor: Colors.black,
                            activeIcon: const Icon(Icons.check,
                                size: 30, color: GFColors.PRIMARY),
                            value: index,
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
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  )
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