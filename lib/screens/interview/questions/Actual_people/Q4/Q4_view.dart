import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q4_viewmodel.dart';

class Q4View extends StatefulWidget {
  const Q4View({Key? key}) : super(key: key);

  @override
  State<Q4View> createState() => _Q4ViewState();
}

class _Q4ViewState extends State<Q4View> {
  late Q4ViewModel q4viewModel;
  int q4_a = 0, q4_b =0, q4_c = 0, q4_d = 0, q4_e = 0, q4_f = 0;
  List<thongTinThanhVienNKTTModel> list = [], list_q4_a = [], list_q4_b = [],
      list_q4_c = [], list_q4_d = [], list_q4_e = [], list_q4_f = [];
  final _text_q4_a = TextEditingController();
  final _text_q4_b = TextEditingController();
  final _text_q4_c = TextEditingController();
  final _text_q4_d = TextEditingController();
  final _text_q4_e = TextEditingController();
  final _text_q4_f = TextEditingController();
  String month = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q4viewModel = context.read();
      q4viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list = q4viewModel.list;
              list_q4_a = q4viewModel.list_q4_a;
              list_q4_b = q4viewModel.list_q4_b;
              list_q4_c = q4viewModel.list_q4_c;
              list_q4_d = q4viewModel.list_q4_d;
              list_q4_e = q4viewModel.list_q4_e;
              list_q4_f = q4viewModel.list_q4_f;
              q4_a = q4viewModel.data.q4A_New ?? 0;
              q4_b = q4viewModel.data.q4B_New ?? 0;
              q4_c = q4viewModel.data.q4C_New ?? 0;
              q4_d = q4viewModel.data.q4D_New ?? 0;
              q4_e = q4viewModel.data.q4E_New ?? 0;
              q4_f = q4viewModel.data.q4F_New ?? 0;
              month = q4viewModel.data.thangDT.toString();
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
                  UIText(
                    text: UIQuestions.q4(month),
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  // A
                  questionWidget(UIQuestions.q4a, q4_a,
                          (value){
                            setState(() {
                              q4_a = q4_a == 1 ? 0 : 1;
                            });
                          },
                          (){
                            setState(() {
                              q4_a = q4_a == 1 ? 0 : 1;
                            });
                          },
                          (value){
                            setState(() {
                              q4_a = q4_a == 2 ? 0 : 2;
                            });
                          },
                          (){
                            setState(() {
                              q4_a = q4_a == 2 ? 0 : 2;
                            });
                          },
                      _text_q4_a, 1, list_q4_a),
                  // B
                  questionWidget(UIQuestions.q4b, q4_b,
                          (value){
                        setState(() {
                          q4_b = q4_b == 1 ? 0 : 1;
                        });
                      },
                          (){
                        setState(() {
                          q4_b = q4_b == 1 ? 0 : 1;
                        });
                      },
                          (value){
                        setState(() {
                          q4_b = q4_b == 2 ? 0 : 2;
                        });
                      },
                          (){
                        setState(() {
                          q4_b = q4_b == 2 ? 0 : 2;
                        });
                      },
                      _text_q4_b, 2, list_q4_b),
                  // C
                  questionWidget(UIQuestions.q4c, q4_c,
                          (value){
                        setState(() {
                          q4_c = q4_c == 1 ? 0 : 1;
                        });
                      },
                          (){
                        setState(() {
                          q4_c = q4_c == 1 ? 0 : 1;
                        });
                      },
                          (value){
                        setState(() {
                          q4_c = q4_c == 2 ? 0 : 2;
                        });
                      },
                          (){
                        setState(() {
                          q4_c = q4_c == 2 ? 0 : 2;
                        });
                      },
                      _text_q4_c, 3, list_q4_c),
                  // D
                  questionWidget(UIQuestions.q4d, q4_d,
                          (value){
                        setState(() {
                          q4_d = q4_d == 1 ? 0 : 1;
                        });
                      },
                          (){
                        setState(() {
                          q4_d = q4_d == 1 ? 0 : 1;
                        });
                      },
                          (value){
                        setState(() {
                          q4_d = q4_d == 2 ? 0 : 2;
                        });
                      },
                          (){
                        setState(() {
                          q4_d = q4_d == 2 ? 0 : 2;
                        });
                      },
                      _text_q4_d, 4, list_q4_d),
                  // E
                  questionWidget(UIQuestions.q4e, q4_e,
                          (value){
                        setState(() {
                          q4_e = q4_e == 1 ? 0 : 1;
                        });
                      },
                          (){
                        setState(() {
                          q4_e = q4_e == 1 ? 0 : 1;
                        });
                      },
                          (value){
                        setState(() {
                          q4_e = q4_e == 2 ? 0 : 2;
                        });
                      },
                          (){
                        setState(() {
                          q4_e = q4_e == 2 ? 0 : 2;
                        });
                      },
                      _text_q4_e, 5, list_q4_e),
                  // F
                  questionWidget(UIQuestions.q4f, q4_f,
                          (value){
                        setState(() {
                          q4_f = q4_f == 1 ? 0 : 1;
                        });
                      },
                          (){
                        setState(() {
                          q4_f = q4_f == 1 ? 0 : 1;
                        });
                      },
                          (value){
                        setState(() {
                          q4_f = q4_f == 2 ? 0 : 2;
                        });
                      },
                          (){
                        setState(() {
                          q4_f = q4_f == 2 ? 0 : 2;
                        });
                      },
                      _text_q4_f, 6, list_q4_f),
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
              q4viewModel.Q4Back();
            }),
            UINextButton(ontap: (){
              if(q4_a == 0 || q4_b == 0 || q4_c == 0 || q4_d == 0 ||
                  q4_e == 0 || q4_f == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4 nhập vào chưa đúng!',)
                );
              }
              else if (q4_a == 1 && list_q4_a.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4A-Chưa nhập họ tên thành viên.',)
                );
              }
              else if(q4_b == 1 && list_q4_b.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4B-Chưa nhập họ tên thành viên.',)
                );
              }
              else if(q4_c == 1 && list_q4_c.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4C-Chưa nhập họ tên thành viên.',)
                );
              }
              else if(q4_d == 1 && list_q4_d.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4D-Chưa nhập họ tên thành viên.',)
                );
              }
              else if(q4_e == 1 && list_q4_e.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4E-Chưa nhập họ tên thành viên.',)
                );
              }
              else if(q4_f == 1 && list_q4_f.isEmpty){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q4F-Chưa nhập họ tên thành viên.',)
                );
              }
              else {
                if(q4_a == 2){
                  for(var item in list_q4_a){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                if(q4_b == 2){
                  for(var item in list_q4_b){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                if(q4_c == 2){
                  for(var item in list_q4_c){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                if(q4_d == 2){
                  for(var item in list_q4_d){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                if(q4_e == 2){
                  for(var item in list_q4_e){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                if(q4_f == 2){
                  for(var item in list_q4_f){
                    q4viewModel.deleteNTKK(item.idtv!);
                  };
                }
                q4viewModel.Q4Next(q4_a, q4_b, q4_c, q4_d, q4_e, q4_f);
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

  Widget questionWidget(String title, int groupValue, Function(bool?)? onTap1, Function()? onTap2,
  Function(bool?)? onTap3, Function()? onTap4, TextEditingController _text_name,
      int temp, List<thongTinThanhVienNKTTModel> list_item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText(
          text: title,
          textColor: Colors.black,
          textFontSize: fontLarge,
          textAlign: TextAlign.start,
          isBold: false,
        ),
        const SizedBox(height: 10,),
        UIListTile(
          text: "Có",
          check: groupValue == 1,
          onTap1: onTap1,
          onTap2: onTap2,
        ),
        const SizedBox(height: 10,),
        UIListTile(
          text: "Không",
          check: groupValue == 2,
          onTap1: onTap3,
          onTap2: onTap4,
        ),
        const SizedBox(height: 10,),
        Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 5,),
        Visibility(
          visible: groupValue == 1,
          child: const UIText(
            text: UIDescribes.personName,
            textColor: Colors.black,
            textFontSize: fontMedium,
            textAlign: TextAlign.start,
            isBold: false,
          ),
        ),
        const SizedBox(height: 10,),
        Visibility(
          visible: groupValue == 1,
          child: Column(
            children: [
              UITextFormField(
                controller: _text_name,
                onFieldSubmitted: (value){
                  if(value != "") {
                    if(value.length < 5){
                      showDialog(
                          context: context,
                          builder: (_) => UINotificationDialog(
                              notification: 'Q4${title.substring(0,1)} Họ tên thành viên nhỏ hơn 5 ký tự có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                q4viewModel.addNTKK(value, list.last.idtv! + 1, temp);
                                setState(() {
                                  list.add(thongTinThanhVienNKTTModel(
                                      idtv: list.last.idtv! + 1,
                                      thangDT: int.parse(month),
                                      namDT: DateTime.now().year,
                                      q1_New: value
                                  ));
                                  list_item.add(thongTinThanhVienNKTTModel(
                                      idtv: list.last.idtv! + 1,
                                      thangDT: int.parse(month),
                                      namDT: DateTime.now().year,
                                      q1_New: value
                                  ));
                                  _text_name.text = "";
                                });
                              }
                          )
                      );
                    }
                    else {
                      q4viewModel.addNTKK(value, list.last.idtv! + 1, temp);
                      setState(() {
                        list.add(thongTinThanhVienNKTTModel(
                            idtv: list.last.idtv! + 1,
                            thangDT: int.parse(month),
                            namDT: DateTime.now().year,
                            q1_New: value
                        ));
                        list_item.add(thongTinThanhVienNKTTModel(
                            idtv: list.last.idtv! + 1,
                            thangDT: int.parse(month),
                            namDT: DateTime.now().year,
                            q1_New: value
                        ));
                        _text_name.text = "";
                      });
                    }
                  }
                },
                textCapitalization: TextCapitalization.words,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                  FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                ],
                keyboardType: TextInputType.text,
                hint: "Nhập họ và tên",
              ),
              const SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list_item.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 212.w,
                            child: UIText(
                              text: "${index+1}. ${list_item[index].q1_New}",
                              textColor: Colors.black,
                              textFontSize: fontMedium,
                              maxLines: 10,
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              icon: const Icon(
                                Icons.dangerous,
                                color: Colors.redAccent,
                                size: fontLarge,
                              ),
                              onPressed: () => _showNotificationDialog(
                                  "Có chắc muốn xóa ${list_item[index].q1_New}?",
                                      (){
                                    q4viewModel.deleteNTKK(list_item[index].idtv!);
                                    setState(() {
                                      list_item.removeAt(index);
                                    });
                                    Navigator.of(context).pop();
                                  }, (){
                                Navigator.of(context).pop();
                              }
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }

  _showNotificationDialog(String title, Function() onpress1, Function() onpress2){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
            text: title,
            textColor: Colors.black,
            textFontSize:fontLarge,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 60,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed:  onpress1,
                    child: const UIText(
                        text: 'Có',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.center,
                      isBold: true,
                    )
                ),
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed: onpress2,
                    child: const UIText(
                      text: 'Không',
                      textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    )
                )
              ],
            ),
          ),
        ));
  }
}