import 'package:flutter/material.dart';
import '../components/uis.dart';
import '../components/ui_text.dart';
import 'package:provider/provider.dart';


class UIGPSButton extends StatefulWidget {
  const UIGPSButton({Key? key}) : super(key: key);

  @override
  Body createState() => Body();
}

class Body extends State<UIGPSButton> {
  //late GPSViewModel gpsViewModel = context.read();
  bool check = false;

  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      gpsViewModel = context.read();
      gpsViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          if(gpsViewModel.phieuTonGiaoModel.kinhDo == null){
            check = false;
          } else {
            check = true;
          }
        })
      });
    });*/
  }

  /*checkGps(BuildContext context) async {
    bool servicestatus = false;
    bool haspermission = false;
    late LocationPermission permission;
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Quyền vị trí bị từ chối!');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Quyền vị trí bị từ chối vĩnh viễn!");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation(context);
      }
    } else {
      print("Dịch vụ GPS chưa được bật, hãy bật vị trí GPS!");
    }
  }

  getLocation(BuildContext context) async {
    late Position position;
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    if(check){
      _showNotificationDialog(context,position.longitude, position.latitude);
    }
    else{
      gpsViewModel.setGPS(position.longitude, position.latitude);
      _showMaterialDialog(context,position.longitude, position.latitude);
    }

  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
      child: MaterialButton(
        onPressed: (){
          //checkGps(context);
        },
        color: Colors.white,
        shape:  RoundedRectangleBorder(
            side:BorderSide(color: mSecondaryColor,width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: const UIText(
          text: 'GPS',
          textColor: mSecondaryColor,
          isBold: true,
        ),
      ),
    );
  }

  _showMaterialDialog(BuildContext context, double longitude, double latitude) {
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
                isBold: true,
              ),
              UIText(
                text: "Kinh độ: $longitude",
                textAlign: TextAlign.center,
                textColor: Colors.black,
              ),
              UIText(
                text: "Vĩ độ: $latitude",
                textAlign: TextAlign.center,
                textColor: Colors.black,
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

  _showNotificationDialog(BuildContext context, double longitude, double latitude){
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
              SizedBox(height: 10,),
              UIText(
                text: "Kinh độ: $longitude",
                textAlign: TextAlign.center,
                textColor: Colors.black,
              ),
              UIText(
                text: "Vĩ độ: $latitude",
                textAlign: TextAlign.center,
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
                        textFontSize: 16,
                        isBold: true,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                  MaterialButton(
                      child: const  UIText(
                        text: 'Cập nhật',
                        textColor: mPrimaryColor,
                        textFontSize: 16,
                        isBold: true,),
                      onPressed: () {
                        setState(() {
                          check = false;
                        });
                        //checkGps(context);
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                ]),
          ),
        ));
  }
}