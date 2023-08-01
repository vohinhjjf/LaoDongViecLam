import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
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
                    text: UIQuestions.q6,
                    textColor: Colors.black,
                    textFontSize: fontGreater,
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
                              fontSize: 18,
                              fontWeight: FontWeight.normal
                          ),
                          maxLines: 10,
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
                          q6viewModel.Q6Back();
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
                          q6viewModel.Q6Next();
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