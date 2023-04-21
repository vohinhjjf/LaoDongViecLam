import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/navigation/navigation_service.dart';
import '../components/ui_colors.dart';
import '../components/ui_styles.dart';
import '../components/ui_text.dart';

class UIDialog extends StatelessWidget {
  final String waring;

  const UIDialog(
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
            child: const Text(
              "Tạm dừng phỏng vấn?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                    child: const Text('Hủy bỏ',
                        style: TextStyle(
                            color: Colors.red, fontSize: 15)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                MaterialButton(
                    child: const Text('Đồng ý',
                        style: TextStyle(
                            color: mPrimaryColor, fontSize: 15)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      //NavigationServices.instance.navigateToInterviewStatus(context);
                    }),
              ])
        ],
      ),
    );
  }
}