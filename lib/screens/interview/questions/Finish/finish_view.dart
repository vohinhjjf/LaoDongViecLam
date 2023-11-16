import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../components/uis.dart';
import '../../../../models/doiSongHo_model.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../models/thongTinThanhVien_model.dart';
import 'finish_viewmodel.dart';

class FinishView extends StatefulWidget {
  const FinishView({Key? key}) : super(key: key);

  @override
  Body createState() => Body();
}

class Body extends State<FinishView> {
  late FinishViewModel finishViewModel;
  var thongtintv = thongTinThanhVienModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      finishViewModel = context.read();
      finishViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          thongtintv = finishViewModel.thongtintv;
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
          text: UIDescribes.endInterview,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => finishViewModel.finishBack(thongtintv)),
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            onPressed: () {
              finishViewModel.finish();
            },
            color: Colors.blue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const UIText(
                text: 'HOÀN THÀNH PHIẾU',
                textFontSize: fontMedium,
                textAlign: TextAlign.center,
                isBold: true,
                textColor: Colors.white
            ),
          ),
        ),
      ),
      //drawer: const DrawerNavigation(),
    );
  }
}
