import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/uis.dart';
import '../../models/bangkeThangDT_model.dart';
import 'sync_viewmodel.dart';

class SyncView extends StatefulWidget{
  const SyncView({super.key});

  @override
  State<SyncView> createState() => Body();
}
class Body extends State<SyncView>{
  int temp =0;
  late SyncViewModel syncViewModel;

  @override
  void initState() {
    super.initState();
    syncViewModel = context.read();
    syncViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontLarge,
            ),
            onPressed: () => syncViewModel.syncBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: 'Đồng bộ dữ liệu điều tra',
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),

        shape: const UnderlineInputBorder(
            borderSide: BorderSide(color: mPrimaryColor)
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            StreamBuilder(
                stream: syncViewModel.fetchData().asStream(),
                builder: (context, AsyncSnapshot<List<BangKeThangDTModel>> snapshot){
                  if(snapshot.hasData){
                    temp = snapshot.data!.length;
                    return UIText(
                      text: 'Có ${snapshot.data!.length} cơ sở cần đồng bộ',
                      textFontSize: fontLarge,
                      textColor: mCompleteColor,
                    );
                  }
                  return Container();
                }
            ),
            const SizedBox(height: 10,),
            const UIText(
              text: 'Gửi tệp dữ liệu: không',
                textFontSize: fontLarge,
                textColor: mThirdColor
            ),
            Container(
              alignment: Alignment.center,
              margin:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: 250,
              child: MaterialButton(
                onPressed: (){
                  if(temp != 0 ) {
                    syncViewModel.Dongbo().then((value) =>
                    {
                      _showMaterialDialog(value)
                    }).onError((error, stackTrace) =>
                      _showErrorDialog(error.toString()));
                  }
                  else{
                    _showNotificationDialog();
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: const LinearGradient(colors: [
                        mPrimaryColor,
                        Color(0xFF64B5F6),
                        mPrimaryColor,
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: const UIText(
                    text: "THỰC HIỆN",
                    textAlign: TextAlign.center,
                    textColor: Colors.white,
                    textFontSize: fontMedium,
                    isBold: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(bottom: 10, left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: const LinearGradient(colors: [
              Colors.limeAccent,
              Colors.limeAccent,
            ])
        ),
        child: UIText(
          text: 'Mã ĐTV: ${syncViewModel.userName}',
            textFontSize: fontMedium,
            isBold: true,
            textColor: mPrimaryColor
        ),
      ),
    );
  }

  _showMaterialDialog(String value) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: const Image(
            width: 130,
            height: 130,
            image: AssetImage("assets/images/notification.gif"),
          ),
          content: SizedBox(
            height: 120,
            child: Column(
              children: <Widget>[
                UIText(
                  text: "Đồng bộ thành công $value hộ",
                  textAlign: TextAlign.center,
                  textColor: Colors.black,
                  textFontSize: fontLarge,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(height: 20,color: Colors.grey),
                MaterialButton(
                    child: const UIText(
                        text: 'Đóng',
                        textColor: mPrimaryColor,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context, rootNavigator: true).pop();
                      });
                      //syncViewModel.syncBack();
                    }
                ),
              ],
            ),
          ),
        ));
  }

  _showErrorDialog(String error) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: Container(
            child: Column(
              children: [
                const Image(
                  width: 250,
                  height: 250,
                  image: AssetImage("assets/images/warning.gif"),
                ),
                const UIText(
                  text: "Thất bại",
                    textFontSize: fontLarge,
                    textColor: Colors.red
                ),
                const SizedBox(
                  height: 10,
                ),
                UIText(
                  text: "Lỗi xử lý yêu cầu đồng bộ: $error",
                  textAlign: TextAlign.center,
                    textColor: Colors.black,
                    textFontSize: fontLarge
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: mPrimaryColor)),
                    color: mPrimaryColor,
                    child: const UIText(
                        text: 'Quay lại',
                        textColor: Colors.white, textFontSize: fontLarge
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context, rootNavigator: true).pop();
                      });
                    }
                )
              ],
            ),
          ),
        ));
  }

  _showNotificationDialog(){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          contentPadding: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: Column(
            children: const [
              Text('Không có hộ cần đồng bộ!', style: TextStyle(fontSize: fontLarge, color: mDividerColor),),
              SizedBox(height: 5,),
              Divider(
                  height: 10,
                  color: Colors.grey),
            ],
          ),
          content: SizedBox(
            height: 20,
            child: Container(
              alignment: Alignment.center,
              child: MaterialButton(
                  child: const Text('Đóng',
                      style: TextStyle(
                          color: mPrimaryColor, fontSize: fontLarge)),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context, rootNavigator: true).pop();
                    });
                  }
              ),
            ),
          ),
        ));
  }
}