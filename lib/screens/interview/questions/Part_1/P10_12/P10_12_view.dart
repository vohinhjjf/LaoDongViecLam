import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import 'P10_12_viewmodel.dart';

class P10_12View extends StatefulWidget {
  const P10_12View({Key? key}) : super(key: key);

  @override
  State<P10_12View> createState() => _P10_12ViewState();
}

class _P10_12ViewState extends State<P10_12View> {
  late P10_12ViewModel p10_12ViewModel;
  final _name = "";
  final _orther = TextEditingController();
  int p10 = 0, p10A =0, p10B =0, p11 = 0, p12 =0, month = 0, quocgia = 0, hanhchinh = 0;
  List _hanhchinh = [], _quocgia = [];

  var _lydo = [
    "TÌM VIỆC/BẮT ĐẦU CÔNG VIỆC MỚI",
    "MẤT/HẾT VIỆC, KHÔNG TÌM ĐƯỢC VIỆC",
    "THEO GIA ĐÌNH CHUYỂN NHÀ",
    "KẾT HÔN",
    "ĐI HỌC",
    "KHÁC (GHI RÕ)"
  ];

  @override
  void initState() {
    super.initState();
    p10_12ViewModel = context.read();
    p10_12ViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //UIGPSButton()
        ],
        titleSpacing: 0,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p08
                UIText(
                  text: "P10. $_name chuyển đến đây từ tỉnh/thành phố/quốc gia nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p10 = 1;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "Ở VIỆT NAM",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 1,
                      groupValue: p10,
                      onChanged: (value){
                        setState(() {
                          p10 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Visibility(
                    visible: p10 == 1 ? true : false,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: hanhchinh,
                      items: _hanhchinh.map((e) =>
                          DropdownMenuItem(
                            value: 0,
                            child: Text("- - Chọn mã quốc gia - -"),
                          ),
                      ).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          hanhchinh = value!;
                        });
                      },
                      isExpanded: true,
                    ),
                ),
                const SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p10 = 2;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "NƯỚC NGOÀI",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    leading: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 2,
                      groupValue: p10,
                      onChanged: (value){
                        setState(() {
                          p10 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                Visibility(
                    visible: p10 == 2 ? true : false,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: quocgia,
                          items: _quocgia.map((e) =>
                              DropdownMenuItem(
                                value: 0,
                                child: Text("- - Chọn mã quốc gia - -"),
                              ),
                          ).toList(),
                          onChanged: (int? value) {
                            setState(() {
                              quocgia = value!;
                            });
                          },
                          isExpanded: true,
                        ),
                        const SizedBox(height: 10,),
                        //p11
                        UIText(
                          text: "P11. Nơi thực tế thường trú trước khi $_name chuyển đến"
                              "đây là phường, thị trấn hay xã?",
                          textColor: Colors.black,
                          textFontSize: fontGreater,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            setState(() {
                              p11 = 1;
                            });
                          },
                          child: ListTile(
                            title: const UIText(
                              text: "PHƯỜNG/THỊ TRẤN",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 1,
                              groupValue: p11,
                              onChanged: (value){
                                setState(() {
                                  p11 = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              p11 = 2;
                            });
                          },
                          child: ListTile(
                            title: const UIText(
                              text: "XÃ",
                              textColor: Colors.black,
                              textFontSize: fontLarge,
                              textAlign: TextAlign.start,
                            ),
                            leading: GFRadio(
                              type: GFRadioType.custom,
                              size: GFSize.LARGE,
                              activeBorderColor: Colors.black,
                              activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                              value: 2,
                              groupValue: p11,
                              onChanged: (value){
                                setState(() {
                                  p11 = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: Colors.indigo,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        //p12
                        UIText(
                          text: "P12. Lý do chính mà $_name chuyển đến nơi ở hiện tại là gì?",
                          textColor: Colors.black,
                          textFontSize: fontGreater,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 10,),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _lydo.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  p12 = index+1;
                                });
                              },
                              child: ListTile(
                                title: UIText(
                                  text: _lydo[index].toString(),
                                  textColor: Colors.black,
                                  textFontSize: fontLarge,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                                leading: GFRadio(
                                  type: GFRadioType.custom,
                                  size: GFSize.LARGE,
                                  activeBorderColor: Colors.black,
                                  activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                                  value: index+1,
                                  groupValue: p12,
                                  onChanged: (value) {
                                    setState(() {
                                      p12 = value;
                                      print(p12);
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: Colors.indigo,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10,),
                        Visibility(
                          visible: p12 == 6 ? true : false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIText(
                                  text: "Lý do khác",
                                  textColor: Colors.black,
                                  textFontSize: fontMedium,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  autofocus: true,
                                  controller: _orther,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Vui lòng nhập tên';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                                  ),
                                )
                              ],
                            ),
                        )
                      ],
                    )
                )
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
                          p10_12ViewModel.P10_12Back();
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
                          p10_12ViewModel.P10_12Next();
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
    );
  }
}