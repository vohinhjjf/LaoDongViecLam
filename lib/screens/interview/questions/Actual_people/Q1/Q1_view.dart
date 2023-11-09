import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q1_viewmodel.dart';


class Q1View extends StatefulWidget {
  const Q1View({Key? key}) : super(key: key);

  @override
  State<Q1View> createState() => _Q1ViewState();
}

class _Q1ViewState extends State<Q1View> {
  late Q1ViewModel q1viewModel;
  List<thongTinThanhVienNKTTModel> list_name = [];
  final _text_name = TextEditingController();
  String month = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q1viewModel = context.read();
      q1viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list_name = q1viewModel.list;
              month = q1viewModel.month;
              if(q1viewModel.list.isEmpty) {
                _text_name.text = q1viewModel.name;
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
                  UIText(
                    text: UIQuestions.q1(month),
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UITextFormField(
                    controller: _text_name,
                    onFieldSubmitted: (value){
                      if(value != "") {
                        if(value.length < 5){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                  notification: 'Q1 Họ tên thành viên nhỏ hơn 5 ký tự có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    q1viewModel.addNTKK(value,
                                        list_name.isEmpty ? 1 : list_name[list_name
                                            .length -
                                            1].idtv! + 1);
                                    setState(() {
                                      list_name.add(thongTinThanhVienNKTTModel(
                                        idtv: list_name.isEmpty ? 1 : list_name[list_name
                                            .length - 1].idtv! + 1,
                                        q1: '1',
                                        q1_New: value,
                                      ));
                                      _text_name.text = "";
                                    });
                                  }
                              )
                          );
                        }
                        else {
                          q1viewModel.addNTKK(value,
                              list_name.isEmpty ? 1 : list_name[list_name
                                  .length -
                                  1].idtv! + 1);
                          setState(() {
                            list_name.add(thongTinThanhVienNKTTModel(
                              idtv: list_name.isEmpty ? 1 : list_name[list_name
                                  .length - 1].idtv! + 1,
                              q1: '1',
                              q1_New: value,
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
                    itemCount: list_name.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                        elevation: 10,
                        shadowColor: Colors.black,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            _showName(list_name[index].q1_New!, list_name[index].idtv!, index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: UIText(
                                    text: "${index+1}. ${list_name[index].q1_New}",
                                    textColor: Colors.black,
                                    textFontSize: 18,
                                    maxLines: 3,
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
                                        "Có chắc muốn xóa ${list_name[index].q1_New} có id = ${list_name[index].idtv}?",
                                            (){
                                          q1viewModel.deleteNTKK(list_name[index].idtv!);
                                          setState(() {
                                            list_name.removeAt(index);
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
                        ),
                      );
                    },
                  ),
                  //Button
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        q1viewModel.Q1Back();
                      }),
                      UINextButton(ontap: (){
                        if(list_name.isNotEmpty){
                          _showNotificationDialog("Hộ còn ai nữa không?",(){
                            Navigator.of(context).pop();
                          },() {
                            print(list_name[list_name.length - 1].idtv! + 1);
                            q1viewModel.Q1Next();

                          },);
                        }
                        else {
                          q1viewModel.addNTKK(_text_name.text, list_name.isEmpty ? 1 : list_name[list_name.length - 1].idtv! + 1);
                          setState(() {
                            list_name.add(thongTinThanhVienNKTTModel(
                                idtv: list_name.isEmpty ? 1 : list_name[list_name.length - 1].idtv! + 1,
                                q1_New: _text_name.text
                            ));
                            _text_name.text = "";
                            _showNotificationDialog("Hộ còn ai nữa không?",(){
                              Navigator.of(context).pop();
                            },() {
                              print("Next");
                              q1viewModel.Q1Next();
                            },);
                          });
                        }
                      }),
                    ],
                  )
                ]),
          ),
        ],
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
            isBold: true,
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
                    onPressed: onpress1,
                    child: const UIText(
                        text: 'Có',
                        textFontSize: fontLarge,
                        textAlign: TextAlign.center,
                        textColor: mPrimaryColor,
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

  _showName(String name, int idtv, int stt){
    var _name = TextEditingController();
    _name.text = name;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: TextField(
            controller: _name,
            textCapitalization: TextCapitalization.words,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(
                  '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
              FilteringTextInputFormatter.deny(RegExp('[×÷]')),
            ],
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: mPrimaryColor)),
            ),
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
                        text: 'Đồng ý',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                      isBold: true,
                    ),
                    onPressed: (){
                      q1viewModel.updateName(thongTinThanhVienNKTTModel(
                        idtv: idtv,
                        q1_New: _name.text
                      ));
                      setState(() {
                        list_name[stt].q1_New = _name.text;
                      });
                      Navigator.of(context).pop();
                    }
                ),
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    child: const UIText(
                      text: 'Hủy',
                      textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
                )
              ],
            ),
          ),
        )
    );
  }
}