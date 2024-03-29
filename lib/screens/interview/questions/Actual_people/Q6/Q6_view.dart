import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'Q6_viewmodel.dart';


class Q6View extends StatefulWidget {
  const Q6View({Key? key}) : super(key: key);

  @override
  State<Q6View> createState() => _Q6ViewState();
}

class _Q6ViewState extends State<Q6View> {
  late Q6ViewModel q6viewModel;
  List<thongTinThanhVienNKTTModel> list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      q6viewModel = context.read();
      q6viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list = q6viewModel.list;
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
                  const UIText(
                    text: UIQuestions.q6,
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 5,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                        child: Text(
                          "${index+1}. ${list[index].q1_New}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: fontMedium,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 10,
                        ),
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
              q6viewModel.Q6Back();
            }),
            UINextButton(ontap: (){
              List<thongTinThanhVienModel> data = [];
              for(var item in list){
                data.add(thongTinThanhVienModel(
                    idho: item.idho,
                    idtv: item.idtv,
                    thangDT: item.thangDT,
                    namDT: item.namDT,
                    c00: item.q1_New
                ));
              }
              print(data.length);
              if(data.isEmpty){
                _showNotificationDialog();
              } else {
                q6viewModel.Q6Next(data);
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

  _showNotificationDialog(){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: const UIText(
            text: "Hộ ông/bà không có ai được tính là nhân khẩu thực tế thường trú tại hộ trong cuộc điều tra này",
            textColor: Colors.black,
            textFontSize:fontLarge,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 60,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                MaterialButton(
                    height: 60,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed: (){
                      q6viewModel.Q1Back();
                    },
                    child: const UIText(
                        text: 'Kiểm tra lại thông tin thành viên',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      isBold: true,
                    )
                ),
                MaterialButton(
                    height: 60,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed: (){

                    },
                    child: const UIText(
                      text: 'Hoàn thành phỏng vấn',
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