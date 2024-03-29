import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/uis.dart';
import 'interview_status_viewmodel.dart';

class InterviewStatusView extends StatefulWidget {

  @override
  _InterviewStatusViewState createState() => _InterviewStatusViewState();
}

class _InterviewStatusViewState extends State<InterviewStatusView> {
  late InterviewStatusViewModel interviewStatusViewModel;
  String dtv = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      interviewStatusViewModel = context.read();
      interviewStatusViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              dtv = interviewStatusViewModel.userName;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => interviewStatusViewModel.interviewStatusBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.interviewStatus,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: 14.w, top: 20.h, right: 14.w, bottom: 5.h),
                width: MediaQuery.of(context)
                    .size
                    .width, //MediaQuery: lấy kích thước màn hình thiết bị
                child: ElevatedButton(
                  onPressed: () {
                    interviewStatusViewModel.notInterviewed();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.centerLeft,
                    height: 70,
                    child: UIText(
                      textAlign: TextAlign.start,
                      text: UIDescribes.notInterviewed,
                      textColor: mPrimaryColor,
                      textFontSize: 17.sp,
                      isBold: true,
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                EdgeInsets.only(left: 14.w, top: 5.h, right: 14.w, bottom: 5.h),
                width: MediaQuery.of(context)
                    .size
                    .width, //MediaQuery: lấy kích thước màn hình thiết bị
                child: ElevatedButton(
                  onPressed: () {
                    interviewStatusViewModel.completeInterview();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.centerLeft,
                    height: 70,
                    child: UIText(
                      text: UIDescribes.completeInterviewed,
                      textColor: mPrimaryColor,
                      textFontSize: 17.sp,
                      isBold: true,
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                EdgeInsets.only(left: 14.w, top: 5.h, right: 14.w, bottom: 5.h),
                width: MediaQuery.of(context)
                    .size
                    .width, //MediaQuery: lấy kích thước màn hình thiết bị
                child: ElevatedButton(
                  onPressed: () {
                    interviewStatusViewModel.backup();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.centerLeft,
                    height: 70,
                    child: UIText(
                      text: UIDescribes.preventive,
                      textColor: mPrimaryColor,
                      textFontSize: 17.sp,
                      isBold: true,
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(6),
        margin: const EdgeInsets.only(bottom: 10, left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: const LinearGradient(colors: [
              Colors.limeAccent,
              Colors.limeAccent,
            ])
        ),
        child: Text(dtv,
          style: TextStyle(fontSize: fontMedium, fontWeight: FontWeight.bold, color: mPrimaryColor),),
      ),
    );
  }
}