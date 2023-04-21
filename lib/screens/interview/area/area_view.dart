import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/navigation/navigation_service.dart';
import '../../../components/uis.dart';
import 'area_viewmodel.dart';

class AreaView extends StatefulWidget{
  @override
  _AreaViewState createState() => _AreaViewState();
}

class _AreaViewState extends State<AreaView>{
  late AreaViewModel areaViewModel;

  @override
  void initState() {
    super.initState();
    areaViewModel = context.read();
    areaViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontLarge,
            ),
            onPressed: () => areaViewModel.AreaBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Danh sách địa bàn',
          style: TextStyle(
            fontSize: fontGreater,
            color: mPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const UnderlineInputBorder(
            borderSide: BorderSide(color: mPrimaryColor)
        ),
      ),
      body: SingleChildScrollView(
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              areaViewModel.AreaNext();
            },
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                UIText(
                    text: "99991001: địa bàn 001 - Chưa hoàn thành",
                    textFontSize: fontLarge,
                    isBold: true,
                    textColor: mPrimaryColor
                ),
                UIText(
                    text: 'Số hộ: 12',
                    textFontSize: fontMedium,
                    isBold: true,
                    textColor: Colors.green
                ),
                Divider(height: 20,color: Colors.grey),
              ],
            )
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(colors: [
              Colors.limeAccent,
              Colors.limeAccent,
            ])
        ),
        child: const Text('Mã ĐTV: DTV99003',
          style: TextStyle(fontSize: fontMedium, fontWeight: FontWeight.bold, color: mPrimaryColor),),
      ),
    );
  }

}