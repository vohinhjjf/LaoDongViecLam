import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/uis.dart';
import '../../../models/area_model.dart';
import '../../../models/bangke_model.dart';
import 'area_viewmodel.dart';

class AreaView extends StatefulWidget{
  @override
  _AreaViewState createState() => _AreaViewState();
}

class _AreaViewState extends State<AreaView>{
  late AreaViewModel areaViewModel;
  List<AreaModel> list_area = [];
  List<BangKeCsModel> list_household = [];
  String _dtv = "", _month = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      areaViewModel = context.read();
      areaViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              list_area = areaViewModel.list_area;
              list_household = areaViewModel.list_household;
              _dtv = areaViewModel.userName ?? "";
              _month = areaViewModel.month ?? "";
            })
          });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontLarge,
            ),
            onPressed: () => areaViewModel.AreaBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: UIText(
          text: 'Danh sách địa bàn - Tháng $_month',
          textFontSize: fontLarge,
          textColor: mPrimaryColor,
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 14.w, vertical: 20),
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: list_area.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      areaViewModel.AreaNext(list_area[index].iddb!);
                      print(list_area[index].iddb!);
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UIText(
                          text: "${list_area[index].iddb}: ${list_area[index].tenDiaBan} - Chưa hoàn thành",
                          textFontSize: fontLarge,
                          isBold: true,
                          textColor: Colors.black
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      UIText(
                          text: 'Số hộ: ${list_household.where((e) => e.hoDuPhong == 0).toList().length}',
                          textFontSize: fontMedium,
                          isBold: true,
                          textColor: Colors.yellow.shade800
                      ),
                    ],
                  )
                )
              );
            },
          ),
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
        child: UIText( text: _dtv,
          textFontSize: fontMedium, isBold: true, textColor: mPrimaryColor,),
      ),
    );
  }

}