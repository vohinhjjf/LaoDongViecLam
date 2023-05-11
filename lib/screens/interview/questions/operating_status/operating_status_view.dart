import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../../../../components/uis.dart';
import 'operating_status_viewmodel.dart';

class OperatingStatusView extends StatefulWidget {
  const OperatingStatusView({Key? key}) : super(key: key);

  @override
  State<OperatingStatusView> createState() => _OperatingStatusViewState();
}

class _OperatingStatusViewState extends State<OperatingStatusView> {
  late OperatingStatusViewModel operatingStatusViewModel;
  int groupValue = 1;
  int? get index => null;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      operatingStatusViewModel = context.read();
      operatingStatusViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          groupValue = operatingStatusViewModel.status;
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => operatingStatusViewModel.operatingStatusBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.statusActive,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      setState(() {
                        groupValue = 1;
                      });
                    },
                    child: ListTile(
                      title: const UIText(
                        text: UIDescribes.active,
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
                        groupValue = 5;
                      });
                    },
                    child: ListTile(
                      title: const UIText(
                        text: UIDescribes.notArea,
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                      ),
                      leading: GFRadio(
                        type: GFRadioType.custom,
                        activeBorderColor: Colors.black,
                        activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        size: GFSize.LARGE,
                        value: 5,
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
                        groupValue = 6;
                      });
                    },
                    child: ListTile(
                      title: const UIText(
                        text: UIDescribes.notContact,
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                      ),
                      leading: GFRadio(
                        type: GFRadioType.custom,
                        activeBorderColor: Colors.black,
                        activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        size: GFSize.LARGE,
                        value: 6,
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
                        groupValue = 9;
                      });
                    },
                    child: ListTile(
                      title: const UIText(
                        text: UIDescribes.moveTo,
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                      ),
                      leading: GFRadio(
                        type: GFRadioType.custom,
                        activeBorderColor: Colors.black,
                        activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        size: GFSize.LARGE,
                        value: 9,
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
                ]),
          ),
          SizedBox(
            height: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.black54, width: 2))),
                      child: IconButton(
                        onPressed: () {
                          operatingStatusViewModel.operatingStatus(groupValue);
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
