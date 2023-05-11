import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/uis.dart';
import 'progress_viewmodel.dart';

class ProgressView extends StatefulWidget{
  @override
  Body createState() => Body();
}
class Body extends State{
  late ProgressViewModel progressViewModel;
  String username = '';
  List list_bangke = [];
  late ValueNotifier<double> valueNotifier;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(75.0);
    progressViewModel = context.read();
    progressViewModel.onInit(context);
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          username = progressViewModel.userName;
          list_bangke = progressViewModel.data;
        })
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(0xfffdfcfb),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SimpleCircularProgressBar(
                  size: 200.r,
                  valueNotifier: valueNotifier,
                  progressStrokeWidth: 24,
                  backStrokeWidth: 24,
                  mergeMode: true,
                  animationDuration: 4,
                  onGetText: (value) {
                    return Text(
                      '${value.toInt()}%',
                      style: const TextStyle(
                        fontSize: 64,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  progressColors: const [mThirdColor, Colors.purple],
                  backColor: Colors.black.withOpacity(0.4),
                ),
                const SizedBox(height: 30,),
                Row(
                  children:  [
                    const Expanded(
                        flex: 5,
                        child: Text(
                          "Số cơ sở được phân công",
                          style: TextStyle(
                              
                              fontSize: fontMedium, color: Colors.purple, fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(list_bangke.length.toString(),
                            style: const TextStyle(
                                
                                fontSize: fontMedium,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children:  [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở chưa phỏng vấn",
                          style: TextStyle(
                              
                              fontSize:
                              fontMedium,
                              color: mDividerColor)
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthInterviewStatus(list_bangke, 1),
                          style: const TextStyle(fontSize: fontMedium, ),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở đang phỏng vấn",
                          style: TextStyle(
                              fontSize: fontMedium,
                            color: mDividerColor,
                            )
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthInterviewStatus(list_bangke, 2),
                          style: const TextStyle(fontSize: fontMedium, ),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                        flex: 4,
                        child: Text("Số cơ sở đã hoàn thành phỏng vấn",
                            style: TextStyle(
                                fontSize: fontMedium, color: mDividerColor, fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 1,
                        child: Text(
                          progressViewModel.lengthInterviewStatus(list_bangke, 9),
                          style: const TextStyle(fontSize: fontMedium, ),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở đang hoạt động",
                          style: TextStyle(
                              fontSize: fontMedium, color: mDividerColor, )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 1),
                          style: const TextStyle(fontSize: fontMedium, ),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở đang tạm ngừng hoạt động",
                          style: TextStyle(
                              fontSize: fontMedium, color: mDividerColor, )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 2),
                          style: const TextStyle(fontSize: fontMedium, ),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở không hoạt động",
                          style: TextStyle(
                              fontSize: fontMedium, color: mDividerColor,)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 3),
                          style: const TextStyle( fontSize: fontMedium),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở chuyển ngành khác",
                          style: TextStyle(
                              
                              fontSize: fontMedium, color: mDividerColor)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 4),
                          style: const TextStyle( fontSize: fontMedium),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở không còn tại địa bàn",
                          style: TextStyle(
                              
                              fontSize: fontMedium, color: mDividerColor)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 5),
                          style: const TextStyle( fontSize: fontMedium),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở không liên hệ được",
                          style: TextStyle(
                              
                              fontSize: fontMedium, color: mDividerColor)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 6),
                          style: const TextStyle( fontSize: fontMedium),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("Số cơ sở không thuộc đối tượng điều tra",
                          style: TextStyle(
                              
                              fontSize: fontMedium, color: mDividerColor)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          progressViewModel.lengthStatus(list_bangke, 9),
                          style: const TextStyle( fontSize: fontMedium),
                          textAlign: TextAlign.end,
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children:  [
                    const Expanded(
                        flex: 4,
                        child: Text("Số hộ đã đồng bộ",
                            style: TextStyle(
                                
                                fontSize: fontMedium, color: Colors.purple, fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 2,
                        child: Text(progressViewModel.lengthBangKeStatus(list_bangke),
                            style: const TextStyle(
                                
                                fontSize: fontMedium,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end)
                    )
                  ],
                ),
              ]
          ),
        )
    );
  }
}