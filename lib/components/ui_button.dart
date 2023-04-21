import 'package:flutter/material.dart';
import '../components/ui_text.dart';


class UIStopButton extends StatelessWidget {
  const UIStopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
      child: MaterialButton(
        onPressed: (){

        },
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            side:BorderSide(color: Colors.red,width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: const UIText(
          text: 'STOP',
          textColor: Colors.red,
          isBold: true,
        ),
      ),
    );
  }
}