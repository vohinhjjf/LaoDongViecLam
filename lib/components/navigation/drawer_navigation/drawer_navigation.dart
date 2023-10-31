import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/doiSongHo_model.dart';
import '../../../models/thongTinHoNKTT_model.dart';
import '../../../models/thongTinThanhVienNKTT_model.dart';
import '../../../models/thongTinThanhVien_model.dart';
import '../../uis.dart';
import 'drawer_navigation_model.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  late DrawerNavigationModel drawerNavigationModel;
  int selectedIndex = -1; //dont set it to 0
  bool selected = false, selected1 = false, selected2 = false
  , selected3 = false, selected4 = false, selected5 = false
  , selected6 = false, selected7 = false, selected8 = false;
  String month ='', province ="", district ="", commune="", area='',name_area='',
      ttnt='', hoso='', name='', dia_chi='', so_dien_thoai = '';
  List<thongTinThanhVienNKTTModel> list_NKTT = [];
  var dataNKTT = thongTinHoNKTTModel();
  var dataDSH = DoiSongHoModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      drawerNavigationModel = context.read();
      drawerNavigationModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 300), () => {
        setState((){
          month = drawerNavigationModel.data.thangDT == null ?""
              :drawerNavigationModel.data.thangDT.toString();
          province = drawerNavigationModel.data.maTinh == null ?""
              :drawerNavigationModel.data.maTinh.toString();
          district = drawerNavigationModel.data.maHuyen == null ?""
              :drawerNavigationModel.data.maHuyen.toString();
          commune = drawerNavigationModel.data.maXa == null ?""
              :drawerNavigationModel.data.maXa.toString();
          area = drawerNavigationModel.data.maDiaBan == null ?""
              :drawerNavigationModel.data.maDiaBan.toString();
          ttnt = drawerNavigationModel.data.ttnt == null ?""
              :drawerNavigationModel.data.ttnt.toString();
          hoso = drawerNavigationModel.data.hoSo == null ?""
              :drawerNavigationModel.data.hoSo.toString();
          name = drawerNavigationModel.data.tenChuHo == null ?""
              :drawerNavigationModel.data.tenChuHo.toString();
          dia_chi = drawerNavigationModel.data.diachi == null ?""
              :drawerNavigationModel.data.diachi.toString();
          so_dien_thoai = drawerNavigationModel.data.dienThoai == null ?""
              :drawerNavigationModel.data.dienThoai.toString();
          list_NKTT = drawerNavigationModel.list;
          dataNKTT = drawerNavigationModel.dataNKTT;
          dataDSH = drawerNavigationModel.dataDSH;
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A1
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: mPrimaryColor,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected1 = z;
                        });
                      },
                      title: UIText(
                        text: 'THÔNG TIN HỘ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected1 ? mPrimaryColor : Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: selected1 ? mPrimaryColor : Colors.white,
                      ),
                      children: [
                        Container(
                          height: 1,
                          color: mPrimaryColor,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(1, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.month,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: month,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                              drawerNavigationModel.navigateToRoute(1, 0);
                            },
                            title: const UIText(
                              text: UIDescribes.provinceCode,
                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            ),
                            subtitle: UIText(
                              text: province,
                              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                            onTap: () {
                              drawerNavigationModel.navigateToRoute(1, 0);
                            },
                            title: const UIText(
                              text: UIDescribes.districtCode,
                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            ),
                            subtitle: UIText(
                              text: district,
                              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                            onTap: () {
                              drawerNavigationModel.navigateToRoute(1, 0);
                            },
                            title: const UIText(
                              text: UIDescribes.communeCode,
                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            ),
                            subtitle: UIText(
                              text: commune,
                              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                            onTap: () {
                              drawerNavigationModel.navigateToRoute(1, 0);
                            },
                            title: const UIText(
                              text: UIDescribes.area,
                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            ),
                            subtitle: UIText(
                              text: area,
                              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(1, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.areaName,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                          ),
                          subtitle: UIText(
                            text: name_area,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(1, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.ttnt,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                          ),
                          subtitle: UIText(
                            text: ttnt,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(1, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.householdNumber,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                          ),
                          subtitle: UIText(
                            text: hoso,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(2, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.householderName,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                          ),
                          subtitle: UIText(
                            text: name,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(2, 0);
                          },
                          title: const UIText(
                            text: "Địa chỉ",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                          ),
                          subtitle: UIText(
                            text: dia_chi,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A2
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: mPrimaryColor,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected2 = z;
                        });
                      },
                      title: UIText(
                        text: 'NHÂN KHẨU THỰC TẾ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected2 ? mPrimaryColor : Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected2 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: selected2 ? mPrimaryColor : Colors.white,
                      ),
                      children: [
                        Container(
                          height: 1,
                          color: mPrimaryColor,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: UIText(
                            text: UIQuestions.q1(month),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: list_NKTT.where((element) => element.q1 == "1").length.toString(),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(4, 0);
                          },
                          title: UIText(
                            text: UIQuestions.q2(month),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q2_New == null ? "" : (dataNKTT.q2_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(5, 0);
                          },
                          title: const UIText(
                            text: "Q3${UIQuestions.q3a}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q3A_New == null ? "" : (dataNKTT.q3A_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(5, 0);
                          },
                          title: const UIText(
                            text: "Q3${UIQuestions.q3b}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q3B_New == null ? "" : (dataNKTT.q3B_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(5, 0);
                          },
                          title: const UIText(
                            text: "Q3${UIQuestions.q3c}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q3C_New == null ? "" : (dataNKTT.q3C_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(5, 0);
                          },
                          title: const UIText(
                            text: "Q3${UIQuestions.q3d}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q3D_New == null ? "" : (dataNKTT.q3D_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4a}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4A_New == null ? "" : (dataNKTT.q4A_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4b}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4B_New == null ? "" : (dataNKTT.q4B_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4c}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4C_New == null ? "" : (dataNKTT.q4C_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4d}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4D_New == null ? "" : (dataNKTT.q4D_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4e}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4E_New == null ? "" : (dataNKTT.q4E_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(6, 0);
                          },
                          title: const UIText(
                            text: "Q4${UIQuestions.q4f}",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q4F_New == null ? "" : (dataNKTT.q4F_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(7, 0);
                          },
                          title: UIText(
                            text: UIQuestions.q5(month),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: UIText(
                            text: dataNKTT.q5A_New == null ? "" : (dataNKTT.q5A_New == 1 ? "Có" : "Không"),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(8, 0);
                          },
                          title: const UIText(
                            text: UIQuestions.q6,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: const UIText(
                            text: "",
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(9, 0);
                          },
                          title: const UIText(
                            text: UIQuestions.q7,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          subtitle: const UIText(
                            text: "",
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 25),
                        ),
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A3
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: mPrimaryColor,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected3 = z;
                        });
                      },
                      title: UIText(
                        text: 'THÀNH VIÊN',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected3 ? mPrimaryColor : Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected3 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: selected3 ? mPrimaryColor : Colors.white,
                      ),
                      children: list_NKTT.map(
                              (e) => Column(
                                children: [
                                  Container(
                                    height: 1,
                                    color: list_NKTT.indexOf(e) == 0 ? mPrimaryColor : Colors.grey.shade100,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      if(list_NKTT.any((e) => e.q6_New == 1)){
                                        drawerNavigationModel.navigateToRoute(10, e.idtv!);
                                      }
                                    },
                                    title: UIText(
                                      text: "${list_NKTT.indexOf(e) + 1}",
                                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                                    ),
                                    subtitle: UIText(
                                      text: "${e.q1_New}",
                                      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                    ),
                                    tileColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(left: 25),
                                  ),
                                ],
                              )
                      ).toList()
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A4
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: mPrimaryColor,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected4 = !selected4;
                        });
                      },
                      title: UIText(
                        text: 'ĐỜI SỐNG HỘ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected4 ? mPrimaryColor : Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected4 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: selected4 ? mPrimaryColor : Colors.white,
                      ),
                      children: [
                        Container(
                          height: 1,
                          color: mPrimaryColor,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P76. Đời sống gia đình hiện nay",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P76(dataDSH.c62_M1 ?? 0),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P77. Thu nhập gia đình hiện nay",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P76(dataDSH.c62_M2 ?? 0),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P78. Nguyên nhân thu nhập giảm đi",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P78(dataDSH),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P79. Thu nhập thay đổi",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P77_79_81(dataDSH.c62_M4 ?? 0),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P80. Nguyên nhân làm giảm thu nhập",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P80(dataDSH),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P81. Chỉ tiêu thay đổi",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P77_79_81(dataDSH.c62_M6 ?? 0),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P82. Nguyên nhân làm chỉ tiêu giảm",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P82(dataDSH),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P83. Chịu ảnh hưởng tiêu cực",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P83(dataDSH),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        ListTile(
                          onTap: () {
                            //drawerNavigationModel.navigateToRoute(3, 0);
                          },
                          title: const UIText(
                            text: "P84. Những nguồn trợ giúp",
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: AppValues.P84(dataDSH),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A8
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: mPrimaryColor,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected8 = !selected8;
                        });
                      },
                      title: UIText(
                        text: 'SỐ ĐIỆN THOẠI',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected8 ? mPrimaryColor : Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected8 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: selected8 ? mPrimaryColor : Colors.white,
                      ),
                      children: [
                        Container(
                          height: 1,
                          color: mPrimaryColor,
                        ),
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(19, list_NKTT.firstWhere((e) => e.q6_New == 1).idtv!);
                          },
                          title: UIText(
                            text: so_dien_thoai,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            maxLines: 1,
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          subtitle: UIText(
                            text: '',
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
                        ),
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  ListTile(
                    tileColor: mPrimaryColor,
                    trailing: const Icon(Icons.exit_to_app ,
                      color: Colors.white,
                    ),
                    title: const UIText(
                      text: 'THOÁT',
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => const UIStopDialog());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerNavigationThanhVien extends StatefulWidget {
  late Function()? onTap;
  DrawerNavigationThanhVien({Key? key, this.onTap}) : super(key: key);

  @override
  State<DrawerNavigationThanhVien> createState() => _DrawerNavigationThanhVienState();
}

class _DrawerNavigationThanhVienState extends State<DrawerNavigationThanhVien> {
  late DrawerNavigationModel drawerNavigationModel;
  List<thongTinThanhVienNKTTModel> list_NKTT = [];
  List<thongTinThanhVienModel> list_tttv = [];
  bool selected = false; int ide = 0;

   List<Map<String, String>> map(thongTinThanhVienModel tttv){
    return [
      {"P00. HỌ VÀ TÊN": tttv.c00 ?? ""},
      {"P01. Quan hệ": AppValues.P01(tttv.c01 ?? 0, tttv.c01K ?? "")},
      {"P02. Giới tính": tttv.c02 == null ? "" : (tttv.c02 == 1 ? "Nam" : "Nữ")},
      {"P03. Tháng, năm sinh": tttv.c03B ?? ""},
      {"P04. Tuổi": tttv.c04 == null ? "" : tttv.c04.toString()},
      {"P05. Có con dưới 3 tuổi sống cùng hộ không?": tttv.c04A == null ? "" : (tttv.c04A == 1 ? "CÓ" : "KHÔNG")},
      {"P06. Ở Việt Nam/nước ngoài?": tttv.c05 == null ? "" : (tttv.c05 == 1 ? "Ở VIỆT NAM" : "Ở NƯỚC NGOÀI")},
      {"P08. Tình trạng hôn nhân": AppValues.P08(tttv.c07 ?? 0)},
      {"P09. Thời gian thường trú": AppValues.P09(tttv.c08 ?? 0)},
      {"P10. Chuyển đến từ đâu?": tttv.c09 == null ? "" : (tttv.c09 == 1 ? "Ở VIỆT NAM" : "Ở NƯỚC NGOÀI")},
      {"P11. Phường, thị trấn hay xã?": tttv.c10 == null ? "" : (tttv.c10 == 1 ? "PHƯỜNG/THỊ TRẤN" : "XÃ")},
      {"P12. Lý do chuyển đến": AppValues.P12(tttv.c10M ?? 0, tttv.c10_MK ?? "")},
      {"P13. Tình trạng đi học": tttv.c11 == null ? "" : (tttv.c11 == 1 ? "CÓ" : "KHÔNG")},
      {"P14. Tình trạng đào tạo ngắn hạn hoặc bổ sung kiến thức, kỹ năng": tttv.c12 == null ? "" : (tttv.c12 == 1 ? "CÓ" : "KHÔNG")},
      {"P15. Trình độ giáo dục cao nhất": AppValues.P15(tttv.c13 ?? 0)},
      {"P16. Trình độ giáo dục cao nhất": AppValues.P16(tttv)},
      {"P17. Chuyên ngành đào tạo": tttv.c15A ?? ""},
      {"P18. Trình độ nghề": tttv.c16A == null ? "" : (tttv.c16A == 1 ? "CÓ" : "KHÔNG")},
      {"P19. Có làm việc 7 ngày qua": tttv.c17 == null ? "" : (tttv.c17 == 1 ? "CÓ" : "KHÔNG")},
      {"P20. Có tham gia SXKD": tttv.c18 == null ? "" : (tttv.c18 == 1 ? "CÓ" : "KHÔNG")},
      {"P21. Có giúp TV khác trong gia đình": tttv.c19 == null ? "" : (tttv.c19 == 1 ? "CÓ" : "KHÔNG")},
      {"P22. Vẫn được trả công": tttv.c20 == null ? "" : (tttv.c20 == 1 ? "CÓ" : "KHÔNG")},
      {"P23. Lý do tạm nghỉ": AppValues.P23(tttv.c21 ?? 0, tttv.c21K ?? "")},
      {"P24. Quay lại công việc": tttv.c22 == null ? "" : (tttv.c22 == 1 ? "CÓ" : "KHÔNG")},
      {"P25. Có thu nhập khi nghỉ": tttv.c23 == null ? "" : (tttv.c23 == 1 ? "CÓ" : "KHÔNG")},
      {"P26. Có làm TT/CN hay thủy sản": tttv.c24 == null ? "" : (tttv.c24 == 1 ? "CÓ" : "KHÔNG")},
      {"P27. CV thuộc ngành": AppValues.P27(tttv.c25 ?? 0)},
      {"P28. Mục đích làm sản phẩm": AppValues.P28(tttv.c26 ?? 0)},
      {"P29. Làm cho ai": tttv.c27 == null ? "" : (tttv.c27 == 1 ? "LÀM CHO GIA ĐÌNH MÌNH" : "LÀM THUÊ CHO NGƯỜI KHÁC")},
      {"P30. Có làm CV khác không?": tttv.c28 == null ? "" : (tttv.c28 == 1 ? "CÓ" : "KHÔNG")},
      {"P31. Có chủ động tìm kiếm CV": tttv.c29 == null ? "" : (tttv.c29 == 1 ? "CÓ" : "KHÔNG")},
      {"P32. Đã tìm được việc": tttv.c30 == null ? "" : (tttv.c30 == 1 ? "CÓ" : "KHÔNG")},
      {"P33. Cách tìm việc": AppValues.P33(tttv)},
      {"P34. Có thực sự cần một CV": tttv.c30A == null ? "" : (tttv.c30A == 1 ? "CÓ" : "KHÔNG")},
      {"P35. Lý do không tìm việc": AppValues.P35(tttv.c31 ?? 0, tttv.c31K ?? "")},
      {"P36. Có sẵn sàng làm việc": tttv.c32 == null ? "" : (tttv.c32 == 1 ? "CÓ" : "KHÔNG")},
      {"P37. Thời gian không có việc": AppValues.P37(tttv.c33 ?? 0)},
      {"P38. Lý do không làm việc": AppValues.P38(tttv.c33A ?? 0, tttv.c33AK ?? "")},
      {"P39. Công việc chính": tttv.c34 ?? ""},
      {"P40. Chức danh CV chính": tttv.c35A ?? ""},
      {"P41. Tên cơ sở": tttv.c36 ?? ""},
      {"P42. Hoạt động chính hoặc sp": tttv.c37A ?? ""},
      {"P43. Loại hình cơ sở": AppValues.P43(tttv.c38 ?? 0)},
      {"P44. CS có đăng kí KD": tttv.c39 == null ? "" : (tttv.c39 == 1 ? "CÓ" : "KHÔNG")},
      {"P45. Số giờ thực tế": tttv.c40 == null ? "" : tttv.c40.toString()},
      {"P46. Đang tạm nghỉ": tttv.c40A == null ? "" : (tttv.c40A == 1 ? "CÓ" : "KHÔNG")},
      {"P47. Khoảng thu nhập tháng trước": AppValues.P47_60(tttv.c41 ?? 0)},
      {"P48. Số tiền nhận được": tttv.c42 == null ? "" : tttv.c42.toString()},
      {"P49. Vị trí việc làm": AppValues.P49(tttv.c43 ?? 0)},
      {"P50. Loại hợp đồng LĐ": AppValues.P50(tttv.c44 ?? 0)},
      {"P51. Có đóng BHXH": tttv.c45 == null ? "" : (tttv.c45 == 1 ? "CÓ" : "KHÔNG")},
      {"P52. Loại hình BHXH": tttv.c46 == null ? "" : (tttv.c46 == 1 ? "BHCH BẮT BUỘC" : "BHXH TỰ NGUYỆN")},
      {"P53. Thời gian đã làm việc": AppValues.P53(tttv.c47 ?? 0)},
      {"P54. Có làm hơn một việc": tttv.c48 == null ? "" : (tttv.c48 == 1 ? "CÓ" : "KHÔNG")},
      {"P55. Công việc thứ 2": tttv.c49 ?? ""},
      {"P56. Chức danh CV2": tttv.c50A ?? ""},
      {"P57. Tên cơ sở CV2": tttv.c51 ?? ""},
      {"P58. Sản phẩm CV2": tttv.c52A ?? ""},
      {"P59. Số giờ thực tế làm CV2": tttv.c53 == null ? "" : tttv.c53.toString()},
      {"P60. Khoảng thu nhập tháng trước": AppValues.P47_60(tttv.c54 ?? 0)},
      {"P61. Số tiền nhận được từ CV2": tttv.c55 == null ? "" : tttv.c55.toString()},
      {"P62. Có làm hơn 2 việc": tttv.c56 == null ? "" : (tttv.c56 == 1 ? "CÓ" : "KHÔNG")},
      {"P63. Số giờ làm các CV khác": tttv.c57 == null ? "" : tttv.c57.toString()},
      {"P64. Số tiền nhận được từ CV khác": tttv.c58 == null ? "" : tttv.c58.toString()},
      {"P65. Số giờ của tất cả CV": tttv.c59 == null ? "" : (tttv.c59 == 1 ? "CÓ" : "KHÔNG")},
      {"P66. Tổng thu nhập": tttv.c60 == null ? "" : (tttv.c60 == 1 ? "CÓ" : "KHÔNG")},
      {"P67. Muốn làm thêm giờ": tttv.c61 == null ? "" : (tttv.c61 == 1 ? "CÓ" : "KHÔNG")},
      {"P68. Làm thêm giờ 2 tuần tới ": tttv.c62 == null ? "" : (tttv.c62 == 1 ? "CÓ" : "KHÔNG")},
      {"P69. Số giờ để TT/CN gia súc, gia cầm": tttv.c63 == null ? "" : tttv.c63.toString()},
      {"P70. Người làm chính/phụ giúp thành viên": tttv.c64 == null ? "" : (tttv.c64 == 1 ? "LÀ NGƯỜI LÀM CHÍNH" : "LÀ NGƯỜI PHỤ GIÚP")},
      {"P71. Số giờ để dọn dẹp nhà": tttv.c65 == null ? "" : tttv.c65.toString()},
      {"P72. Số giờ để SXSP": tttv.c66 == null ? "" : tttv.c66.toString()},
      {"P73. Số giờ để xây dựng/sửa chữa": tttv.c67 == null ? "" : tttv.c67.toString()},
      {"P74. Số giờ để chăm sóc/hỗ trợ": tttv.c68 == null ? "" : tttv.c68.toString()},
      {"P75. Số giờ để chăm sóc trẻ em dưới 18 tuổi": tttv.c69 == null ? "" : tttv.c69.toString()},
    ];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      drawerNavigationModel = context.read();
      drawerNavigationModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          list_NKTT = drawerNavigationModel.list;
          list_tttv = drawerNavigationModel.list_tttv;
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: ListView(
          children: [
            Container(
              height: 1,
              color: Colors.white,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: list_NKTT.length,
                itemBuilder: (context, index){
                  var tttv = list_tttv.firstWhere((e) => e.idtv == list_NKTT[index].idtv);
                  return Column(
                    children: [
                      ExpansionTile(
                          backgroundColor: ide == index + 1 ? mPrimaryColor : Colors.white,
                          collapsedBackgroundColor: mPrimaryColor,
                          onExpansionChanged: (z) {
                            setState(() {
                              selected = z;
                              ide = z ? index+1 : 0;
                            });
                          },
                          title: UIText(
                            text: '${index + 1} - ${list_NKTT[index].q1_New}',
                            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: ide == index + 1 ? mPrimaryColor : Colors.white),
                          ),
                          tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          trailing: Icon(
                            ide == index + 1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: ide == index + 1 ? mPrimaryColor : Colors.white,
                          ),
                          children: map(tttv).map((e){
                            return Column(
                              children: [
                                Container(
                                height: 1,
                                color: e.containsKey("P00. HỌ VÀ TÊN") ? mPrimaryColor : Colors.grey.shade100,
                              ),
                                ListTile(
                                  onTap: () {
                                    //drawerNavigationModel.navigateToRoute(3, 0);
                                  },
                                  title: UIText(
                                    text: e.keys.single,
                                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                                    maxLines: 1,
                                    isBold: true,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 20, top: 0),
                                  subtitle: UIText(
                                    text: e.values.single,
                                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                                    maxLines: 1,
                                  ),
                                  tileColor: Colors.white,
                                ),
                              ],
                            );
                          }).toList()
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  );
                }
            ),
            Container(
              height: 1,
              color: Colors.white,
            ),
            ListTile(
              tileColor: mPrimaryColor,
              trailing: const Icon(Icons.exit_to_app ,
                color: Colors.white,
              ),
              title: const UIText(
                text: 'THOÁT',
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              onTap: widget.onTap,
            ),
          ],
        ),
      )
    );
  }
}