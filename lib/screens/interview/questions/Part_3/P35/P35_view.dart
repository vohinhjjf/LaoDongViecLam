import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P35_viewmodel.dart';

class P35View extends StatefulWidget {
  const P35View({Key? key}) : super(key: key);

  @override
  State<P35View> createState() => _P35ViewState();
}

class _P35ViewState extends State<P35View> {
  late P35ViewModel p35ViewModel;
  final _formKey = GlobalKey<FormState>();
  final _orther = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p35 =0;

  var _lydo = [
    "QUÁ GIÀ/QUÁ TRẺ",
    "MẤT KHẢ NĂNG LAO ĐỘNG",
    "NỘI TRỢ",
    "BẬN HỌC (SV/HS/HỌC VIỆC)",
    "KHÔNG MUỐN/KHÔNG CẦN ĐI LÀM",
    "TIN LÀ KHÔNG CÓ VIỆC/KHÔNG CÓ VIỆC THÍCH HỢP",
    "KHÔNG BIẾT TÌM Ở ĐÂU/BẰNG CÁCH NÀO",
    "TẠM NGHỈ DO THU HẸP/NGỪNG SẢN XUẤT",
    "ĐỢI VIỆC/ĐỢI KHAI TRƯƠNG HĐKD",
    "THỜI TIẾT XẤU/THIÊN TAI",
    "NGHỈ THỜI VỤ",
    "THỜI TIẾT XẤU/THIÊN TAI",
    "DO DỊCH BỆNH",
    "BẬN VIỆC GIA ĐÌNH/ĐANG NGHỈ NGƠI",
    "LÀM NÔNG NGHIỆP",
    "ỐM/ĐAU TẠM THỜI",
    "KHÁC (GHI CỤ THẾ)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p35ViewModel = context.read();
      p35ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p35ViewModel.thanhvien;
              p35 = p35ViewModel.thanhvien.c31 ?? 0;
              _orther.text = p35ViewModel.thanhvien.c31K.toString();
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
                  //p35
                  UIRichText(
                    text1: "P35. Lý do chính mà ",
                    text2: thanhvien.c00 ?? "",
                    text3: " không tìm việc trong 30 ngày qua là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _lydo.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: UIText(
                          text: _lydo[index].toString(),
                          textColor: Colors.black,
                          textFontSize: fontLarge,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        leading: RoundCheckBox(
                          isChecked: p35 == index+1 ? true : false,
                          onTap: (selected) {
                            setState(() {
                              p35 = p35 == index+1 ? 0 : index+1;
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
                            p35 = p35 == index+1 ? 0 : index+1;
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                    visible: p35 == 16 ? true : false,
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
                        TextFormField(
                          autofocus: true,
                          controller: _orther,
                          validator: (value){
                            if(p35 == 16 && value!.isEmpty){
                              return 'Vui lòng nhập lý do';
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
                          p35ViewModel.P35Back();
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
                            if (p35 == 0) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'P35 - Lý do không tìm việc nhập vào chưa đúng!',)
                              );
                            }
                            else if (p35 == 9 && thanhvien.c30 == 2) {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                  const UIWarningDialog(
                                    waring: 'P35 - Lý do không tìm việc là đợi việc/đợi khai trương HĐKD mà C32 = 2!',)
                              );
                            }
                            else {
                              p35ViewModel.P35Next(thongTinThanhVienModel(
                                idho: thanhvien.idho,
                                idtv: thanhvien.idtv,
                                c31: p35,
                                c31K: _orther.text,
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