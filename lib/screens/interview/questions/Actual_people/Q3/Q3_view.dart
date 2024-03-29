import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q3_viewmodel.dart';


class Q3View extends StatefulWidget {
  const Q3View({Key? key}) : super(key: key);

  @override
  State<Q3View> createState() => _Q3ViewState();
}

class _Q3ViewState extends State<Q3View> {
  late Q3ViewModel q3viewModel;
  int q3_a = 0, q3_b =0, q3_c = 0, q3_d = 0;
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q3viewModel = context.read();
      q3viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              list = q3viewModel.list;
              q3_a = q3viewModel.data.q3A_New ?? 0;
              q3_b = q3viewModel.data.q3B_New ?? 0;
              q3_c = q3viewModel.data.q3C_New ?? 0;
              q3_d = q3viewModel.data.q3D_New ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //a
                  const UIText(
                    text: UIQuestions.q3,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  const UIText(
                    text: UIQuestions.q3a,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UIListTile(
                    text: "Có",
                    check: q3_a == 1,
                    onTap1: (value){
                      setState(() {
                        q3_a = q3_a == 1 ? 0 : 1;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_a = q3_a == 1 ? 0 : 1;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: "Không",
                    check: q3_a == 2,
                    onTap1: (value){
                      setState(() {
                        q3_a = q3_a == 2 ? 0 : 2;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_a = q3_a == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: q3_a == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Đó là những ai:",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        ListBody(
                          children: list
                              .map((item) {
                            if(item.q3B_New == null && item.q3C_New == null
                                && item.q3D_New == null) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 15),
                                title: UIText(
                                  text: item.q1_New!,
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                ),
                                leading: GFRadio(
                                  type: GFRadioType.custom,
                                  size: GFSize.LARGE,
                                  activeBorderColor: Colors.black,
                                  activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                                  value: 1,
                                  groupValue: item.q3A_New,
                                  onChanged: (value) {
                                    setState(() {
                                      item.q3A_New = item.q3A_New == 1 ? null : 1;
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: Colors.indigo,
                                ),
                                onTap: (){
                                  setState(() {
                                    item.q3A_New = item.q3A_New == 1 ? null : 1;
                                  });
                                },
                              );
                            }
                            return Container();
                          }
                          )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //b
                  const UIText(
                    text: UIQuestions.q3b,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UIListTile(
                    text: "Có",
                    check: q3_b == 1,
                    onTap1: (value){
                      setState(() {
                        q3_b = q3_b == 1 ? 0 : 1;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_b = q3_b == 1 ? 0 : 1;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: "Không",
                    check: q3_b == 2,
                    onTap1: (value){
                      setState(() {
                        q3_b = q3_b == 2 ? 0 : 2;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_b = q3_b == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: q3_b == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Đó là những ai:",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        ListBody(
                          children: list
                              .map((item) {
                            if(item.q3A_New == null && item.q3C_New == null
                                && item.q3D_New == null) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 15),
                                title: UIText(
                                  text: item.q1_New!,
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                ),
                                leading: GFRadio(
                                  type: GFRadioType.custom,
                                  size: GFSize.LARGE,
                                  activeBorderColor: Colors.black,
                                  activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                                  value: 1,
                                  groupValue: item.q3B_New,
                                  onChanged: (value) {
                                    setState(() {
                                      item.q3B_New = item.q3B_New == 1 ? null : 1;
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: Colors.indigo,
                                ),
                                onTap: (){
                                  setState(() {
                                    item.q3B_New = item.q3B_New == 1 ? null : 1;
                                  });
                                },
                              );
                            }
                            return Container();
                          }
                          )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //c
                  const UIText(
                    text: UIQuestions.q3c,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UIListTile(
                    text: "Có",
                    check: q3_c == 1,
                    onTap1: (value){
                      setState(() {
                        q3_c = q3_c == 1 ? 0 : 1;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_c = q3_c == 1 ? 0 : 1;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: "Không",
                    check: q3_c == 2,
                    onTap1: (value){
                      setState(() {
                        q3_c = q3_c == 2 ? 0 : 2;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_c = q3_c == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: q3_c == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Đó là những ai:",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        ListBody(
                          children: list
                              .map((item) {
                            if(item.q3A_New == null && item.q3B_New == null
                                && item.q3D_New == null) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 15),
                                title: UIText(
                                  text: item.q1_New!,
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                ),
                                leading: GFRadio(
                                  type: GFRadioType.custom,
                                  size: GFSize.LARGE,
                                  activeBorderColor: Colors.black,
                                  activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                                  value: 1,
                                  groupValue: item.q3C_New,
                                  onChanged: (value) {
                                    setState(() {
                                      item.q3C_New = item.q3C_New == 1 ? null : 1;
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: Colors.indigo,
                                ),
                                onTap: (){
                                  setState(() {
                                    item.q3C_New = item.q3C_New == 1 ? null : 1;
                                  });
                                },
                              );
                            }
                            return Container();
                          }
                          )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //d
                  const UIText(
                    text: UIQuestions.q3d,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UIListTile(
                    text: "Có",
                    check: q3_d == 1,
                    onTap1: (value){
                      setState(() {
                        q3_d = q3_d == 1 ? 0 : 1;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_d = q3_d == 1 ? 0 : 1;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: "Không",
                    check: q3_d == 2,
                    onTap1: (value){
                      setState(() {
                        q3_d = q3_d == 2 ? 0 : 2;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        q3_d = q3_d == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: q3_d == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UIText(
                          text: "Đó là những ai:",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        ListBody(
                          children: list
                              .map((item) {
                            if(item.q3A_New == null && item.q3C_New == null
                                && item.q3B_New == null) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 15),
                                title: UIText(
                                  text: item.q1_New!,
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                ),
                                leading: GFRadio(
                                  type: GFRadioType.custom,
                                  size: GFSize.LARGE,
                                  activeBorderColor: Colors.black,
                                  activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                                  value: 1,
                                  groupValue: item.q3D_New,
                                  onChanged: (value) {
                                    setState(() {
                                      item.q3D_New = item.q3D_New == 1 ? null : 1;
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: Colors.indigo,
                                ),
                                onTap: (){
                                  setState(() {
                                    item.q3D_New = item.q3D_New == 1 ? null : 1;
                                  });
                                },
                              );
                            }
                            return Container();
                          }
                          )
                              .toList(),
                        )
                      ],
                    ),
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
              q3viewModel.Q3Back();
            }),
            UINextButton(ontap: (){
              if(q3_a == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3A chưa được chọn!',)
                );
              }
              else if(q3_b == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3B chưa được chọn!',)
                );
              }
              else if(q3_c == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3C chưa được chọn!',)
                );
              }
              else if(q3_d == 0) {
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3D chưa được chọn!',)
                );
              }
              else if(q3_a == 1 && !list.any((e) => e.q3A_New == 1)){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3A chưa chọn thành viên!',)
                );
              }
              else if(q3_b == 1 && !list.any((e) => e.q3B_New == 1)){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3B chưa chọn thành viên!',)
                );
              }
              else if(q3_c == 1 && !list.any((e) => e.q3C_New == 1)){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3C chưa chọn thành viên!',)
                );
              }
              else if(q3_d == 1 && !list.any((e) => e.q3D_New == 1)){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q3D chưa chọn thành viên!',)
                );
              }
              else {
                q3viewModel.Q3Next(list, q3_a, q3_b, q3_c, q3_d);
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}