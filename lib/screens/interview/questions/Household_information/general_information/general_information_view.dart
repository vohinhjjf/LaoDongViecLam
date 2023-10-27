import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import 'general_information_viewmodel.dart';

class GeneralInformationView extends StatefulWidget {
  const GeneralInformationView({Key? key}) : super(key: key);

  @override
  State<GeneralInformationView> createState() => _GeneralInformationViewState();
}

class _GeneralInformationViewState extends State<GeneralInformationView> {
  late GeneralInformationViewModel generalInformationViewModel;
  int? get index => null;
  final _month = TextEditingController();
  final _province = TextEditingController();
  final _district = TextEditingController();
  final _commune = TextEditingController();
  final _area = TextEditingController();
  final _name_area = TextEditingController();
  final _ttnt = TextEditingController();
  final _ho_so = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      generalInformationViewModel = context.read();
      generalInformationViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        _month.text = generalInformationViewModel.data.thangDT == null ?""
            :generalInformationViewModel.data.thangDT.toString(),
        _province.text = generalInformationViewModel.data.maTinh == null ?""
            :generalInformationViewModel.data.maTinh.toString(),
        _district.text = generalInformationViewModel.data.maHuyen == null ?""
            :generalInformationViewModel.data.maHuyen.toString(),
        _commune.text = generalInformationViewModel.data.maXa == null ?""
            :generalInformationViewModel.data.maXa.toString(),
        _area.text = generalInformationViewModel.data.maDiaBan == null ?""
            :generalInformationViewModel.data.maDiaBan.toString(),
        _name_area.text = generalInformationViewModel.data_area.tenDiaBan ?? "",
        if(generalInformationViewModel.data_area.ttnt == null){
          _ttnt.text = "",
        } else if(generalInformationViewModel.data_area.ttnt == 1){
          _ttnt.text = "Thành thị"
        } else {
          _ttnt.text = "Nông thôn"
        },
        _ho_so.text = generalInformationViewModel.data.hoSo == null ?""
            :generalInformationViewModel.data.hoSo.toString(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        iconTheme: const IconThemeData(color: mPrimaryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontGreater,
          isBold: true,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //month
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: const UIText(
                      text:UIDescribes.month,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _month,
                      readOnly: true,
                      style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Tỉnh
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.provinceCode,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _province,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Huyện
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.districtCode,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _district,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Xã
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.communeCode,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _commune,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Địa bàn
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.area,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _area,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Tên địa bàn
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.areaName,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _name_area,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Ttnt
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.ttnt,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _ttnt,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                  //Hộ số
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const UIText(
                      text:UIDescribes.householdNumber,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      controller: _ho_so,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                      child: Container(
                        padding: const EdgeInsets.only(right: 4),
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.black54, width: 2))),
                        child: IconButton(
                          onPressed: () {
                            generalInformationViewModel.GeneralBack();
                          },
                          icon: const Icon(
                            Icons.navigate_before,
                            color: Colors.black54,
                            size: 35,
                          ),
                        ),
                      )), //back
                  ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.black54, width: 2))),
                        child: IconButton(
                          onPressed: () {
                            generalInformationViewModel.GeneralNext();
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.black54,
                            size: 35,
                          ),
                        ),
                      )), //next
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}