import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../components/uis.dart';
import '../../../../models/thongTinThanhVienNKTT_model.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q1viewModel = context.read();
      q1viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              list_name = q1viewModel.list;
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
                    text: UIQuestions.q1,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: _text_name,
                    onSubmitted: (value){
                      q1viewModel.addNTKK(value, list_name.length);
                      setState(() {
                        list_name.add(thongTinThanhVienNKTTModel(
                            idho: '99991001003',
                            idtv: list_name.length,
                            q1_New: value,
                            q2_New: 1
                        ));
                        _text_name.text = "";
                      });
                      //_showAddDialog(linh_vuc, san_pham,_text_name.text, false);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: mPrimaryColor)),
                      hintText: "Nhập họ và tên",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list_name.length,
                    itemBuilder: (context, index) {
                      if(list_name[index].q2_New == 1) {
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
                                    "${index+1}. ${list_name[index].q1_New}",
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
                                        "Có chắc muốn xóa ${list_name[index].q1}?",
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
                      }
                      return Container();
                    },
                  ),
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
                          q1viewModel.Q1Back();
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
                          if(list_name.isNotEmpty){
                            _showNotificationDialog("Hộ còn ai nữa không?",(){
                              Navigator.of(context).pop();
                            },() {
                              print("Next");
                              q1viewModel.Q1Next();
                            },);
                          }else {
                            q1viewModel.addNTKK(_text_name.text, list_name.length);
                            setState(() {
                              list_name.add(thongTinThanhVienNKTTModel(
                                  idho: '99991001003',
                                  idtv: list_name.length,
                                  q1: _text_name.text
                              ));
                              _showNotificationDialog("Hộ còn ai nữa không?",(){
                                Navigator.of(context).pop();
                              },() {
                                print("Next");
                                q1viewModel.Q1Next();
                              },);
                            });
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
                    onPressed: onpress1
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