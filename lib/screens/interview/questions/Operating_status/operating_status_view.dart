import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../components/uis.dart';
import '../../../../models/bangke_model.dart';
import 'operating_status_viewmodel.dart';

class OperatingStatusView extends StatefulWidget {
  const OperatingStatusView({Key? key}) : super(key: key);

  @override
  State<OperatingStatusView> createState() => _OperatingStatusViewState();
}

class _OperatingStatusViewState extends State<OperatingStatusView> {
  late OperatingStatusViewModel operatingStatusViewModel;
  int groupValue = 0;
  var bangkeho = BangKeCsModel();
  int? get index => null;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      operatingStatusViewModel = context.read();
      operatingStatusViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          bangkeho = operatingStatusViewModel.bangkeho;
          switch(bangkeho.trangthai_BK){
            case 1: groupValue = 0; break;
            case 2: groupValue = 2; break;
            case 3: groupValue = 3; break;
            case 4: groupValue = 4; break;
            case 5: groupValue = 5; break;
            case 6: groupValue = 6; break;
          }
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
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.active,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 5 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 5 ? 0 : 5;
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
                        groupValue = groupValue == 5 ? 0 : 5;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: UIDescribes.refuse,
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
                      text: UIDescribes.notArea,
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: groupValue == 3 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          groupValue = groupValue == 3 ? 0 : 3;
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
                        groupValue = groupValue == 3 ? 0 : 3;
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
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
                              builder: (_) => const UIWarningDialog(waring: 'Tình trạng hoạt động của hộ nhập vào chưa đúng!')
                          );
                        }
                        else {
                          operatingStatusViewModel.operatingStatus(bangkeho,
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
