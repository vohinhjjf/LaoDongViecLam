import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/navigation/navigation_service.dart';
import '../components/ui_colors.dart';
import '../components/ui_styles.dart';
import '../components/ui_text.dart';

class UIWarningDialog extends StatelessWidget {
  final String waring;

  const UIWarningDialog(
      {Key? key,
        required this.waring})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      title: UIText(
        text: waring,
        textColor: Colors.black,
        textFontSize: fontLarge,
        isBold: true,
      ),
      content: Container(
        height: 60,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
                height: 60,
                minWidth: (MediaQuery.of(context).size.width-80),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black,width: 0.1)
                ),
                child: const UIText(
                  text: "Kiểm tra lại",
                  textColor: mPrimaryColor,
                  textFontSize: fontMedium,
                  isBold: true,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                }
            ),
          ],
        ),
      ),
    );
  }
}

class UINotificationDialog extends StatelessWidget {
  final String notification;
  final void Function() onpress;

  const UINotificationDialog(
      {Key? key,
        required this.notification,
        required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      title: UIText(
        text: notification,
        textColor: Colors.black,
        textFontSize:fontMedium,
        isBold: true,
      ),
      content: Container(
        height: 60,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
                height: 60,
                minWidth: (MediaQuery.of(context).size.width-80)/2,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black,width: 0.1)
                ),
                child: const UIText(
                  text: 'Nhập lại',
                  textFontSize: fontMedium,
                  textAlign: TextAlign.center,
                  textColor: mPrimaryColor,
                  isBold: true,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                }
            ),
            MaterialButton(
                height: 60,
                minWidth: (MediaQuery.of(context).size.width-80)/2,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black,width: 0.1)
                ),
                onPressed: onpress,
                child: const UIText(
                  text: 'Tiếp tục',
                  textFontSize: fontMedium,
                  textAlign: TextAlign.center,
                  textColor: mPrimaryColor,
                  isBold: true,
                )
            )
          ],
        ),
      ),
    );
  }
}

class UIStopDialog extends StatelessWidget {
  const UIStopDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      title: const Image(
        width: 250,
        height: 250,
        image: AssetImage("assets/images/warning.gif"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: const UIText(
              text: "Tạm dừng phỏng vấn?",
              textAlign: TextAlign.center,
              textColor: Colors.black,
              isBold: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                    child: const UIText(
                      text: 'Hủy bỏ',
                      textColor: Colors.red,
                      textFontSize: 15,
                      isBold: true,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                MaterialButton(
                    child: const  UIText(
                      text: 'Đồng ý',
                      textColor: mPrimaryColor,
                      textFontSize: 15,
                      isBold: true,),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      NavigationServices.instance.navigateToInterviewStatus(context);
                    }),
              ])
        ],
      ),
    );
  }
}