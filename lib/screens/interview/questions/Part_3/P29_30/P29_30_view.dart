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
import 'P29_30_viewmodel.dart';

class P29_30View extends StatefulWidget {
  const P29_30View({Key? key}) : super(key: key);

  @override
  State<P29_30View> createState() => _P29_30ViewState();
}

class _P29_30ViewState extends State<P29_30View> {
  late P29_30ViewModel p29_30ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p29 =0, p30 =0;
  bool check_draw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p29_30ViewModel = context.read();
      p29_30ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p29_30ViewModel.thanhvien;
              p29 = p29_30ViewModel.thanhvien.c27 ?? 0;
              p30 = p29_30ViewModel.thanhvien.c28 ?? 0;
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
                //p29
                UIRichText(
                  text1: "P29. Công việc này ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " làm thuê cho người khác hay cho gia đình mình?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "LÀM CHO GIA ĐÌNH MÌNH",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p29 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p29 = p29 == 1 ? 0 : 1;
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
                      p29 = p29 == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "LÀM THUÊ CHO NGƯỜI KHÁC",
                    textColor: Colors.black,
                    textFontSize: fontMedium,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p29 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p29 = p29 == 2 ? 0 : 2;
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
                      p29 = p29 == 2 ? 0 : 2;
                    });
                  },
                ),
                // const SizedBox(height: 10,),
                //p30
                Visibility(
                  visible: p29 == 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        UIRichText(
                          text1: "P30. Ngoài công việc tạo ra sản phẩm với mục đích để gia"
                              " đình sử dụng, trong 7 ngày qua, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " có làm công việc hoặc hoạt động kinh doanh nào "
                              "khác dù chỉ một giờ để tạo thu nhập không?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListTile(
                          title: const UIText(
                            text: "CÓ",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p30 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p30 = p30 == 1 ? 0 : 1;
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
                              p30 = p30 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        ListTile(
                          title: const UIText(
                            text: "KHÔNG",
                            textColor: Colors.black,
                            textFontSize: fontMedium,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p30 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p30 = p30 == 2 ? 0 : 2;
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
                              p30 = p30 == 2 ? 0 : 2;
                            });
                          },
                        ),
                      ],
                    )
                ),
                //Button
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p29_30ViewModel.P29_30Back();
                    }),
                    UINextButton(ontap: (){
                      if(p29 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P29 - Làm thuê cho người khác hay gia đình mình nhập vào chưa đúng!',)
                        );
                      } else if(p29 == 1 && p30 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P30 - Công việc hoặc HĐKD khác để tạo thu nhập nhập vào chưa đúng!',)
                        );
                      } else {
                        p29_30ViewModel.P29_30Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c27: p29,
                          c28: p30,
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