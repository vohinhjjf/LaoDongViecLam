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
import 'P10_12_viewmodel.dart';

class P10_12View extends StatefulWidget {
  const P10_12View({Key? key}) : super(key: key);

  @override
  State<P10_12View> createState() => _P10_12ViewState();
}

class _P10_12ViewState extends State<P10_12View> {
  late P10_12ViewModel p10_12ViewModel;
  var thanhvien = thongTinThanhVienModel();
  final _other = TextEditingController();
  List _hanhchinh = [];
  int p10 = 0, p11 = 0, p12 =0;
  bool check_draw = true;
  String hanhchinh = "00", quocgia = "Chọ";
  final  _quocgia = [
    "Chọn mã quốc gia",
    "KHM - Vương quốc Campuchia",
    "IDN - Cộng hòa Indonesia",
    "LAO - Cộng hòa Dân chủ Nhân dân Lào",
    "MYS - Malaysia",
    "MMR - Liên bang Mianma",
    "PHL - Cộng hòa Philippin",
    "SGP - Cộng hòa Singapo",
    "THA - Thái Lan",
    "DZA - Các nước Trung Đông",
    "CHN - Cộng hòa Nhân dân Trung Hoa",
    "HKG - Hồng Kông",
    "IND - Cộng hòa Ấn Độ",
    "JPN - Nhật Bản",
    "KOR - Hàn Quốc",
    "TWN - Đài Loan",
    "BGR - Các nước Đông Âu",
    "SWE - Các nước Bắc Âu",
    "USA - Hợp chủng quốc Hoa Kỳ",
    "CAN - Canada",
    "AUS - Australia",
    "AFG - Các nước khác",
  ];

