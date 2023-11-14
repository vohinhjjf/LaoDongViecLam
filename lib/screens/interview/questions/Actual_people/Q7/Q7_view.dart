import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q7_viewmodel.dart';


class Q7View extends StatefulWidget {
  const Q7View({Key? key}) : super(key: key);

  @override
  State<Q7View> createState() => _Q7ViewState();
}

class _Q7ViewState extends State<Q7View> {
  late Q7ViewModel q7viewModel;
  int groupValue = 0, stt = 0;
  String name = "";
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q7viewModel = context.read();
      q7viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list = q7viewModel.list;
              groupValue = q7viewModel.list.indexWhere((e) => e.q6_New == 1) + 1;
              for(var item in q7viewModel.list){
                if(item.q6_New == 1) {
                  stt = item.idtv ?? 0;
                }
              }
            })
          });
    });
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
          UIGPSButton(),
          UIEXITButton()
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const UIText(
                    text: UIQuestions.q7,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: UIText(
                          text: list[index].q1_New.toString(),
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        leading: RoundCheckBox(
                          isChecked: groupValue == index + 1 ? true : false,
                          onTap: (selected) {
                            setState(() {
                              groupValue = groupValue == index + 1 ? 0 : index + 1;
                              stt = list[index].idtv!;
                              name = list[index].q1_New!;
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
                        onTap: (){
                          setState(() {
                            groupValue = groupValue == index + 1 ? 0 : index + 1;
                            stt = list[index].idtv!;
                            name = list[index].q1_New!;
                          });
                        },
                      );
                    },
                  ),
                  //Button
                  const SizedBox(height: 90,),
                ]),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UIBackButton(ontap: (){
              q7viewModel.Q7Back();
            }),
            UINextButton(ontap: (){
              if(groupValue == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: 'Chủ hộ nhập vào chưa đúng!')
                );
              }else {
                print(stt);
                q7viewModel.Q7Next(stt);
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}