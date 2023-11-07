import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../components/uis.dart';
import '../../../../models/thongTinHo_model.dart';
import '../../../../models/thongTinThanhVien_model.dart';
import 'gps_viewmodel.dart';

class GPSView extends StatefulWidget {
  const GPSView({Key? key}) : super(key: key);

  @override
  Body createState() => Body();
}

class Body extends State<GPSView> {
  late GPSViewModel gpsViewModel = context.read();
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  bool check = false;
  List<thongTinThanhVienModel> list = [];
  var thongTinHo = thongTinHoModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gpsViewModel = context.read();
      gpsViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          list = gpsViewModel.list;
          thongTinHo = gpsViewModel.thongTinHo;
          if(gpsViewModel.thongTinHo.kinhDo == null){
            check = false;
          } else {
            check = true;
          }
        })
      });
    });
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    if(check){
      _showNotificationDialog(position.longitude, position.latitude);
    }
    else{
      gpsViewModel.setGPS(position.longitude, position.latitude);
      _showMaterialDialog(position.longitude, position.latitude);
    }
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
            onPressed: () => gpsViewModel.gPSBack()),
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
          child: Column(
            children: [
              MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                //color: Colors.redAccent,
                minWidth: 240.w,
                onPressed: () async {
                  checkGps();
                },
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue,width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage("assets/icons/GPS.png"),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    UIText(
                      text: 'ĐỊNH VỊ GPS',
                      textFontSize: fontMedium,
                      isBold: true,
                      textColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                minWidth: 240.w,
                onPressed: () async {
                  await gpsViewModel.checkGPS().then((value) => {
                    if(value){
                      if(!gpsViewModel.checkQuestion(list, thongTinHo)){
                        if (gpsViewModel.typeStop == 1){
                          _showErrorDialog("Trong hộ có thành viên ${list[gpsViewModel.currentPos].c00} chưa hoàn thành điều tra. Vui lòng kiểm tra lại!", gpsViewModel.stopQuestion)
                        }
                        else if (gpsViewModel.typeStop == 0){
                          _showErrorDialog("Trong hộ có câu hỏi chưa hoàn thành điều tra. Vui lòng kiểm tra lại!", gpsViewModel.stopQuestion)
                        }
                      } else {
                        gpsViewModel.finish(DateTime.now().toString(), list),
                        _showFinishDialog()
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => const UIWarningDialog(waring: 'Chưa định vị GPS!')
                      )
                    }
                  });
                },
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage("assets/icons/finish1.png"),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    UIText(
                        text: 'HOÀN THÀNH \nPHỎNG VẤN',
                        textFontSize: fontMedium,
                        textAlign: TextAlign.center,
                        isBold: true,
                        textColor: Colors.white
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //drawer: const DrawerNavigation(),
    );
  }

  _showFinishDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: const Image(
            width: 210,
            height: 200,
            image: AssetImage("assets/images/complete.gif"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: const UIText(
                  text: "Hoàn thành phỏng vấn hộ",
                  textAlign: TextAlign.center,
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                    isBold: true,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                        child: const Text('Kiểm tra lại',
                            style: TextStyle(
                                color: mPrimaryColor, fontSize: fontMedium, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    MaterialButton(
                        child: const Text('Tiếp tục',
                            style: TextStyle(
                                color: mPrimaryColor, fontSize: fontMedium, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          gpsViewModel.gPSNext();
                        }),
                  ]),
            ],
          ),
        )
    );
  }

  _showMaterialDialog(double longitude, double latitude) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: const Image(
            width: 130,
            height: 130,
            image: AssetImage("assets/images/success.gif"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const UIText(
                text: "Lấy địa chỉ GPS thành công!",
                textAlign: TextAlign.center,
                textColor: Colors.black,
                textFontSize: fontLarge,
                isBold: true,
              ),
              UIText(
                text: "Kinh độ: $longitude",
                textAlign: TextAlign.center,
                textColor: Colors.black,
                textFontSize: fontLarge,
              ),
              UIText(
                text: "Vĩ độ: $latitude",
                textAlign: TextAlign.center,
                textColor: Colors.black,
                textFontSize: fontLarge,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                        child: const UIText(
                          text: 'Đóng',
                          textFontSize: fontMedium,
                          textAlign: TextAlign.center,
                          textColor: mPrimaryColor,
                          isBold: true,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ])
            ],
          ),
        ));
  }

  _showNotificationDialog(double longitude, double latitude){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: Column(
            children: [
              const UIText(
                text:'Cơ sở này đã có GPS!',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: fontLarge, color: mDividerColor,fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              UIText(
                text: "Kinh độ: $longitude",
                textAlign: TextAlign.center,
                textFontSize: fontLarge,
                textColor: Colors.black,
              ),
              UIText(
                text: "Vĩ độ: $latitude",
                textAlign: TextAlign.center,
                textFontSize: fontLarge,
                textColor: Colors.black,
              ),
            ],
          ),
          content: Container(
            height: 60,
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                      child: const UIText(
                        text: 'Đóng',
                        textColor: Colors.red,
                        textFontSize: fontLarge,
                        isBold: true,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                  MaterialButton(
                      child: const  UIText(
                        text: 'Cập nhật',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        isBold: true,),
                      onPressed: () {
                        setState(() {
                          check = false;
                        });
                        checkGps();
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                ]),
          ),
        ));
  }

  _showErrorDialog(String title, String question){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: UIText(
            text: title,
            textAlign: TextAlign.center,
            textColor: Colors.black,
            textFontSize: fontLarge,
            isBold: true,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                  child: Text('Kiểm tra câu $question',
                      style: const TextStyle(
                          color: mPrimaryColor, fontSize: fontLarge, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    gpsViewModel.gPSCheck(question);
                  }),
              MaterialButton(
                  child: const Text('Đóng',
                      style: TextStyle(
                          color: mPrimaryColor, fontSize: fontLarge, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        )
    );
  }
}