  final _lydo = [
    "TÌM VIỆC/BẮT ĐẦU CÔNG VIỆC MỚI",
    "MẤT/HẾT VIỆC, KHÔNG TÌM ĐƯỢC VIỆC",
    "THEO GIA ĐÌNH CHUYỂN NHÀ",
    "DO DỊCH BỆNH",
    "KẾT HÔN",
    "ĐI HỌC",
    "KHÁC (GHI RÕ)"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p10_12ViewModel = context.read();
      p10_12ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p10_12ViewModel.thanhvien;
              _hanhchinh = p10_12ViewModel.list_tinh;
              p10 = p10_12ViewModel.thanhvien.c09 ?? 0;
              p11 = p10_12ViewModel.thanhvien.c10 ?? 0;
              p12 = p10_12ViewModel.thanhvien.c10M ?? 0;
              _other.text = p10_12ViewModel.thanhvien.c10_MK ?? "";
              hanhchinh = (p10_12ViewModel.thanhvien.c09A == null || p10_12ViewModel.thanhvien.c09A == '')
                  ? "00" : p10_12ViewModel.thanhvien.c09A!;
              quocgia = (p10_12ViewModel.thanhvien.c09B == null || p10_12ViewModel.thanhvien.c09B == '')
                  ? "Chọ" : p10_12ViewModel.thanhvien.c09B!;
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
                //p10
                UIRichText(
                  text1: "P10. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " chuyển đến đây từ tỉnh/thành phố/quốc gia nào?",
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
                    isChecked: p10 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p10 = p10 == 1 ? 0 : 1;
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
                      p10 = p10 == 1 ? 0 : 1;
                    });
                  },
                ),
                // const SizedBox(height: 5,),
                Visibility(
                    visible: p10 == 1 ? true : false,
                    child: DropdownButtonFormField(
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
                      dropdownColor: Colors.white,
                      value: hanhchinh,
                      items: _hanhchinh.map((e) =>
                          DropdownMenuItem(
                            value: e["Ma"].toString(),
                            child: Text("${e["Ma"]} - ${e["Ten"]}"),
                          ),
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          hanhchinh = value!;
                        });
                      },
                      isExpanded: true,
                    ),
                ),
                // const SizedBox(height: 5,),
                ListTile(
                  title: const UIText(
                    text: "NƯỚC NGOÀI",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p10 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p10 = p10 == 2 ? 0 : 2;
                        p11 = 0;
                        p12 = 0;
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
                      p10 = p10 == 2 ? 0 : 2;
                      p11 = 0;
                      p12 = 0;
                    });
                  },
                ),
                Visibility(
                    visible: p10 == 2 ? true : false,
                    child: Column(
                      children: [
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
                          dropdownColor: Colors.white,
                          value: quocgia,
                          items: _quocgia.map((e) =>
                               DropdownMenuItem(
                                value: e.substring(0,3),
                                child: Text(e),
                              ),
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              quocgia = value!;
                            });
                          },
                          isExpanded: true,
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 15,),
                Visibility(
                    visible: p10 == 1 ? true : false,
                    child: Column(
                      children: [
                        //p11
                        UIRichText(
                          text1: "P11. Nơi thực tế thường trú trước khi ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " chuyển đến đây là phường, thị trấn hay xã?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListTile(
                          title: const UIText(
                            text: "PHƯỜNG/THỊ TRẤN",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p11 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p11 = p11 == 1 ? 0 : 1;
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
                              p11 = p11 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        ListTile(
                          title: const UIText(
                            text: "XÃ",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p11 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p11 = p11 == 2 ? 0 : 2;
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
                              p11 = p11 == 2 ? 0 : 2;
                            });
                          },
                        ),
                        const SizedBox(height: 15,),
                        //p12
                        UIRichText(
                          text1: "P12. Lý do chính mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " chuyển đến nơi ở hiện tại là gì?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _lydo.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: UIText(
                                text: _lydo[index].toString(),
                                textColor: Colors.black,
                                textFontSize: fontMedium,
                                textAlign: TextAlign.start,
                                isBold: false,
                              ),
                              leading: RoundCheckBox(
                                isChecked: p12 == index+1 ? true : false,
                                onTap: (selected) {
                                  setState(() {
                                    p12 = p12 == index+1 ? 0 : index+1;
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
                                  p12 = p12 == index+1 ? 0 : index+1;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 10,),
                        Visibility(
                          visible: p12 == 7 ? true : false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const UIText(
                                text: "Lý do khác",
                                textColor: Colors.black,
                                textFontSize: fontMedium,
                                textAlign: TextAlign.start,
                                isBold: false,
                              ),
                              const SizedBox(height: 5,),
                              UITextFormField(
                                controller: _other,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(
                                      '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                                  FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                                ],
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Lý do chưa được nhập';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
                //Button
                const SizedBox(height: 90,),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UIBackButton(ontap: (){
              p10_12ViewModel.P10_12Back();
            }),
            UINextButton(ontap: (){
              if(p10 == 0){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P10-Nơi trước khi chuyển đến nhập vào chưa đúng!',)
                );
              }
              else if(p10 == 1 && hanhchinh == "00"){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P10A-Mã tỉnh nhập vào chưa đúng!',)
                );
              }
              else if(p10 == 2 && quocgia == "Chọ"){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'P10B-Mã quốc gia nhập vào chưa đúng!',)
                );
              }
              else if(p11 == 0 && p10 == 1){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'C10 = 1 đang ở Việt Nam mà C11 chưa được chọn!',)
                );
              } else if(p12 == 0 && p10 == 1){
                showDialog(
                    context: context,
                    builder: (_) => const UIWarningDialog(waring: 'C10 = 1 đang ở Việt Nam mà C12 chưa được chọn!',)
                );
              }
              else if((p12 == 1 || p12 == 3) && thanhvien.c08 == 4){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: 'Thành '
                          'viên ${thanhvien.c00} có thường trú từ 12 tháng đến 5 năm'
                          ' mà lý do chuyển đến là tìm ${_lydo[p12-1]}. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p10 == 1) {
                          p10_12ViewModel.P10_12Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c09: p10,
                              c09A: hanhchinh,
                              c10: p11,
                              c10M: p12,
                              c10_MK: p12 == 7 ? _other.text : ''
                          ));
                        } else {
                          p10_12ViewModel.P10_12Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c09: p10,
                            c09B: quocgia,
                          ));
                        }
                      },
                    )
                );
              }
              else {
                if(p10 == 1) {
                  p10_12ViewModel.P10_12Next(thongTinThanhVienModel(
                      idho: thanhvien.idho,
                      idtv: thanhvien.idtv,
                      c09: p10,
                      c09A: hanhchinh,
                      c09B: '',
                      c10: p11,
                      c10M: p12,
                      c10_MK: p12 == 7 ? _other.text : ''
                  ));
                } else {
                  p10_12ViewModel.P10_12Next(thongTinThanhVienModel(
                      idho: thanhvien.idho,
                      idtv: thanhvien.idtv,
                      c09: p10,
                      c09B: quocgia,
                      c09A: '',
                      c10_MK: ''
                  ));
                }
              }
            }),
          ],
        ),
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