import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import 'P01_04_viewmodel.dart';

class P01_04View extends StatefulWidget {
  const P01_04View({Key? key}) : super(key: key);

  @override
  State<P01_04View> createState() => _P01_04ViewState();
}

class _P01_04ViewState extends State<P01_04View> {
  late P01_04ViewModel p01_04viewModel;
  final _name = TextEditingController();
  final _year = TextEditingController();
  final _age = TextEditingController();
  int p01 = 0, p02 = 0, p03 = 0, month = 0;

  var _quanhe = [
    "CHỦ HỘ",
    "VỢ/CHỒNG",
    "CON ĐẺ",
    "CHÁU NỘI/NGOẠI",
    "BỐ/MẸ",
    "QUAN HỆ GIA ĐÌNH KHÁC",
    "NGƯỜI GIÚP VIỆC",
    "KHÁC (GHI RÕ)"
  ];

  @override
  void initState() {
    super.initState();
    p01_04viewModel = context.read();
    p01_04viewModel.onInit(context);
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
                //p00
                const UIText(
                  text: "P00. HỌ VÀ TÊN",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
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
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                  ),
                ),
                const SizedBox(height: 10,),
                //p01
                UIText(
                  text: "P01. ${_name.text} có mối quan hệ nào với chủ hộ?",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _quanhe.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          p01 = index+1;
                        });
                      },
                      child: ListTile(
                        title: UIText(
                          text: _quanhe[index].toString(),
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
                          groupValue: p01,
                          onChanged: (value) {
                            setState(() {
                              p01 = value;
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
                //p02
                UIText(
                  text: "P02. ${_name.text} là nam hay nữ?",
                  textColor: Colors.black,
                  textFontSize: fontGreater,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                const SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    setState(() {
                      p02 = 1;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "NỮ",
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
                      groupValue: p02,
                      onChanged: (value) {
                        setState(() {
                          p02 = value;
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
                      p02 = 2;
                    });
                  },
                  child: ListTile(
                    title: const UIText(
                      text: "NAM",
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
                      groupValue: p02,
                      onChanged: (value) {
                        setState(() {
                          p02 = value;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
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
                        child: UIText(
                          text: "Tháng",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                    ),
                    Flexible(
                      flex: 1,
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
                          items: const [ //add items in the dropdown
                            DropdownMenuItem(
                              value: 0,
                              child: Text("--Chọn tháng--"),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text("Tháng 1"),
                            ),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("Tháng 2")
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child:  Text("Tháng 3"),
                            ),
                            DropdownMenuItem(
                              value: 4,
                              child:  Text("Tháng 4"),
                            ),
                            DropdownMenuItem(
                              value: 5,
                              child:  Text("Tháng 5"),
                            ),
                            DropdownMenuItem(
                              value: 6,
                              child:  Text("Tháng 6"),
                            ),
                            DropdownMenuItem(
                              value: 7,
                              child:  Text("Tháng 7"),
                            ),
                            DropdownMenuItem(
                              value: 8,
                              child:  Text("Tháng 8"),
                            ),
                            DropdownMenuItem(
                              value: 9,
                              child:  Text("Tháng 9"),
                            ),
                            DropdownMenuItem(
                              value: 10,
                              child:  Text("Tháng 10"),
                            ),
                            DropdownMenuItem(
                              value: 11,
                              child:  Text("Tháng 11"),
                            ),
                            DropdownMenuItem(
                              value: 12,
                              child: Text("Tháng 12"),
                            ),
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              month = value!;
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
                      child: UIText(
                        text: "Năm",
                        textColor: Colors.black,
                        textFontSize:fontLarge,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        controller: _year,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      p03 = p03 == 0 ? 1 : 0;
                    });
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const UIText(
                      text: "Không xác định năm",
                      textColor: Colors.black,
                      textFontSize: fontLarge,
                      textAlign: TextAlign.start,
                    ),
                    trailing: GFRadio(
                      type: GFRadioType.custom,
                      size: GFSize.LARGE,
                      activeBorderColor: Colors.black,
                      activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                      value: 1,
                      groupValue: p03,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          p03 = p03 == 1 ? 0 : 1;
                        });
                      },
                      inactiveIcon: null,
                      radioColor: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
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
                          keyboardType: TextInputType.datetime,
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
                          p01_04viewModel.P01_04Back();
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
                          p01_04viewModel.P01_04Next();
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