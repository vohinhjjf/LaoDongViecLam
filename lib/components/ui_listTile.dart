import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:LDVL2024/components/uis.dart';

class UIListTile extends StatelessWidget {
  final String text;
  final bool check;
  final Function(bool?)? onTap1;
  final Function()? onTap2;

  const UIListTile({super.key,
    required this.check,
    this.onTap1,
    this.onTap2,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: ShapeDecoration(
          color: check ? GFColors.PRIMARY.withOpacity(0.15) : Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: check ? GFColors.PRIMARY.withOpacity(0.15) : Colors.black, width: 0.3),
              borderRadius: const BorderRadius.all(Radius.circular(5.0))
          ),
        ),
        alignment: Alignment.centerLeft,
        child: UIText(
          text: text,
          textColor: check ? GFColors.PRIMARY : Colors.black,
          textFontSize: fontMedium,
          textAlign: TextAlign.start,
        ),
      ),
      leading: RoundCheckBox(
        isChecked: check,
        isRound: true,
        onTap: onTap1,
        border: Border.all(
          width: 0.3,
          color: check ? GFColors.PRIMARY.withOpacity(0.15) : Colors.black,
        ),
        checkedColor: GFColors.PRIMARY.withOpacity(0.15),
        checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
        uncheckedColor: Colors.white,
        uncheckedWidget: Container(),
      ),
      onTap: onTap2,
    );
  }
}