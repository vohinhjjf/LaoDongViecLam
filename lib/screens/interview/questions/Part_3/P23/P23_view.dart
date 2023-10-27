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
              _orther.text = p23ViewModel.thanhvien.c21K.toString();
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
                          p23ViewModel.P23Back();
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
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}