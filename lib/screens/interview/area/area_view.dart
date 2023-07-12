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
          'Danh sách địa bàn - Tháng 7',
          style: TextStyle(
            fontSize: fontGreater,
            color: mPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 20),
          child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                areaViewModel.AreaNext();
              },
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIText(
                      text: "99991001: địa bàn 001 - Chưa hoàn thành",
                      textFontSize: fontLarge,
                      isBold: true,
                      textColor: Colors.black
                  ),
                  UIText(
                      text: 'Số hộ: 12',
                      textFontSize: fontMedium,
                      isBold: true,
                      textColor: Colors.yellow.shade800
                  ),
                ],
              )
          ),
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
        child: const Text('DTV99003',
          style: TextStyle(fontSize: fontMedium, fontWeight: FontWeight.bold, color: mPrimaryColor),),
      ),
    );
  }

}