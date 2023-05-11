import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/uis.dart';
import 'Q2_viewmodel.dart';


class Q2View extends StatefulWidget {
  const Q2View({Key? key}) : super(key: key);

  @override
  State<Q2View> createState() => _Q2ViewState();
}

class _Q2ViewState extends State<Q2View> {
  late Q2ViewModel q2viewModel;
  int groupValue = 0;
  List<String> list_name = [];
  final _text_name = TextEditingController();

  @override
  void initState() {
    super.initState();
    q2viewModel = context.read();
    q2viewModel.onInit(context);
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
                  const UIText(
                    text: UIQuestions.q2,
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
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
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
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                        onSubmitted: (value){
                          //Navigator.of(context).pop();
                          setState(() {
                            list_name.add(value);
                          });
                          //_showAddDialog(linh_vuc, san_pham,_text_name.text, false);
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

                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 212.w,
                                  child: Text(
                                    "${index+1}. ${list_name[index]}",
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
                                        "Có chắc muốn xóa người này?",
                                            (){

                                        }, (){}
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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
                          q2viewModel.Q2Back();
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
                            q2viewModel.Q2Next();
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
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      onpress1;
                    }
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
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      onpress2;
                    }
                )
              ],
            ),
          ),
        ));
  }
}