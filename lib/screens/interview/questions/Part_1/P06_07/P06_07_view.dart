import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P06_07_viewmodel.dart';

class P06_07View extends StatefulWidget {
  const P06_07View({Key? key}) : super(key: key);

  @override
  State<P06_07View> createState() => _P06_07ViewState();
}

class _P06_07ViewState extends State<P06_07View> {
  late P06_07ViewModel p06_07viewmodel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  int groupValue = 0;
  String nation = "Chọn mã quốc gia";
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p06_07viewmodel = context.read();
      p06_07viewmodel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              thanhvien = p06_07viewmodel.thanhvien;
              groupValue = p06_07viewmodel.thanhvien.c05 ?? 0;
              nation = (p06_07viewmodel.thanhvien.c06 == null || p06_07viewmodel.thanhvien.c06 == '')
                  ? "Chọn mã quốc gia" : p06_07viewmodel.thanhvien.c06!;
            })
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
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p06
                UIRichText(
                  text1: "P06. Hiện nay, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đang cư trú ở Việt Nam hay ở nước ngoài?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "Ở VIỆT NAM",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 1 ? 0 : 1;
                      });
                    },
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    checkedColor: Colors.white,
                    checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                    uncheckedColor: Colors.white,
                    uncheckedWidget: Container(),
                  ),
                  onTap: () {
                    setState(() {
                      groupValue = groupValue == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Ở NƯỚC NGOÀI",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: groupValue == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        groupValue = groupValue == 2 ? 0 : 2;
                      });
                    },
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    checkedColor: Colors.white,
                    checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                    uncheckedColor: Colors.white,
                    uncheckedWidget: Container(),
                  ),
                  onTap: () {
                    setState(() {
                      groupValue = groupValue == 2 ? 0 : 2;
                    });
                  },
                ),
                const SizedBox(height: 20,),
                Visibility(
                  visible: groupValue == 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UIText(
                        text: "P07. Tên và mã nước",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                      ),
                      const SizedBox(height: 10,),
                      DropdownButtonFormField(
                        style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          elevation: 0,
                          dropdownColor: Colors.white,
                          value: nation,
                          onChanged: (value) {
                            setState(() {
                              nation = value!;
                              print(value.split(' - ')[0]);
                              print(value.split(' - ')[1]);
                            });
                          },
                          items: const [ //add items in the dropdown
                            DropdownMenuItem(
                              value: "Chọn mã quốc gia",
                              child: Text("-- Chọn mã quốc gia --"),
                            ),
                            DropdownMenuItem(
                              value: "KHM",
                              child: Text("KHM - Vương quốc\nCampuchia"),
                            ),
                            DropdownMenuItem(
                              value: "IDN",
                              child: Text("IDN - Cộng hòa Indonesia"),
                            ),
                            DropdownMenuItem(
                              value: "LAO",
                              child: Text("LAO - Cộng hòa Dân chủ\nNhân dân Lào"),
                            ),
                            DropdownMenuItem(
                              value: "MYS",
                              child: Text("MYS - Malaysia"),
                            ),
                            DropdownMenuItem(
                              value: "MMR",
                              child: Text("MMR - Liên bang Mianma"),
                            ),
                            DropdownMenuItem(
                              value: "PHL",
                              child: Text("PHL - Cộng hòa Philippin"),
                            ),
                            DropdownMenuItem(
                              value: "SGP",
                              child: Text("SGP - Cộng hòa Singapo"),
                            ),
                            DropdownMenuItem(
                              value: "THA",
                              child: Text("THA - Thái Lan"),
                            ),
                            DropdownMenuItem(
                              value: "DZA",
                              child: Text("DZA - Các nước Trung Đông"),
                            ),
                            DropdownMenuItem(
                              value: "CHN",
                              child: Text("CHN - Cộng hòa Nhân dân\nTrung Hoa"),
                            ),
                            DropdownMenuItem(
                              value: "HKG",
                              child: Text("HKG - Hồng Kông"),
                            ),
                            DropdownMenuItem(
                              value: "IND",
                              child: Text("IND - Cộng hòa Ấn Độ"),
                            ),
                            DropdownMenuItem(
                              value: "JPN",
                              child: Text("JPN - Nhật Bản"),
                            ),
                            DropdownMenuItem(
                              value: "KOR",
                              child: Text("KOR - Hàn Quốc"),
                            ),
                            DropdownMenuItem(
                              value: "TWN",
                              child: Text("TWN - Đài Loan"),
                            ),
                            DropdownMenuItem(
                              value: "BGR",
                              child: Text("BGR - Các nước Đông Âu"),
                            ),
                            DropdownMenuItem(
                              value: "SWE",
                              child: Text("SWE - Các nước Bắc Âu"),
                            ),
                            DropdownMenuItem(
                              value: "USA",
                              child: Text("USA - Hợp chủng quốc Hoa\nKỳ"),
                            ),
                            DropdownMenuItem(
                              value: "CAN",
                              child: Text("CAN - Canada"),
                            ),
                            DropdownMenuItem(
                              value: "AUS",
                              child: Text("AUS - Australia"),
                            ),
                            DropdownMenuItem(
                              value: "AFG",
                              child: Text("AFG - Các nước khác"),
                            ),
                          ],
                      ),
                    ],
                  ),
                ),
                //Button
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p06_07viewmodel.P06_07Back(thanhvien.c04A);
                    }),
                    UINextButton(ontap: (){
                      if(groupValue == 0){
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(waring: 'Thông tin bắt buộc không thể bỏ trống!',)
                        );
                      } else if(groupValue == 2 && nation == "Chọn mã quốc gia"){
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(waring: 'Mã quốc gia nhập vào chưa đúng!',)
                        );
                      }else {
                        p06_07viewmodel.P06_07Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          thangDT: thanhvien.thangDT,
                          namDT: thanhvien.namDT,
                          c00: thanhvien.c00,
                          c01: thanhvien.c01,
                          c01K: thanhvien.c01K,
                          c02: thanhvien.c02,
                          c03A: thanhvien.c03A,
                          c03B: thanhvien.c03B,
                          c04: thanhvien.c04,
                          c04A: thanhvien.c04A,
                          c05: groupValue,
                          c06: groupValue == 2 ? nation : '',
                        ));
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(onTap: (){
            setState(() {
              check_draw = false;
            });
          },)
              : const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}