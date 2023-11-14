import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/uis.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    homeViewModel = context.read();
    homeViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardWidget(
                    UIDescribes.interview,
                    UIAssets.icInterview,
                    onTap:  () {
                      print(UIDescribes.interview);
                      _showLoading(context);
                    }),
                _cardWidget(UIDescribes.sync, UIAssets.icSync,onTap: () {
                  print(UIDescribes.sync);
                  homeViewModel.sync();
                }),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardWidget(UIDescribes.progress, UIAssets.icTask,onTap: () {
                  print(UIDescribes.progress);
                  homeViewModel.progress();
                }),
                _cardWidget(UIDescribes.replace, UIAssets.icReplace,onTap: () {
                  homeViewModel.areaReplace();
                }),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardWidget(UIDescribes.retrieve, UIAssets.icReload,onTap: () {
                  _showDialog();
                }),
                _cardWidget(UIDescribes.programUpdate, UIAssets.icUpdate,onTap: () {
                  print(UIDescribes.programUpdate);
                  if (Platform.isAndroid) {
                    // Android
                    homeViewModel.checkUpdateApp();
                  } else {
                    // IOS
                  }
                }),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWidget(String title, String icon, {required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 140.h,
        decoration:  BoxDecoration(
          //border: Border.all(color: mCompleteColor.shade400),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: mCompleteColor.shade400,
              blurRadius: 10, // soften the shadow
              spreadRadius: -5, //extend the shadow

            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                icon,
              width: 75,
              height: 75,
            ),
            const SizedBox(height: 10,),
            UIText(
              text: title,
              textColor: Colors.black,
              isBold: true,
              //isBold: true,
            ),
          ],
        ),
      ),
    );
  }

  _showLoading(BuildContext context){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          homeViewModel.interview();
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircularProgressIndicator(),
                  UIText(text: "Hệ thống đang xử lý...")
                ],
              ),
            ),
          );
        }
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: const UIText(
                text:
                "Cảnh báo (Tải lại dữ liệu)",
                textColor: Colors.black,
                textAlign: TextAlign.center,
                textFontSize: fontLarge,
              ),
              content: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: UIText(
                  text:
                  "DỮ LIỆU TRÊN THIẾT BỊ SẼ BỊ XÓA ở các cơ sở ĐANG PHỎNG VẤN hoặc "
                      "hoàn thành nhưng CHƯA ĐỒNG BỘ.\nĐề nghị ĐTV thực hiện ĐỒNG "
                      "BỘ DỮ LIỆU trước khi chọn đồng ý",
                  textColor: Colors.black,
                  textAlign: TextAlign.center,
                  textFontSize: fontLarge,
                  //isBold: true,
                ),
              ),
              //actionsAlignment: MainAxisAlignment.center,
              //actionsOverflowDirection: VerticalDirection.down,
              actions: [
                MaterialButton(
                    height: 60,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    child: const UIText(
                      text: 'Kiểm tra lại',
                      textFontSize: fontLarge,
                      textAlign: TextAlign.center,
                      textColor: mCloseColor,
                      isBold: true,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                MaterialButton(
                  height: 60,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black,width: 0.1)
                  ),
                  child: const UIText(
                    text: 'Đồng ý',
                    textFontSize: fontLarge,
                    textAlign: TextAlign.center,
                    textColor: mPrimaryColor,
                    isBold: true,
                  ),
                  onPressed: () {
                    homeViewModel.download();
                  },
                ),
              ],
            ));
  }
}
