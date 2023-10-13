import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/thongTinHoNKTT_model.dart';
import '../../../models/thongTinThanhVienNKTT_model.dart';
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
      ttnt='', hoso='', name='', dia_chi='';
  List<thongTinThanhVienNKTTModel> list_NKTT = [];
  var dataNKTT = thongTinHoNKTTModel();

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
          list_NKTT = drawerNavigationModel.list;
          dataNKTT = drawerNavigationModel.dataNKTT;
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: mPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A1
                  ExpansionTile(
                      onExpansionChanged: (z) {
                        setState(() {
                          selected1 = !selected1;
                        });
                      },
                      title: const UIText(
                        text: 'THÔNG TIN HỘ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      children: [
                        ListTile(
                          onTap: () {
                            drawerNavigationModel.navigateToRoute(1, 0);
                          },
                          title: const UIText(
                            text: UIDescribes.month,
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                            isBold: true,
                          ),
                          contentPadding: const EdgeInsets.only(left: 25, top: 0),
                          subtitle: UIText(
                            text: month,
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
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
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected2 = !selected2;
                        });
                      },
                      title: const UIText(
                        text: 'NHÂN KHẨU THỰC TẾ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected2 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: [
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
                          contentPadding: const EdgeInsets.only(left: 25, top: 0),
                          subtitle: UIText(
                            text: list_NKTT.where((element) => element.q1 == "1").length.toString(),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          tileColor: Colors.white,
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
                      
                      onExpansionChanged: (z) {
                        setState(() {
                          selected3 = !selected3;
                        });
                      },
                      title: const UIText(
                        text: 'THÀNH VIÊN',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected3 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      children: list_NKTT.map(
                              (e) => ListTile(
                                onTap: () {
                                  drawerNavigationModel.navigateToRoute(10, e.idtv!);
                                },
                                title: UIText(
                                  text: "${e.idtv}",
                                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: mPrimaryColor),
                                ),
                                subtitle: UIText(
                                  text: "${e.q1_New}",
                                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                                ),
                                tileColor: Colors.white,
                                contentPadding: const EdgeInsets.only(left: 25),
                              )
                      ).toList()
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A4
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected4 = !selected4;
                        });
                      },
                      title: const UIText(
                        text: 'ĐỜI SỐNG HỘ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected4 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: [
                        
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A5
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected5 = !selected5;
                        });
                      },
                      title: const UIText(
                        text: 'PHIẾU 1/DL-HO',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected5 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: []
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A6
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected6 = !selected6;
                        });
                      },
                      title: const UIText(
                        text: 'PHIẾU 2/DL-NĐ',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected6 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: []
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A7
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected7 = !selected7;
                        });
                      },
                      title: const UIText(
                        text: 'PHIẾU 3/DL-NN',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected7 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: []
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  //A8
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (z) {
                        setState(() {
                          selected8 = !selected8;
                        });
                      },
                      title: const UIText(
                        text: 'SỐ ĐIỆN THOẠI',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      trailing: Icon(
                        selected8 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      
                      children: [
                        ExpansionTile(
                          onExpansionChanged: (z) {
                            setState(() {

                            });
                          },
                          title: const UIText(
                            text: "Số điện thoại",
                            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          subtitle: const UIText(
                            text: "",
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ),
                      ]
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app ,
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