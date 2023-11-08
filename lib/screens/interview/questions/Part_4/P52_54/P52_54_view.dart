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
import 'P52_54_viewmodel.dart';

class P52_54View extends StatefulWidget {
  const P52_54View({Key? key}) : super(key: key);

  @override
  State<P52_54View> createState() => _P52_54ViewState();
}

class _P52_54ViewState extends State<P52_54View> {
  late P52_54ViewModel p52_54ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p52 = 0, p53 = 0, p54 = 0;
  bool check_draw = true;

  var _thoigian = [
    "DƯỚI 1 THÁNG",
    "TỪ 1 ĐẾN DƯỚI 3 THÁNG",
    "TỪ 3 ĐẾN DƯỚI 12 THÁNG",
    "TỪ 12 THÁNG ĐẾN DƯỚI 3 NĂM",
    "TỪ 3 NĂM ĐẾN DƯỚI 9 NĂM",
    "TỪ 9 NĂM TRỞ LÊN",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p52_54ViewModel = context.read();
      p52_54ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p52_54ViewModel.thanhvien;
              p52 = p52_54ViewModel.thanhvien.c46 ?? 0;
              p53 = p52_54ViewModel.thanhvien.c47 ?? 0;
              p54 = p52_54ViewModel.thanhvien.c48 ?? 0;
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
                //p52
                Visibility(
                  visible: thanhvien.c45 == 1,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P52. Loại hình BHXH mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " đang tham gia đóng là gì?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListTile(
                          title: const UIText(
                            text: "BHXH BẮT BUỘC",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p52 == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p52 = p52 == 1 ? 0 : 1;
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
                              p52 = p52 == 1 ? 0 : 1;
                            });
                          },
                        ),
                        ListTile(
                          title: const UIText(
                            text: "BHXH TỰ NGUYỆN",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          ),
                          leading: RoundCheckBox(
                            isChecked: p52 == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p52 = p52 == 2 ? 0 : 2;
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
                              p52 = p52 == 2 ? 0 : 2;
                            });
                          },
                        ),
                        const SizedBox(height: 20,),
                      ],
                    )
                ),
                //p53
                UIRichText(
                  text1: "P53. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã làm công việc trên được bao lâu?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _thoigian.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thoigian[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p53 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p53 = p53 == index+1 ? 0 : index+1;
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
                          p53 = p53 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 20,),
                //p54
                UIRichText(
                  text1: "P54. Ngoài công việc này, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có làm một công việc nào khác để nhận tiền lương/tiền "
                      "công hoặc hoạt động sản xuất, kinh doanh để tạo ra thu "
                      "nhập không? (Không bao gồm các công việc tạo ra sản phẩm "
                      "với mục đích chủ yếu để gia đình mình sử dụng)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: const UIText(
                    text: "Có",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p54 == 1 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p54 = p54 == 1 ? 0 : 1;
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
                      p54 = p54 == 1 ? 0 : 1;
                    });
                  },
                ),
                ListTile(
                  title: const UIText(
                    text: "Không",
                    textColor: Colors.black,
                    textFontSize: fontLarge,
                    textAlign: TextAlign.start,
                  ),
                  leading: RoundCheckBox(
                    isChecked: p54 == 2 ? true : false,
                    onTap: (selected) {
                      setState(() {
                        p54 = p54 == 2 ? 0 : 2;
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
                      p54 = p54 == 2 ? 0 : 2;
                    });
                  },
                ),
                //Button
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p52_54ViewModel.P52_54Back();
                    }),
                    UINextButton(ontap: (){
                      if(thanhvien.c45 == 1 && p52 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P52 - Loại hình BHXH nhập vào chưa đúng!',)
                        );
                      }
                      else if(p53 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P53 - Thời gian làm công việc chính nhập vào chưa đúng!',)
                        );
                      }
                      else if(p54 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P54 - Làm nhiều hơn 1 việc nhập vào chưa đúng!',)
                        );
                      }
                      else if(thanhvien.c38 == 1 && thanhvien.c39 == 2 && (thanhvien.c45 == 1 && p52 == 1)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} làm việc trong khu vực hộ NN không có ĐKKD mà có BHXH bắt bắt buộc!',)
                        );
                      }
                      else if(thanhvien.c43 == 5 && (thanhvien.c38 == 5 || thanhvien.c38 == 6
                          || thanhvien.c38 == 7 || thanhvien.c38 == 8 || thanhvien.c38 == 9
                          || thanhvien.c38 == 10 || thanhvien.c38 == 12) && p52 == 2 &&
                          (thanhvien.c44 == 1 || thanhvien.c44 == 2 || thanhvien.c44 == 3)){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} làm công hưởng lương trong khu vực doanh nghiệp/nhà nước và có HĐLĐ từ 3 tháng trở lên mà không có BHXH tự nguyện. Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                if(thanhvien.c44! >= 5 && p52 == 1){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà loại HĐLĐ đã ký là ${thanhvien.c44 == 5? "Hợp đồng giao khoán công việc" : (thanhvien.c44 == 6? "Thỏa thuận miệng" : "Không có HĐLĐ")}. Có đúng không?',
                                        onpress: (){
                                          Navigator.of(context).pop();
                                          if(thanhvien.c39 == 2 && p52 == 1){
                                            showDialog(
                                                context: context,
                                                builder: (_) => UINotificationDialog(
                                                  notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà không đăng kí kinh doanh. Có đúng không?',
                                                  onpress: (){
                                                    Navigator.of(context).pop();
                                                    p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                                      idho: thanhvien.idho,
                                                      idtv: thanhvien.idtv,
                                                      c46: p52,
                                                      c47: p53,
                                                      c48: p54,
                                                    ));
                                                  },
                                                )
                                            );
                                          }
                                          else {
                                            p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c46: p52,
                                              c47: p53,
                                              c48: p54,
                                            ));
                                          }
                                        },
                                      )
                                  );
                                }
                                else if(thanhvien.c39 == 2 && p52 == 1){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà không đăng kí kinh doanh. Có đúng không?',
                                        onpress: (){
                                          Navigator.of(context).pop();
                                          p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                            idho: thanhvien.idho,
                                            idtv: thanhvien.idtv,
                                            c46: p52,
                                            c47: p53,
                                            c48: p54,
                                          ));
                                        },
                                      )
                                  );
                                }
                                else {
                                  p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c46: p52,
                                    c47: p53,
                                    c48: p54,
                                  ));
                                }
                              },
                            )
                        );
                      }
                      else if((thanhvien.c44 == 5 || thanhvien.c44 == 6 || thanhvien.c44 == 7) && p52 == 1){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà loại HĐLĐ đã ký là ${thanhvien.c44 == 5? "Hợp đồng giao khoán công việc" : (thanhvien.c44 == 6? "Thỏa thuận miệng" : "Không có HĐLĐ")}. Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                if(thanhvien.c39 == 2 && p52 == 1){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà không đăng kí kinh doanh. Có đúng không?',
                                        onpress: (){
                                          Navigator.of(context).pop();
                                          p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                            idho: thanhvien.idho,
                                            idtv: thanhvien.idtv,
                                            c46: p52,
                                            c47: p53,
                                            c48: p54,
                                          ));
                                        },
                                      )
                                  );
                                }
                                else {
                                  p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c46: p52,
                                    c47: p53,
                                    c48: p54,
                                  ));
                                }
                              },
                            )
                        );
                      }
                      else if(thanhvien.c39 == 2 && p52 == 1){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có BHXH bắt buộc mà không đăng kí kinh doanh. Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                                  idho: thanhvien.idho,
                                  idtv: thanhvien.idtv,
                                  c46: p52,
                                  c47: p53,
                                  c48: p54,
                                ));
                              },
                            )
                        );
                      }
                      else {
                        p52_54ViewModel.P52_54Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c46: p52,
                          c47: p53,
                          c48: p54,
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