import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P23_viewmodel.dart';

class P23View extends StatefulWidget {
  const P23View({Key? key}) : super(key: key);

  @override
  State<P23View> createState() => _P23ViewState();
}

class _P23ViewState extends State<P23View> {
  late P23ViewModel p23ViewModel;
  final _orther = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p23 =0;
  bool check_draw = true;

  var _lydo = [
    "CHỜ BẮT ĐẦU CÔNG VIỆC HOẶC HOẠT ĐỘNG KINH DOANH MỚI",
    "LÀM THEO CA/KÍP, THỜI GIAN LINH HOẠT/ DO TÍNH CHẤT CÔNG VIỆC",
    "CÔNG VIỆC THEO MÙA/VỤ",
    "NGHỈ HÈ/NGHỈ LỄ/ĐI DU LỊCH",
    "ỐM ĐAU/TAI NẠN",
    "NGHỈ THAI SẢN",
    "ĐI HỌC/ĐÀO TẠO",
    "BẬN VIỆC RIÊNG",
    "NGHỈ GIÃN VIỆC/TẠM NGỪNG SẢN XUẤT/GIẢM KHÁCH HÀNG",
    "THỜI TIẾT XẤU/THIÊN TAI",
    "DO DỊCH BỆNH",
    "ĐÌNH CÔNG/BIỂU TÌNH",
    "KHUYẾT TẬT/ ỐM ĐAU LÂU DÀI",
    "KHÁC (GHI CỤ THẾ)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p23ViewModel = context.read();
      p23ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p23ViewModel.thanhvien;
              p23 = p23ViewModel.thanhvien.c21 ?? 0;
              _orther.text = p23ViewModel.thanhvien.c21K ?? "";
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p23
                UIRichText(
                  text1: "P23. Lý do chính ",
                  text2: thanhvien.c00 ?? "",
                  text3: " tạm nghỉ việc trong 7 ngày qua?",
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
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p23 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p23 = p23 == index+1 ? 0 : index+1;
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
                          p23 = p23 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: p23 == 14 ? true : false,
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
                          if(value!.isEmpty){
                            return 'Vui lòng nhập lý do';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                          FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                        ],
                        keyboardType: TextInputType.text,
                        style: const TextStyle( color: Colors.black),
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        ),
                      )
                    ],
                  ),
                ),
                //Button
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p23ViewModel.P23Back();
                    }),
                    UINextButton(ontap: (){
                      if(p23 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(waring: 'P23 - Lý do tạm nghỉ việc bị bỏ trống!',)
                        );
                      }
                      else if(thanhvien.c02 == 1 && p23 == 6){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} là nam mà lý do tạm nghỉ là nghỉ thai sản!',)
                        );
                      }
                      else {
                        p23ViewModel.P23Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c21: p23,
                          c21K: _orther.text,
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