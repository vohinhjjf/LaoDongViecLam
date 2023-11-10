import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q2_viewmodel.dart';


class Q2View extends StatefulWidget {
  const Q2View({Key? key}) : super(key: key);

  @override
  State<Q2View> createState() => _Q2ViewState();
}

class _Q2ViewState extends State<Q2View> {
  late Q2ViewModel q2viewModel;
  int groupValue = 0;
  List<thongTinThanhVienNKTTModel> list = [];
  List<thongTinThanhVienNKTTModel> list_q2 = [];
  final _text_name = TextEditingController();
  String month = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q2viewModel = context.read();
      q2viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              groupValue = q2viewModel.data.q2_New ?? 0;
              list = q2viewModel.list;
              list_q2 = q2viewModel.list_q2;
              month = q2viewModel.data.thangDT.toString();
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
                  UIText(
                    text: UIQuestions.q2(month),
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    title: const UIText(
                      text: "Có",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
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
                      text: "Không",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
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
                        groupValue = groupValue == 2? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                      visible: groupValue == 1,
                      child: const UIText(
                        text: UIDescribes.personName,
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                      visible: groupValue == 1,
                      child: UITextFormField(
                        controller: _text_name,
                        onFieldSubmitted: (value){
                          if(value != "") {
                            if(value.length < 5){
                              showDialog(
                                  context: context,
                                  builder: (_) => UINotificationDialog(
                                      notification: 'Q2 Họ tên thành viên nhỏ hơn 5 ký tự có đúng không?',
                                      onpress: (){
                                        Navigator.of(context).pop();
                                        setState(() {
                                          list_q2.add(thongTinThanhVienNKTTModel(
                                              idtv: list_q2.length == 0
                                                  ? list.last.idtv! + 1
                                                  : list_q2.last.idtv! + 1,
                                              thangDT: int.parse(month),
                                              namDT: DateTime.now().year,
                                              q1_New: value,
                                              q2_New: 1
                                          ));
                                          _text_name.text = "";
                                        });
                                      }
                                  )
                              );
                            }
                            else {
                              setState(() {
                                list_q2.add(thongTinThanhVienNKTTModel(
                                    idtv: list_q2.length == 0
                                        ? list.last.idtv! + 1
                                        : list_q2.last.idtv! + 1,
                                    thangDT: int.parse(month),
                                    namDT: DateTime.now().year,
                                    q1_New: value,
                                    q2_New: 1
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
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                      visible: groupValue == 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list_q2.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                            elevation: 10,
                            shadowColor: Colors.black,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                _showName(list_q2[index].q1_New!, list_q2[index].idtv!, index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: UIText(
                                        text: "${index+1}. ${list_q2[index].q1_New}",
                                        textColor: Colors.black,
                                        textFontSize: 18,
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
                                            "Có chắc muốn xóa ${list_q2[index].q1_New}?",
                                                (){
                                              q2viewModel.deleteNTKK(list_q2[index].idtv!);
                                              setState(() {
                                                list_q2.removeAt(index);
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
                  ),
                  //Button
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: (){
                        q2viewModel.Q2Back();
                      }),
                      UINextButton(ontap: (){
                        if(groupValue == 0){
                          showDialog(
                              context: context,
                              builder: (_) => const UIWarningDialog(waring: 'Q2 nhập vào chưa đúng!',)
                          );
                        }
                        else if(groupValue == 2) {
                          if(list_q2.isNotEmpty){
                            for(var item in list_q2){
                              q2viewModel.deleteNTKK(item.idtv!);
                            }
                          }
                          q2viewModel.Q2Next(groupValue);
                        }
                        else {
                          if(list_q2.isEmpty){
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(waring: 'Q2-Họ tên thành viên nhập vào chưa đúng!',)
                            );
                          }
                          else{
                            print(list_q2.map((e) => e.toJson()).toList());
                            _showNotificationDialog("Hộ còn ai nữa không?",(){
                              Navigator.of(context).pop();
                            },() {
                              print("Next");
                              q2viewModel.addListNTKK(list_q2);
                              q2viewModel.Q2Next(groupValue);
                            },);
                          }
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
                    onPressed:  onpress1,
                    child: const UIText(
                        text: 'Có',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge
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
                      q2viewModel.updateName(thongTinThanhVienNKTTModel(
                          idtv: idtv,
                          q1_New: _name.text
                      ));
                      setState(() {
                        list_q2[stt].q1_New = _name.text;
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