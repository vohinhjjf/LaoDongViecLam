import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../components/uis.dart';
import 'operating_status_viewmodel.dart';

class OperatingStatusView extends StatefulWidget {
  const OperatingStatusView({Key? key}) : super(key: key);

  @override
  State<OperatingStatusView> createState() => _OperatingStatusViewState();
}

class _OperatingStatusViewState extends State<OperatingStatusView> {
  late OperatingStatusViewModel operatingStatusViewModel;
  int groupValue = 0;
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
          textFontSize: fontGreater,
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
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.active,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 1 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 1 ? 0 : 1;
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
                        groupValue = groupValue == 1 ? 0 : 1;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.notArea,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 2 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 2 ? 0 : 2;
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
                        groupValue = groupValue == 2 ? 0 : 2;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.notContact,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 6 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 6 ? 0 : 6;
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
                        groupValue = groupValue == 6 ? 0 : 6;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.moveTo,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 9 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 9 ? 0 : 9;
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
                        groupValue = groupValue == 9 ? 0 : 9;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(colors: [
                          mPrimaryColor,
                          Color(0xFF64B5F6),
                          mPrimaryColor,
                        ])),
                    child: MaterialButton(
                      onPressed: () {
                        if(groupValue == 0){
                          showDialog(
                              context: context,
                              builder: (_) => const UIWarningDialog(waring: 'Tình trạng hoạt động của hộ nhập vào chưa đúng!',)
                          );
                        }
                        else {
                          operatingStatusViewModel.operatingStatus(
                              groupValue);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: const UIText(
                        text: UIDescribes.next,
                        textAlign: TextAlign.center,
                        textColor: Colors.white,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
