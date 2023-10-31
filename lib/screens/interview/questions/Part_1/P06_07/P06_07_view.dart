import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
              nation = p06_07viewmodel.thanhvien.c06 ?? "Chọn mã quốc gia";
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
          textFontSize: fontGreater,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p00
                UIRichText(
                  text1: "P06. Hiện nay, ",
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
                    textFontSize: fontLarge,
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
                    textFontSize: fontLarge,
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
                const SizedBox(height: 15,),
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
                              child: Text("- - Chọn mã quốc gia - -"),
                            ),
                            DropdownMenuItem(
                              value: "KHM - Vương quốc Campuchia",
                              child: Text("KHM - Vương quốc\nCampuchia"),
                            ),
                            DropdownMenuItem(
                              value: "IDN - Cộng hòa Indonesia",
                              child: Text("IDN - Cộng hòa Indonesia"),
                            ),
                            DropdownMenuItem(
                              value: "LAO - Cộng hòa Dân chủ Nhân dân Lào",
                              child: Text("LAO - Cộng hòa Dân chủ\nNhân dân Lào"),
                            ),
                            DropdownMenuItem(
                              value: "MYS - Malaysia",
                              child: Text("MYS - Malaysia"),
                            ),
                            DropdownMenuItem(
                              value: "MMR - Liên bang Mianma",
                              child: Text("MMR - Liên bang Mianma"),
                            ),
                            DropdownMenuItem(
                              value: "PHL - Cộng hòa Philippin",
                              child: Text("PHL - Cộng hòa Philippin"),
                            ),
                            DropdownMenuItem(
                              value: "SGP - Cộng hòa Singapo",
                              child: Text("SGP - Cộng hòa Singapo"),
                            ),
                            DropdownMenuItem(
                              value: "THA - Thái Lan",
                              child: Text("THA - Thái Lan"),
                            ),
                            DropdownMenuItem(
                              value: "DZA - Các nước Trung Đông",
                              child: Text("DZA - Các nước Trung Đông"),
                            ),
                            DropdownMenuItem(
                              value: "CHN - Cộng hòa Nhân dân Trung Hoa",
                              child: Text("CHN - Cộng hòa Nhân dân\nTrung Hoa"),
                            ),
                            DropdownMenuItem(
                              value: "HKG - Hồng Kông",
                              child: Text("HKG - Hồng Kông"),
                            ),
                            DropdownMenuItem(
                              value: "IND - Cộng hòa Ấn Độ",
                              child: Text("IND - Cộng hòa Ấn Độ"),
                            ),
                            DropdownMenuItem(
                              value: "JPN - Nhật Bản",
                              child: Text("JPN - Nhật Bản"),
                            ),
                            DropdownMenuItem(
                              value: "KOR - Hàn Quốc",
                              child: Text("KOR - Hàn Quốc"),
                            ),
                            DropdownMenuItem(
                              value: "TWN - Đài Loan",
                              child: Text("TWN - Đài Loan"),
                            ),
                            DropdownMenuItem(
                              value: "BGR - Các nước Đông Âu",
                              child: Text("BGR - Các nước Đông Âu"),
                            ),
                            DropdownMenuItem(
                              value: "SWE - Các nước Bắc Âu",
                              child: Text("SWE - Các nước Bắc Âu"),
                            ),
                            DropdownMenuItem(
                              value: "USA - Hợp chủng quốc Hoa Kỳ",
                              child: Text("USA - Hợp chủng quốc Hoa\nKỳ"),
                            ),
                            DropdownMenuItem(
                              value: "CAN - Canada",
                              child: Text("CAN - Canada"),
                            ),
                            DropdownMenuItem(
                              value: "AUS - Australia",
                              child: Text("AUS - Australia"),
                            ),
                            DropdownMenuItem(
                              value: "AFG - Các nước khác",
                              child: Text("AFG - Các nước khác"),
                            ),
                          ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
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
                          p06_07viewmodel.P06_07Back(thanhvien.c04A);
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
                            if(groupValue == 2){
                              p06_07viewmodel.P06_07Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c05: groupValue,
                                c06: nation,
                              ));
                            } else {
                              p06_07viewmodel.P06_07Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c05: groupValue,
                              ));
                            }
                          }
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
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}