import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/uis.dart';
import '../../../models/area_model.dart';
import '../../../models/bangke_model.dart';
import 'area_replace_viewmodel.dart';

class AreaReplaceView extends StatefulWidget{
  @override
  _AreaReplaceViewState createState() => _AreaReplaceViewState();
}

class _AreaReplaceViewState extends State<AreaReplaceView>{
  late AreaReplaceViewModel areaReplaceViewModel;
  List<AreaModel> list_area = [];
  List<BangKeCsModel> list_household = [];
  String _dtv = "", _month = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      areaReplaceViewModel = context.read();
      areaReplaceViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 300),
              () => {
            setState(() {
              list_area = areaReplaceViewModel.list_area;
              list_household = areaReplaceViewModel.list_household;
              _dtv = areaReplaceViewModel.userName ?? "";
              _month = areaReplaceViewModel.month ?? "";
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
            onPressed: () => areaReplaceViewModel.AreaReplaceBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Danh sách địa bàn - Tháng $_month',
          style: const TextStyle(
            fontSize: fontLarge,
            color: mPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
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
                  padding: const EdgeInsets.only(top: 20),
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      areaReplaceViewModel.AreaReplaceNext();
                      print(list_area[index].iddb!);
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        )
                    ),
                    child: Row(
                      children: [
                        const Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assets/images/tempsnip.png"),
                        ),
                        SizedBox(width: 10.w,),
                        Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIRichText(
                                  text1: "",
                                  text2: "${list_area[index].iddb}: ${list_area[index].tenDiaBan}",
                                  text3: " - Cần được thay",
                                  textFontSize: fontLarge,
                                  textColor: Colors.black,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                UIText(
                                    text: 'Số hộ: ${list_household.length}',
                                    textFontSize: fontMedium,
                                    isBold: true,
                                    textColor: Colors.yellow.shade800
                                ),
                              ],
                            )
                        )
                      ],
                    )
                ),
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