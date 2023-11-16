import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'Q5_viewmodel.dart';


class Q5View extends StatefulWidget {
  const Q5View({Key? key}) : super(key: key);

  @override
  State<Q5View> createState() => _Q5ViewState();
}

class _Q5ViewState extends State<Q5View> {
  late Q5ViewModel q5viewModel;
  int groupValue = 0;
  List<thongTinThanhVienNKTTModel> list = [];
  List<thongTinThanhVienNKTTModel> list_q5 = [];
  final _text_name = TextEditingController();
  String month = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q5viewModel = context.read();
      q5viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list = q5viewModel.list;
              list_q5 = q5viewModel.list_q5;
              groupValue = q5viewModel.data.q5A_New ?? 0;
              month = q5viewModel.data.thangDT.toString();
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
                    text: UIQuestions.q5(month),
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  UIListTile(
                    text: "Có",
                    check: groupValue == 1,
                    onTap1: (value){
                      setState(() {
                        groupValue = groupValue == 1 ? 0 : 1;
                      });
                    },
                    onTap2: (){
                      setState(() {
                        groupValue = groupValue == 1 ? 0 : 1;
                      });
                    },
                  ),
                  const SizedBox(height: 5,),
                  UIListTile(
                    text: "Không",
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
                  const SizedBox(height: 10,),
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
                                      notification: 'Q5-Họ tên thành viên nhỏ hơn 5 ký tự có đúng không?',
                                      onpress: (){
                                        Navigator.of(context).pop();
                                        q5viewModel.addNTKK(thongTinThanhVienNKTTModel(
                                            idtv: list.last.idtv! + 1,
                                            thangDT: int.parse(month),
                                            namDT: DateTime.now().year,
                                            q1_New: value,
                                            q5_New: 1
                                        ));
                                        setState(() {
                                          list_q5.add(thongTinThanhVienNKTTModel(
                                              idtv: list.last.idtv! + 1,
                                              thangDT: int.parse(month),
                                              namDT: DateTime.now().year,
                                              q1_New: value,
                                              q5_New: 1
                                          ));
                                          _text_name.text = "";
                                        });
                                      }
                                  )
                              );
                            }
                            else {
                              q5viewModel.addNTKK(thongTinThanhVienNKTTModel(
                                  idtv: list.last.idtv! + 1,
                                  thangDT: int.parse(month),
                                  namDT: DateTime.now().year,
                                  q1_New: value,
                                  q5_New: 1
                              ));
                              setState(() {
                                list_q5.add(thongTinThanhVienNKTTModel(
                                    idtv: list.last.idtv! + 1,
                                    thangDT: int.parse(month),
                                    namDT: DateTime.now().year,
                                    q1_New: value,
                                    q5_New: 1
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
                        itemCount: list_q5.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                            elevation: 10,
                            shadowColor: Colors.black,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 212.w,
                                      child: Text(
                                        "${index+1}. ${list_q5[index].q1_New}",
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
                                            "Có chắc muốn xóa ${list_q5[index].q1_New}?",
                                                (){
                                              q5viewModel.deleteNTKK(list_q5[index].idtv!);
                                              setState(() {
                                                list_q5.removeAt(index);
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
                      ],
                    )
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
              q5viewModel.Q5Back();
            }),
            UINextButton(ontap: (){
              if(groupValue == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'Q5 nhập vào chưa đúng!',)
                );
              }
              else if(groupValue == 2) {
                if(list_q5.isNotEmpty){
                  for(var item in list_q5){
                    q5viewModel.deleteNTKK(item.idtv!);
                  }
                }
                q5viewModel.Q5Next(groupValue);
              }
              else {
                if(list_q5.isEmpty){
                  showDialog(
                      context: context,
                      builder: (_) => const UIWarningDialog(waring: 'Q5-Họ tên thành viên nhập vào chưa đúng!',)
                  );
                }
                else{
                  _showNotificationDialog("Hộ còn ai nữa không?",(){
                    Navigator.of(context).pop();
                  },() {
                    print("Next");
                    q5viewModel.Q5Next(groupValue);
                  },);
                }
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