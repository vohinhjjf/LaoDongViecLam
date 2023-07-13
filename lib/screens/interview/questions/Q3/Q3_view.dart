import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../components/uis.dart';
import '../../../../models/thongTinThanhVienNKTT_model.dart';
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
          const Duration(milliseconds: 300),
              () => {
            setState(() {
              list = q3viewModel.list;
              q3_a = q3viewModel.q3_a;
              q3_b = q3viewModel.q3_b;
              q3_c = q3viewModel.q3_c;
              q3_d = q3viewModel.q3_d;
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
                  //a
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
                        q3_a = 1;
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
                        groupValue: q3_a,
                        onChanged: (value) {
                          setState(() {
                            q3_a = value;
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
                        q3_a = 2;
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
                        groupValue: q3_a,
                        onChanged: (value) {
                          setState(() {
                            q3_a = value;
                            list.map((e) => e.q3A_New = null).toList();
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: q3_a == 1,
                    child: ListBody(
                      children: list
                          .map((item) {
                          if(item.q3B_New == null && item.q3C_New == null
                              && item.q3D_New == null) {
                            return GFCheckboxListTile(
                              value: item.q3A_New == null ? false : true,
                              title: UIText(
                                text: item.q1_New!,
                                textColor: Colors.black,
                                textFontSize: fontMedium,
                                textAlign: TextAlign.start,
                              ),
                              margin: const EdgeInsets.only(left: 16),
                              position: GFPosition.start,
                              onChanged: (isChecked) {
                                setState(() {
                                  if (isChecked) {
                                    item.q3A_New = 1;
                                  } else {
                                    item.q3A_New = null;
                                  }
                                });
                              },
                            );
                          }
                          return Container();
                        }
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //b
                  const UIText(
                    text: UIQuestions.q3b,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        q3_b = 1;
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
                        groupValue: q3_b,
                        onChanged: (value) {
                          setState(() {
                            q3_b = value;
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
                        q3_b = 2;
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
                        groupValue: q3_b,
                        onChanged: (value) {
                          setState(() {
                            q3_b = value;
                            list.map((e) => e.q3B_New = null).toList();
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: q3_b == 1,
                    child: ListBody(
                      children: list
                          .map((item) {
                        if(item.q3A_New == null && item.q3C_New == null
                            && item.q3D_New == null) {
                          return GFCheckboxListTile(
                            value: item.q3B_New == null ? false : true,
                            title: UIText(
                              text: item.q1_New!,
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            ),
                            margin: const EdgeInsets.only(left: 16),
                            position: GFPosition.start,
                            onChanged: (isChecked) {
                              setState(() {
                                if (isChecked) {
                                  item.q3B_New = 1;
                                } else {
                                  item.q3B_New = null;
                                }
                              });
                            },
                          );
                        }
                        return Container();
                      }
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //c
                  const UIText(
                    text: UIQuestions.q3c,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        q3_c = 1;
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
                        groupValue: q3_c,
                        onChanged: (value) {
                          setState(() {
                            q3_c = value;
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
                        q3_c = 2;
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
                        groupValue: q3_c,
                        onChanged: (value) {
                          setState(() {
                            q3_c = value;
                            list.map((e) => e.q3C_New = null).toList();
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: q3_c == 1,
                    child: ListBody(
                      children: list
                          .map((item) {
                        if(item.q3A_New == null && item.q3B_New == null
                            && item.q3D_New == null) {
                          return GFCheckboxListTile(
                            value: item.q3C_New == null ? false : true,
                            title: UIText(
                              text: item.q1_New!,
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            ),
                            margin: const EdgeInsets.only(left: 16),
                            position: GFPosition.start,
                            onChanged: (isChecked) {
                              setState(() {
                                if (isChecked) {
                                  item.q3C_New = 1;
                                } else {
                                  item.q3C_New = null;
                                }
                              });
                            },
                          );
                        }
                        return Container();
                      }
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //d
                  const UIText(
                    text: UIQuestions.q3d,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        q3_d = 1;
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
                        groupValue: q3_d,
                        onChanged: (value) {
                          setState(() {
                            q3_d = value;
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
                        q3_d = 2;
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
                        groupValue: q3_d,
                        onChanged: (value) {
                          setState(() {
                            q3_d = value;
                            list.map((e) => e.q3D_New = null).toList();
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: q3_d == 1,
                    child: ListBody(
                      children: list
                          .map((item) {
                        if(item.q3A_New == null && item.q3B_New == null
                            && item.q3C_New == null) {
                          return GFCheckboxListTile(
                            value: item.q3D_New == null ? false : true,
                            title: UIText(
                              text: item.q1_New!,
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              textAlign: TextAlign.start,
                            ),
                            margin: const EdgeInsets.only(left: 16),
                            position: GFPosition.start,
                            onChanged: (isChecked) {
                              setState(() {
                                if (isChecked) {
                                  item.q3D_New = 1;
                                } else {
                                  item.q3D_New = null;
                                }
                              });
                            },
                          );
                        }
                        return Container();
                      }
                      )
                          .toList(),
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
                          q3viewModel.Q3Next(list);
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