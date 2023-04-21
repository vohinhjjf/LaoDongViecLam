import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/uis.dart';
import 'interview_status_viewmodel.dart';

class InterviewStatusView extends StatefulWidget {
  const InterviewStatusView({super.key});

  @override
  State<InterviewStatusView> createState() => _InterviewStatusViewState();
}

class _InterviewStatusViewState extends State<InterviewStatusView> {
  late InterviewStatusViewModel interviewStatusViewModel;

  @override
  void initState() {
    super.initState();
    interviewStatusViewModel = context.read();
    interviewStatusViewModel.onInit(context);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIText(
                              textAlign: TextAlign.start,
                              text: UIDescribes.notInterviewed,
                              //textColor: Colors.green,
                              textFontSize: 15.sp,
                              isBold: true,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                UIText(
                                  text: UIDescribes.number,
                                  textFontSize: 14.sp,
                                  textColor: mPrimaryColor,
                                ),
                                const SizedBox(width: 5,),
                                /*StreamBuilder(
                                    stream: interviewStatusViewModel.listNotInterviewed().asStream(),
                                    builder: (context, AsyncSnapshot<List<BangKeCsModel>> snapshot){
                                      if(snapshot.hasData){
                                        return UIText(
                                          text: snapshot.data!.length.toString(),
                                          textFontSize: 14.sp,
                                          textColor: mPrimaryColor,
                                        );
                                      }
                                      return Container();
                                    }
                                )*/
                              ],
                            )

                          ],
                        ),
                        const Icon(Icons.navigate_next,color: Colors.grey,)
                      ],
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
                    interviewStatusViewModel.interviewing();
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            UIText(
                              text: UIDescribes.interviewing,
                              //textColor: Colors.orange,
                              textFontSize: 16.sp,
                              isBold: true,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                UIText(
                                  text: UIDescribes.number,
                                  textFontSize: 14.sp,
                                  textColor: mPrimaryColor,
                                ),
                                const SizedBox(width: 5,),
                                /*StreamBuilder(
                                    stream: interviewStatusViewModel.listInterviewing().asStream(),
                                    builder: (context, AsyncSnapshot<List<BangKeCsModel>> snapshot){
                                      if(snapshot.hasData){
                                        return UIText(
                                          text: snapshot.data!.length.toString(),
                                          textFontSize: 14.sp,
                                          textColor: mPrimaryColor,
                                        );
                                      }
                                      return Container();
                                    }
                                )*/
                              ],
                            )
                          ],
                        ),
                        const Icon(Icons.navigate_next,color: Colors.grey,)
                      ],
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
                    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            UIText(
                              text: UIDescribes.completeInterviewed,
                              //textColor: Colors.green,
                              textFontSize: 16.sp,
                              isBold: true,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                UIText(
                                  text: UIDescribes.number,
                                  textFontSize: 14.sp,
                                  textColor: mPrimaryColor,
                                ),
                                const SizedBox(width: 5,),
                                /*StreamBuilder(
                                    stream: interviewStatusViewModel.listCompleteInterview().asStream(),
                                    builder: (context, AsyncSnapshot<List<BangKeCsModel>> snapshot){
                                      if(snapshot.hasData){
                                        return UIText(
                                          text: snapshot.data!.length.toString(),
                                          textFontSize: 14.sp,
                                          textColor: mPrimaryColor,
                                        );
                                      }
                                      return Container();
                                    }
                                )*/
                              ],
                            )
                          ],
                        ),
                        const Icon(Icons.navigate_next,color: Colors.grey,)
                      ],
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
                    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            UIText(
                              text: UIDescribes.preventive,
                              //textColor: Colors.green,
                              textFontSize: 16.sp,
                              isBold: true,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                UIText(
                                  text: UIDescribes.number,
                                  textFontSize: 14.sp,
                                  textColor: mPrimaryColor,
                                ),
                                const SizedBox(width: 5,),
                                /*StreamBuilder(
                                    stream: interviewStatusViewModel.listCompleteInterview().asStream(),
                                    builder: (context, AsyncSnapshot<List<BangKeCsModel>> snapshot){
                                      if(snapshot.hasData){
                                        return UIText(
                                          text: snapshot.data!.length.toString(),
                                          textFontSize: 14.sp,
                                          textColor: mPrimaryColor,
                                        );
                                      }
                                      return Container();
                                    }
                                )*/
                              ],
                            )
                          ],
                        ),
                        const Icon(Icons.navigate_next,color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}