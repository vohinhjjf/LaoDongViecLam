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
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  UIListTile(
                    text: UIDescribes.active,
                    check: groupValue == 5,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 5 ? 0 : 5;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 5 ? 0 : 5;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: UIDescribes.refuse,
                    check: groupValue == 2,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 2 ? 0 : 2;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: UIDescribes.notArea,
                    check: groupValue == 3,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 3 ? 0 : 3;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 3 ? 0 : 3;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: UIDescribes.notContact,
                    check: groupValue == 4,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 4 ? 0 : 4;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 4 ? 0 : 4;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: UIDescribes.moveTo,
                    check: groupValue == 6,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 6 ? 0 : 6;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 6 ? 0 : 6;
                      });
                    },
                  ),
                ]),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            minWidth: MediaQuery.of(context).size.width/2.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.navigate_next,
                  color: Colors.transparent,
                  size: 25,
                ),
                UIText(
                  text: UIDescribes.next,
                  textAlign: TextAlign.center,
                  textColor: Colors.white,
                  textFontSize: fontMedium,
                  isBold: true,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
