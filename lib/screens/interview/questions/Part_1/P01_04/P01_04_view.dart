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
  String month = 'Chọn tháng', name = "";
  bool check = false, check_draw = true;
  List<thongTinThanhVienModel> list_tttv = [];

  var _quanhe = [
    "VỢ/CHỒNG",
    "CON ĐẺ",
    "CHÁU NỘI/NGOẠI",
    "BỐ/MẸ",
    "QUAN HỆ GIA ĐÌNH KHÁC",
    "NGƯỜI GIÚP VIỆC",
    "KHÁC (GHI RÕ)"
  ];

  int tinh_tuoi() {
    var tuoi = 0;
    if(int.parse(_year.text) == 9998){
      tuoi = int.parse(_age.text);
    } else {
      if (int.parse(month) >= 1 && int.parse(month) < ThangDT) {
        tuoi = (DateTime
            .now()
            .year - int.parse(_year.text));
      }
      else if (int.parse(month) >= ThangDT && int.parse(month) < 13) {
        tuoi = (DateTime
            .now()
            .year - int.parse(_year.text) - 1);
      }
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
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list_tttv = p01_04viewModel.list_tttv;
              thanhvien = p01_04viewModel.thanhvien;
              _name.text = p01_04viewModel.thanhvien.c00 ?? "";
              name = _name.text;
              p01 = p01_04viewModel.thanhvien.c01 ?? 0;
              p02 = p01_04viewModel.thanhvien.c02 ?? 0;
              month = p01_04viewModel.thanhvien.c03A ?? "Chọn tháng";
              _year.text = p01_04viewModel.thanhvien.c03B ?? "";
              _age.text = p01_04viewModel.thanhvien.c04 == null ? ""
                  : p01_04viewModel.thanhvien.c04.toString();
              p03 = p01_04viewModel.thanhvien.c03B == "9998" ? 1 : 0;
              ThangDT = p01_04viewModel.thanhvien.thangDT ?? 0;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UIGPSButton(), UIEXITButton()],
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p00
                  const UIText(
                    text: "P00. HỌ VÀ TÊN",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UITextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tên chưa được nhập';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        //_name.value = TextEditingValue(text: value);
                        name = value;
                      });
                    },
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                      FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                    ],
                    keyboardType: TextInputType.text,
                    hint: "Nhập họ và tên",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //p01
                  Visibility(
                      visible: thanhvien.c01 == 1 ? false : true,
                      child: Column(
                        children: [
                          UIText(
                            text:
                                "P01. ${_name.text} có mối quan hệ như thế nào với chủ hộ?",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                            isBold: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _quanhe.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: UIText(
                                  text: _quanhe[index].toString(),
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                                leading: RoundCheckBox(
                                  isChecked: p01 == index + 2 ? true : false,
                                  onTap: (selected) {
                                    setState(() {
                                      p01 = p01 == index + 2 ? 0 : index + 2;
                                    });
                                  },
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  checkedColor: Colors.white,
                                  checkedWidget: const Icon(Icons.check,
                                      size: 30, color: GFColors.PRIMARY),
                                  uncheckedColor: Colors.white,
                                  uncheckedWidget: Container(),
                                ),
                                onTap: () {
                                  setState(() {
                                    p01 = p01 == index + 2 ? 0 : index + 2;
                                  });
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: p01 == 8,
                            child:
                            UITextFormField(
                              controller: _orther,
                              validator: (value) {
                                if (p01 == 8 && value!.isEmpty) {
                                  return 'Quan hệ khác chưa được nhập';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(
                                    '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                                FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                              ],
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  //p02
                  UIRichText(
                      text1: "P02. ",
                      text2: name,
                      text3: " là nam hay nữ?",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: const UIText(
                      text: "NAM",
                      textColor: Colors.black,
                      textFontSize: fontMedium,
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
                      checkedWidget: const Icon(Icons.check,
                          size: 30, color: GFColors.PRIMARY),
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
                      textFontSize: fontMedium,
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
                      checkedWidget: const Icon(Icons.check,
                          size: 30, color: GFColors.PRIMARY),
                      uncheckedColor: Colors.white,
                      uncheckedWidget: Container(),
                    ),
                    onTap: () {
                      setState(() {
                        p02 = p02 == 2 ? 0 : 2;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //p03
                  UIRichText(
                    text1: "P03. ",
                    text2: name,
                    text3: " sinh vào tháng, năm dương lịch nào?",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: UIText(
                          text: "Tháng",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: DropdownButtonFormField(
                          style: const TextStyle(
                              color: Colors.black, fontSize: fontMedium),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: month,
                          items: const [
                            //add items in the dropdown
                            DropdownMenuItem(
                              value: 'Chọn tháng',
                              child: Text("Chọn tháng"),
                            ),
                            DropdownMenuItem(
                              value: "01",
                              child: Text("Tháng 1"),
                            ),
                            DropdownMenuItem(
                                value: "02",
                                child: Text("Tháng 2")),
                            DropdownMenuItem(
                              value: "03",
                              child: Text("Tháng 3"),
                            ),
                            DropdownMenuItem(
                              value: "04",
                              child: Text("Tháng 4"),
                            ),
                            DropdownMenuItem(
                              value: "05",
                              child: Text("Tháng 5"),
                            ),
                            DropdownMenuItem(
                              value: "06",
                              child: Text("Tháng 6"),
                            ),
                            DropdownMenuItem(
                              value: "07",
                              child: Text("Tháng 7"),
                            ),
                            DropdownMenuItem(
                              value: "08",
                              child: Text("Tháng 8"),
                            ),
                            DropdownMenuItem(
                              value: "09",
                              child: Text("Tháng 9"),
                            ),
                            DropdownMenuItem(
                              value: "10",
                              child: Text("Tháng 10"),
                            ),
                            DropdownMenuItem(
                              value: "11",
                              child: Text("Tháng 11"),
                            ),
                            DropdownMenuItem(
                              value: "12",
                              child: Text("Tháng 12"),
                            ),
                            DropdownMenuItem(
                              value: "98",
                              child: Text("98"),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: UIText(
                          text: "Năm",
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: UITextFormField(
                          controller: _year,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Năm sinh chưa được nhập';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          maxLength: 4,
                          readOnly: check,
                          keyboardType: TextInputType.datetime,
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
                      checkedWidget: const Icon(Icons.check,
                          size: 30, color: GFColors.PRIMARY),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                      visible: p03 == 0 ? false : true,
                      child: Column(
                        children: [
                          UIRichText(
                            text1: "P04. Hiện nay, ",
                            text2: name,
                            text3: " bao nhiêu tuổi tròn theo dương lịch?",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          UITextFormField(
                            controller: _age,
                            validator: (value) {
                              if (p03 != 0 && value!.isEmpty) {
                                return 'Số tuổi chưa được nhập';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            maxLength: 3,
                            keyboardType: TextInputType.datetime,
                          ),
                        ],
                      )),
                  //Button
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIBackButton(ontap: () {
                        p01_04viewModel.P01_04Back(thanhvien.c01!);
                      }),
                      UINextButton(ontap: () {
                        int namHT = DateTime.now().year;
                        print(list_tttv.length);
                        var thongtinCH = list_tttv.firstWhere((e) => e.c01 == 1, orElse: () => thongTinThanhVienModel());
                        if (_formKey.currentState!.validate()) {
                          if (p01 == 0) {
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(
                                      waring:
                                          'Mối quan hệ với chủ hộ nhập vào chưa đúng!',
                                    ));
                          } else if (p02 == 0) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'Giới tính nhập vào chưa đúng!',)
                            );
                          }
                          else if (p01 == 2 && p02 == thongtinCH.c02) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                UIWarningDialog(
                                  waring: 'Thành viên ${_name.text} có mối quan hệ Vợ/Chồng với chủ hộ mà có giới tính trùng giới tính chủ hộ. Kiểm tra lại!',)
                            );
                          }
                          else if (month == "Chọn tháng") {
                            showDialog(
                                context: context,
                                builder: (_) => const UIWarningDialog(
                                      waring: 'Tháng nhập vào chưa đúng',
                                    ));
                          } else if (p01 == 8 && _orther.text == "") {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'Mối quan hệ khác nhập vào chưa đúng!',)
                            );
                          }
                          else if ((int.parse(_year.text) > namHT || int.parse(_year.text) < 1902) && int.parse(_year.text) != 9998) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'Năm sinh nhập vào chưa đúng!',)
                            );
                          }
                          else if (int.parse(_year.text) == namHT && int.parse(month) >= ThangDT && month != '98') {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                const UIWarningDialog(
                                  waring: 'Tháng sinh hoặc năm sinh nhập vào chưa đúng!',)
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
                          else if (tinh_tuoi() < 0 || tinh_tuoi() > 150) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Thành viên ${_name
                                      .text} có tuổi = ${tinh_tuoi()}. Kiểm tra lại!',)
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
                          else if (p01 == 3 && ((tinh_tuoi() >= thongtinCH.c04!) || (thongtinCH.c04! - tinh_tuoi() < 8))) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Thành viên là con đẻ của chủ hộ sinh '
                                      '$month/${DateTime.now().year - tinh_tuoi()} mà chủ hộ '
                                      '${_name.text} sinh ${thongtinCH.c03A}/'
                                      '${DateTime.now().year - thongtinCH.c04!}?',)
                            );
                          }
                          else if (p01 == 5 && tinh_tuoi() < thongtinCH.c04!) {
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Chủ hộ ${thongtinCH.c00} có tuổi '
                                      '${thongtinCH.c04!} tuổi > tuổi của bố/mẹ '
                                      '${tinh_tuoi()} tuổi. Kiểm tra lại!',)
                            );
                          }
                          else if (p01 == 2 && tinh_tuoi() < 7){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(
                                  waring: 'Vợ/chồng chủ hộ có tuổi = ${tinh_tuoi()} nhỏ hơn 7 tuổi!',
                                )
                            );
                          }
                          //Notifi
                          else if (int.parse(_year.text) == 9998){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Năm sinh của thành viên không xác định có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (p01 == 1 && tinh_tuoi() <= 15){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Tuổi của chủ hộ <= 15 tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 2 && (thongtinCH.c04! - tinh_tuoi() > 25)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Chủ hộ ${thongtinCH.c00} có tuổi = ${thongtinCH.c04} - tuổi vợ/chồng chủ hộ = ${tinh_tuoi()} > 25. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (p01 == 2 && tinh_tuoi() < 15){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Vợ/chồng chủ hộ có tuổi = ${tinh_tuoi()} nhỏ hơn 15 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        Navigator.of(context).pop();
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
                                                      },
                                                    )
                                                );
                                              }
                                              else if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 2 && (tinh_tuoi() - thongtinCH.c04! > 25)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Vợ/chồng chủ hộ ${thongtinCH.c00} có tuổi = ${tinh_tuoi()} - tuổi chủ hộ = ${thongtinCH.c04} > 25. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 2 && tinh_tuoi() < 15){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Vợ/chồng chủ hộ có tuổi = ${tinh_tuoi()} nhỏ hơn 15 tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 3 && ((thongtinCH.c04! - tinh_tuoi() < 13) || (thongtinCH.c04! - tinh_tuoi() > 60))){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: ' Chủ hộ ${thongtinCH.c00} = ${thongtinCH.c04} tuổi mà tuổi của con đẻ chủ hộ = ${tinh_tuoi()} tuổi, chênh nhau ${thongtinCH.c04! - tinh_tuoi()} tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                if (p01 == 8) {
                                                  p01_04viewModel.P01_04Next(
                                                      thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c00: _name.text,
                                                          c01: p01,
                                                          c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 4 && (thongtinCH.c04! - tinh_tuoi() < 30)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${_name.text} là cháu nội/ngoại của chủ hộ mà chủ hộ ${thongtinCH.c04} tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 5 && thongtinCH.c04! > tinh_tuoi()){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Chủ hộ ${thongtinCH.c00} có tuổi ${thongtinCH.c04} tuổi > tuổi của ${p02 == 1 ? "bố" : "mẹ"} ${tinh_tuoi()} tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                if (p01 == 8) {
                                                  p01_04viewModel.P01_04Next(
                                                      thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c00: _name.text,
                                                          c01: p01,
                                                          c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 5 && p02 == 2 && (tinh_tuoi() - thongtinCH.c04! >= 50)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${_name.text} là mẹ của chủ hộ có tuổi là ${tinh_tuoi()} tuổi không phù hợp với tuổi của chủ hộ là ${thongtinCH.c04} tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                if (p01 == 8) {
                                                  p01_04viewModel.P01_04Next(
                                                      thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c00: _name.text,
                                                          c01: p01,
                                                          c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 5 && p02 == 1 && (tinh_tuoi() - thongtinCH.c04! >= 60)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${_name.text} là bố của chủ hộ có tuổi là ${tinh_tuoi()} tuổi không phù hợp với tuổi của chủ hộ là ${thongtinCH.c04} tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                if (p01 == 8) {
                                                  p01_04viewModel.P01_04Next(
                                                      thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c00: _name.text,
                                                          c01: p01,
                                                          c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (p01 == 5 && (tinh_tuoi() - thongtinCH.c04! < 13)){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${p02 == 1 ? "Bố" : "Mẹ"} của chủ'
                                                ' hộ ${thongtinCH.c00} có tuổi ${tinh_tuoi()} '
                                                '- tuổi chủ hộ = ${thongtinCH.c04} nhỏ hơn 13 tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
                                              if (tinh_tuoi() > 120){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                                      onpress: () {
                                                        if (p01 == 8) {
                                                          p01_04viewModel.P01_04Next(
                                                              thongTinThanhVienModel(
                                                                  idho: thanhvien.idho,
                                                                  idtv: thanhvien.idtv,
                                                                  c00: _name.text,
                                                                  c01: p01,
                                                                  c01K: _orther.text,
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
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                if (p01 == 8) {
                                                  p01_04viewModel.P01_04Next(
                                                      thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c00: _name.text,
                                                          c01: p01,
                                                          c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 1 && tinh_tuoi() <= 15){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Tuổi của chủ hộ <= 15 tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 2 && (thongtinCH.c04! - tinh_tuoi() > 25)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Chủ hộ ${thongtinCH.c00} có tuổi = ${thongtinCH.c04} - tuổi vợ/chồng chủ hộ = ${tinh_tuoi()} > 25. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (p01 == 2 && tinh_tuoi() < 15){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Vợ/chồng chủ hộ có tuổi = ${tinh_tuoi()} nhỏ hơn 15 tuổi. Có đúng không?',
                                            onpress: () {
                                              Navigator.of(context).pop();
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
                                            },
                                          )
                                      );
                                    }
                                    else if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 2 && (tinh_tuoi() - thongtinCH.c04! > 25)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Vợ/chồng chủ hộ ${thongtinCH.c00} có tuổi = ${tinh_tuoi()} - tuổi chủ hộ = ${thongtinCH.c04} > 25. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 2 && tinh_tuoi() < 15){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Vợ/chồng chủ hộ có tuổi = ${tinh_tuoi()} nhỏ hơn 15 tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 3 && ((thongtinCH.c04! - tinh_tuoi() < 13) || (thongtinCH.c04! - tinh_tuoi() > 60))){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: ' Chủ hộ ${thongtinCH.c00} = ${thongtinCH.c04} tuổi mà tuổi của con đẻ chủ hộ = ${tinh_tuoi()} tuổi, chênh nhau ${thongtinCH.c04! - tinh_tuoi()} tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 4 && (thongtinCH.c04! - tinh_tuoi() < 30)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${_name.text} là cháu nội/ngoại của chủ hộ mà chủ hộ ${thongtinCH.c04} tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (p01 == 8) {
                                      p01_04viewModel.P01_04Next(
                                          thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c00: _name.text,
                                              c01: p01,
                                              c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 5 && thongtinCH.c04! > tinh_tuoi()){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Chủ hộ ${thongtinCH.c00} có tuổi ${thongtinCH.c04} tuổi > tuổi của ${p02 == 1 ? "bố" : "mẹ"} ${tinh_tuoi()} tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 5 && p02 == 2 && (tinh_tuoi() - thongtinCH.c04! >= 50)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${_name.text} là mẹ của chủ hộ có tuổi là ${tinh_tuoi()} tuổi không phù hợp với tuổi của chủ hộ là ${thongtinCH.c04} tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 5 && p02 == 1 && (tinh_tuoi() - thongtinCH.c04! >= 60)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${_name.text} là bố của chủ hộ có tuổi là ${tinh_tuoi()} tuổi không phù hợp với tuổi của chủ hộ là ${thongtinCH.c04} tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (p01 == 5 && (tinh_tuoi() - thongtinCH.c04! < 13)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${p02 == 1 ? "Bố" : "Mẹ"} của chủ'
                                      ' hộ ${thongtinCH.c00} có tuổi ${tinh_tuoi()} '
                                      '- tuổi chủ hộ = ${thongtinCH.c04} nhỏ hơn 13 tuổi. Có đúng không?',
                                  onpress: () {
                                    Navigator.of(context).pop();
                                    if (tinh_tuoi() > 120){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                            onpress: () {
                                              if (p01 == 8) {
                                                p01_04viewModel.P01_04Next(
                                                    thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c00: _name.text,
                                                        c01: p01,
                                                        c01K: _orther.text,
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
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      if (p01 == 8) {
                                        p01_04viewModel.P01_04Next(
                                            thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c00: _name.text,
                                                c01: p01,
                                                c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else if (tinh_tuoi() > 120){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thành viên ${thanhvien.c00} có tuổi = ${tinh_tuoi()} > 120 tuổi. Có đúng không?',
                                  onpress: () {
                                    if (p01 == 8) {
                                      p01_04viewModel.P01_04Next(
                                          thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c00: _name.text,
                                              c01: p01,
                                              c01K: _orther.text,
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
                                  },
                                )
                            );
                          }
                          else {
                            if (p01 == 8) {
                              p01_04viewModel.P01_04Next(
                                  thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c00: _name.text,
                                      c01: p01,
                                      c01K: _orther.text,
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
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors
                .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(
                  onTap: () {
                    setState(() {
                      check_draw = false;
                    });
                  },
                )
              : const DrawerNavigation()),
      drawerScrimColor: Colors.transparent,
    );
  }
}
