import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

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
              q4_a = q4viewModel.list_q4_a.isEmpty ? 2 : 1;
              q4_b = q4viewModel.list_q4_b.isEmpty ? 2 : 1;
              q4_c = q4viewModel.list_q4_c.isEmpty ? 2 : 1;
              q4_d = q4viewModel.list_q4_d.isEmpty ? 2 : 1;
              q4_e = q4viewModel.list_q4_e.isEmpty ? 2 : 1;
              q4_f = q4viewModel.list_q4_f.isEmpty ? 2 : 1;
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
        //iconTheme: const IconThemeData(color: mPrimaryColor),
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
                    text: UIQuestions.q4,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  // A
                  questionWidget(UIQuestions.q4a, q4_a, (value) {
                    setState(() {
                      q4_a = value;
                    });
                  }, _text_q4_a, 1, list_q4_a),
                  // B
                  questionWidget(UIQuestions.q4b, q4_b, (value) {
                    setState(() {
                      q4_b = value;
                    });
                  }, _text_q4_b, 2, list_q4_b),
                  // C
                  questionWidget(UIQuestions.q4c, q4_c, (value) {
                    setState(() {
                      q4_c = value;
                    });
                  }, _text_q4_c, 3, list_q4_c),
                  // D
                  questionWidget(UIQuestions.q4d, q4_d, (value) {
                    setState(() {
                      q4_d = value;
                    });
                  }, _text_q4_d, 4, list_q4_d),
                  // E
                  questionWidget(UIQuestions.q4e, q4_e, (value) {
                    setState(() {
                      q4_e = value;
                    });
                  }, _text_q4_e, 5, list_q4_e),
                  // F
                  questionWidget(UIQuestions.q4f, q4_f, (value) {
                    setState(() {
                      q4_f = value;
                    });
                  }, _text_q4_f, 6, list_q4_f),
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
                          q4viewModel.Q4Back();
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
                                builder: (_) => const UIWarningDialog(waring: 'Q4.A - Chưa nhập họ tên thành viên.',)
                            );
                          }
                          else if(q4_b == 1 && list_q4_b.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q4.B - Chưa nhập họ tên thành viên.',)
                            );
                          }
                          else if(q4_c == 1 && list_q4_c.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q4.C - Chưa nhập họ tên thành viên.',)
                            );
                          }
                          else if(q4_d == 1 && list_q4_d.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q4.D - Chưa nhập họ tên thành viên.',)
                            );
                          }
                          else if(q4_e == 1 && list_q4_e.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q4.E - Chưa nhập họ tên thành viên.',)
                            );
                          }
                          else if(q4_f == 1 && list_q4_f.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q4.F - Chưa nhập họ tên thành viên.',)
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
                            q4viewModel.Q4Next();
                          }
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

  Widget questionWidget(String title, int groupValue, Function(int)? onChanged,
      TextEditingController _text_name, int temp, List<thongTinThanhVienNKTTModel> list_item){
    return Column(
      children: [
        UIText(
          text: title,
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
              onChanged: onChanged,
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
              onChanged: onChanged,
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
          visible: groupValue == 1,
          child: const UIText(
            text: UIDescribes.personName,
            textColor: Colors.black,
            textFontSize: fontGreater,
            textAlign: TextAlign.start,
            isBold: false,
          ),
        ),
        const SizedBox(height: 5,),
        Visibility(
          visible: groupValue == 1,
          child: TextField(
            controller: _text_name,
            autofocus: true,
            onSubmitted: (value){
              q4viewModel.addNTKK(value, list[list.length-1].idtv! + 1, temp);
              setState(() {
                list_item.add(thongTinThanhVienNKTTModel(
                    idho: '99991001003',
                    idtv: list.last.idtv! + 1,
                    q1_New: value
                ));
                _text_name.text = "";
              });
            },
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: mPrimaryColor)),
              hintText: "Nhập họ và tên",
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Visibility(
          visible: groupValue == 1,
          child: ListView.builder(
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
                        child: Text(
                          "${index+1}. ${list_item[index].q1_New}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal
                          ),
                          maxLines: 10,
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          icon: const Icon(
                            Icons.dangerous,
                            color: Colors.redAccent,
                            size: fontGreater,
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
        ),
        const SizedBox(height: 10,),
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
            isBold: false,
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
                    child: const UIText(
                        text: 'Có',
                        textColor: mPrimaryColor,
                        textFontSize: fontMedium
                    ),
                    onPressed:  onpress1
                ),
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    child: const UIText(
                      text: 'Không',
                      textFontSize: fontMedium,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    ),
                    onPressed: onpress2
                )
              ],
            ),
          ),
        ));
  }
}