import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P01_04_viewmodel.dart';

class P01_04View extends StatefulWidget {
  const P01_04View({Key? key}) : super(key: key);

  @override
  State<P01_04View> createState() => _P01_04ViewState();
}

class _P01_04ViewState extends State<P01_04View> {
  late P01_04ViewModel p01_04viewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _orther = TextEditingController();
  final _year = TextEditingController();
  final _age = TextEditingController();
  int p01 = 0, p02 = 0, p03 = 0, ThangDT = 8;
  String month = 'Chọn tháng';
  bool check = false;

  var _quanhe = [
    "VỢ/CHỒNG",
    "CON ĐẺ",
    "CHÁU NỘI/NGOẠI",
    "BỐ/MẸ",
    "QUAN HỆ GIA ĐÌNH KHÁC",
    "NGƯỜI GIÚP VIỆC",
    "KHÁC (GHI RÕ)"
  ];

  int tinh_tuoi(){
    var tuoi = 0;
    if(int.parse(month.substring(5)) >= 1 && int.parse(month.substring(5)) < ThangDT){
      tuoi = (DateTime.now().year - int.parse(_year.text));
    }
    else if(int.parse(month.substring(5)) >= ThangDT && int.parse(month.substring(5)) < 13){
      tuoi = (DateTime.now().year - int.parse(_year.text) - 1);
    }
    else{
      tuoi = int.parse(_age.text);
    }
    return tuoi;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p01_04viewModel = context.read();
      p01_04viewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p01_04viewModel.thanhvien;
              _name.text = p01_04viewModel.thanhvien.c00 ?? "";
              p01 = p01_04viewModel.thanhvien.c01 ?? 0;
              p02 = p01_04viewModel.thanhvien.c02 ?? 0;
              month = p01_04viewModel.thanhvien.c03A ?? "Chọn tháng";
              _year.text = p01_04viewModel.thanhvien.c03B ?? "";
              _age.text = p01_04viewModel.thanhvien.c04 == null ? ""
                  : p01_04viewModel.thanhvien.c04.toString();
              p03 = p01_04viewModel.thanhvien.c03B == "9998" ? 1 : 0;
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p00
                  const UIText(
                    text: "P00. HỌ VÀ TÊN",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _name,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Vui lòng nhập tên';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //p01
                  Visibility(
                      visible: thanhvien.c01 == 1 ? false : true,
                      child: Column(
                        children: [
                          UIText(
                            text: "P01. ${_name.text} có mối quan hệ nào với chủ hộ?",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                            isBold: false,
                          ),
                          const SizedBox(height: 10,),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _quanhe.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: UIText(
                                  text: _quanhe[index].toString(),
                                  textColor: Colors.black,
                                  textFontSize: fontLarge,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                                leading: RoundCheckBox(
                                  isChecked: p01 == index+2 ? true : false,
                                  onTap: (selected) {
                                    setState(() {
                                      p01 = p01 == index+2 ? 0 : index+2;
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
                                    p01 = p01 == index+2 ? 0 : index+2;
                                  });
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 5,),
                          Visibility(
                            visible: p01 == 8,
                            child: TextFormField(
                              controller: _orther,
                              validator: (value){
                                if(p01 == 8 && value!.isEmpty){
                                  return 'Vui lòng nhập quan hệ khác';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      )
                  ),
                  //p02
                  UIText(
                    text: "P02. ${_name.text} là nam hay nữ?",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  const SizedBox(height: 5,),
                  ListTile(
                    title: const UIText(
                      text: "NAM",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p02 == 1 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p02 = p02 == 1 ? 0 : 1;
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
                        p02 = p02 == 1 ? 0 : 1;
                      });
                    },
                  ),
                  ListTile(
                    title: const UIText(
                      text: "NỮ",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: RoundCheckBox(
                      isChecked: p02 == 2 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p02 = p02 == 2 ? 0 : 2;
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
                        p02 = p02 == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(height: 15,),
                  //p03
                  UIText(
                    text: "P03. ${_name.text} sinh vào tháng, năm dương lịch nào?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: UIText(
                          text: "Tháng",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: DropdownButtonFormField(
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
                          dropdownColor: Colors.white,
                          value: month,
                          items: const [ //add items in the dropdown
                            DropdownMenuItem(
                              value: 'Chọn tháng',
                              child: Text("Chọn tháng"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 1",
                              child: Text("Tháng 1"),
                            ),
                            DropdownMenuItem(
                                value: "Tháng 2",
                                child: Text("Tháng 2")
                            ),
                            DropdownMenuItem(
                              value: "Tháng 3",
                              child:  Text("Tháng 3"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 4",
                              child:  Text("Tháng 4"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 5",
                              child:  Text("Tháng 5"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 6",
                              child:  Text("Tháng 6"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 7",
                              child:  Text("Tháng 7"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 8",
                              child:  Text("Tháng 8"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 9",
                              child:  Text("Tháng 9"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 10",
                              child:  Text("Tháng 10"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 11",
                              child:  Text("Tháng 11"),
                            ),
                            DropdownMenuItem(
                              value: "Tháng 12",
                              child: Text("Tháng 12"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              month = value.toString();
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: UIText(
                          text: "Năm",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          controller: _year,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Vui lòng nhập năm';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.datetime,
                          readOnly: check,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          ),
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const UIText(
                      text: "Không xác định năm",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    trailing: RoundCheckBox(
                      isChecked: p03 == 1 ? true : false,
                      onTap: (selected) {
                        setState(() {
                          p03 = p03 == 1 ? 0 : 1;
                          check = selected!;
                          _year.text = selected ? "9998" : "";
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
                        p03 = p03 == 1 ? 0 : 1;
                        check = !check;
                        _year.text = check ? "9998" : "";
                      });
                    },
                  ),
                  const SizedBox(height: 15,),
                  Visibility(
                      visible: p03 == 0 ? false : true,
                      child: Column(
                        children: [
                          UIText(
                            text: "P04. Hiện nay, ${_name.text} bao nhiêu tuổi tròn theo dương lịch?",
                            textColor: Colors.black,
                            textFontSize:fontLarge,
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            autofocus: true,
                            controller: _age,
                            validator: (value){
                              if(p03 != 0 && value!.isEmpty){
                                return 'Vui lòng nhập số tuổi';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
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
                          p01_04viewModel.P01_04Back(thanhvien.c01!);
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
                          if(_formKey.currentState!.validate()) {
                            if (p01 == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'Mối quan hệ với chủ hộ nhập vào chưa đúng!.',)
                              );
                            }
                            else if (p02 == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'Giới tính nhập vào chưa đúng!',)
                              );
                            }
                            else if (month == "Chọn tháng") {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'Tháng nhập vào chưa đúng',)
                              );
                            }
                            else if (p01 == 8 && _orther.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'Mối quan hệ khác nhập vào chưa đúng!',)
                              );
                            }
                            else if (p03 == 1 && _age.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'Số tuổi nhập vào chưa đúng!',)
                              );
                            }
                            else if (p01 == 2 && tinh_tuoi() < 15) {
                              showDialog(
                                  context: context,
                                  builder: (_) => UIWarningDialog(
                                    waring: 'Vợ/chồng chủ hộ ${_name
                                        .text} có tuổi< 15 tuổi!',)
                              );
                            }
                            else {
                              if (thanhvien.c01 != 1) {
                                p01_04viewModel.P01_04Next(
                                    thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c00: _name.text,
                                        c01: p01,
                                        c01K: p01 == 8 ? _orther.text : "",
                                        c02: p02,
                                        c03A: month,
                                        c03B: _year.text,
                                        c04: p03 == 1
                                            ? int.parse(_age.text)
                                            : tinh_tuoi()
                                    ));
                              }
                              else {
                                p01_04viewModel.P01_04Next(
                                    thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c00: _name.text,
                                        c01: p01,
                                        c02: p02,
                                        c03A: month,
                                        c03B: _year.text,
                                        c04: p03 == 1
                                            ? int.parse(_age.text)
                                            : tinh_tuoi()
                                    ));
                              }
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
            // Set the transparency here
            canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}