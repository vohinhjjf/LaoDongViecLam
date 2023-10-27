import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/uis.dart';
import '../../models/bangkeThangDT_model.dart';
import '../../models/bangke_model.dart';
import '../../models/thongTinHo_model.dart';
import 'progress_viewmodel.dart';

class ProgressView extends StatefulWidget{
  @override
  State<ProgressView> createState() => Body();
}
class Body extends State<ProgressView>{
  late ProgressViewModel progressViewModel;
  String username = '';
  double percent = 0;
  List<BangKeCsModel> list_bangke = [];
  List<BangKeThangDTModel> list_bk_tdt = [];
  List<thongTinHoModel> list_ttho = [];
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    progressViewModel = context.read();
    progressViewModel.onInit(context);
    valueNotifier = ValueNotifier(0.0);
    Future.delayed(const Duration(milliseconds: 100), () => {
      setState((){
        username = progressViewModel.userName;
        list_bangke = progressViewModel.list_bk;
        list_bk_tdt = progressViewModel.list_bk_tdt;
        list_ttho = progressViewModel.list_ttho;
        valueNotifier.value = (progressViewModel.list_bk_tdt.where((e) => e.trangThai != 2).length/progressViewModel.list_bk.length)*100.0;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: mPrimaryColor,
                size: fontLarge,
              ),
              onPressed: () => progressViewModel.progressBack()
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const UIText(
            text: 'Tiến độ điều tra',
            textColor: mPrimaryColor,
            textAlign: TextAlign.center,
            textFontSize: fontLarge,
            isBold: true,
          ),

          shape: const UnderlineInputBorder(
              borderSide: BorderSide(color: mPrimaryColor)
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                SimpleCircularProgressBar(
                  size: 200.r,
                  valueNotifier: valueNotifier,
                  progressStrokeWidth: 24,
                  backStrokeWidth: 24,
                  mergeMode: true,
                  animationDuration: 3,
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
                        child: UIText(
                          text: 
                          "Số hộ được phân công",
                            textFontSize: fontMedium,
                          textColor: Colors.purple,
                          isBold: true,
                        )),
                    Expanded(
                        flex: 1,
                        child: UIText(
                          text: list_bangke.length.toString(),
                            textFontSize: fontMedium,
                            textColor: Colors.purple,
                            isBold: true,
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
                      child: UIText(
                          text: "Số hộ chưa phỏng vấn",
                          textFontSize: fontMedium,
                          textColor: mDividerColor
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text: 
                          (list_bangke.length - list_bk_tdt.length).toString(),
                          textFontSize: fontMedium,
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
                      child: UIText(
                          text: "Số hộ đang phỏng vấn",
                            textFontSize: fontMedium,
                            textColor: mDividerColor,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text: 
                          list_bk_tdt.where((e) => e.trangThai == 2).length.toString(),
                          textFontSize: fontMedium,
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
                        child: UIText(
                          text: "Số hộ đã hoàn thành phỏng vấn",
                            textFontSize: fontMedium,
                            textColor: mDividerColor,
                            isBold: true,)),
                    Expanded(
                        flex: 1,
                        child: UIText(
                          text: 
                          list_bk_tdt.where((e) => e.trangThai == 3).length.toString(),
                          textFontSize: fontMedium,
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
                      child: UIText(
                          text: "Số hộ từ chối phỏng vấn",
                        textFontSize: fontMedium,
                        textColor: mHightLightColor,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text: 
                          list_ttho.where((e) => e.trangThai == 2).length.toString(),
                          textFontSize: fontMedium,
                          textColor: mHightLightColor,
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
                      child: UIText(
                          text: "Số hộ không còn tại địa bàn",
                        textFontSize: fontMedium,
                        textColor: mHightLightColor,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text: list_ttho.where((e) => e.trangThai == 3).length.toString(),
                          textFontSize: fontMedium,
                          textAlign: TextAlign.end,
                            textColor: mHightLightColor
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
                      child: UIText(
                          text: "Số hộ không liên hệ được",
                          textFontSize: fontMedium,
                          textColor: mHightLightColor
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text: list_ttho.where((e) => e.trangThai == 6).length.toString(),
                          textFontSize: fontMedium,
                          textAlign: TextAlign.end,
                          textColor: mHightLightColor
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
                        child: UIText(
                          text: "Số hộ đã đồng bộ",
                            textFontSize: fontMedium,
                            textColor: mCompleteColor,
                            isBold: true,
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: UIText(
                          text:
                            list_bk_tdt.where((e) => e.trangThai == 9).length.toString(),
                            textFontSize: fontMedium,
                            textColor: mCompleteColor,
                            isBold: true,
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