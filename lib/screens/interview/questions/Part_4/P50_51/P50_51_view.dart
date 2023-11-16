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
import 'P50_51_viewmodel.dart';

class P50_51View extends StatefulWidget {
  const P50_51View({Key? key}) : super(key: key);

  @override
  State<P50_51View> createState() => _P50_51ViewState();
}

class _P50_51ViewState extends State<P50_51View> {
  late P50_51ViewModel p50_51ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p50 = 0, p51 = 0;
  bool check_draw = true;

  var _hopdong = [
    "Hợp đồng không xác định thời hạn",
    "Hợp đồng 1 năm đến dưới 3 năm",
    "Hợp đồng 3 tháng đến dưới 1 năm",
    "Hợp đồng dưới 3 tháng",
    "Hợp đồng giao khoán công việc",
    "Thỏa thuận miệng",
    "Không có hợp đồng lao động"
  ];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p50_51ViewModel = context.read();
      p50_51ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p50_51ViewModel.thanhvien;
              p50 = p50_51ViewModel.thanhvien.c44 ?? 0;
              p51 = p50_51ViewModel.thanhvien.c45 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p50
                Visibility(
                  visible: thanhvien.c43 == 5 ,
                    child: Column(
                      children: [
                        UIRichText(
                          text1: "P50. Với công việc này, ${BaseLogic.getInstance().getMember(thanhvien)} ",
                          text2: thanhvien.c00 ?? "",
                          text3: " đã ký loại hợp đồng lao động nào?",
                          textColor: Colors.black,
                          textFontSize:fontLarge,
                        ),
                        const SizedBox(height: 10,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _hopdong.length,
                          itemBuilder: (context, index) {
                            return UIListTile(
                              text: _hopdong[index].toString(),
                              check: p50 == index+1,
                              onTap1: (value){
                                setState(() {
                                  p50 = p50 == index+1 ? 0 : index+1;
                                });
                              },
                              onTap2: (){
                                setState(() {
                                  p50 = p50 == index+1 ? 0 : index+1;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 10,),
                      ],
                    )
                ),
                //p51
                UIRichText(
                  text1: "P51. ${BaseLogic.getInstance().getMember(thanhvien)} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " có tham gia đóng bảo hiểm xã hội tại nơi làm công việc trên không?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                UIListTile(
                  text: "Có",
                  check: p51 == 1,
                  onTap1: (value){
                    setState(() {
                      p51 = p51 == 1 ? 0 : 1;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p51 = p51 == 1 ? 0 : 1;
                    });
                  },
                ),
                const SizedBox(height: 5,),
                UIListTile(
                  text: "Không",
                  check: p51 == 2,
                  onTap1: (value){
                    setState(() {
                      p51 = p51 == 2 ? 0 : 2;
                    });
                  },
                  onTap2: (){
                    setState(() {
                      p51 = p51 == 2 ? 0 : 2;
                    });
                  },
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
              p50_51ViewModel.P50_51Back();
            }),
            UINextButton(ontap: (){
              if(thanhvien.c43 == 5 && p50 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P50-Loại hợp đồng nhập vào chưa đúng!',)
                );
              }
              else if(p51 == 0){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} có P51-Có đóng BHXH nhập vào chưa đúng!',)
                );
              }
              else if(p50 >= 5 && p51 == 1){
                showDialog(
                    context: context,
                    builder: (_) => UIWarningDialog(waring: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} không có hợp đồng lao động/hợp đồng giao khoán mà có bảo hiểm xã hội bắt buộc!',)
                );
              }
              else if((thanhvien.c38 == 7 || thanhvien.c38 == 8 || thanhvien.c38 == 9
                  || thanhvien.c38 == 10 || thanhvien.c38 == 12) && (p50 == 6 || p50 == 7)){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} làm việc trong khu vực nhà nước mà không có hợp đồng lao động. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(thanhvien.c43 == 5 && (thanhvien.c38 == 5 || thanhvien.c38 == 6
                            || thanhvien.c38 == 7 || thanhvien.c38 == 8 || thanhvien.c38 == 9
                            || thanhvien.c38 == 12) && p51 == 2 && (p50 == 1 || p50 == 2|| p50 == 3)){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} làm công hưởng lương trong khu vực doanh nghiệp/tổ chức đoàn thể khác và có HĐLĐ từ 3 tháng trở lên mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if((thanhvien.c38 == 10 || thanhvien.c38 == 11) &&
                                      (thanhvien.c43 == 5 || thanhvien.c43 == 6) && p51 == 2){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là lao động làm công ăn lương/chủ cơ sở trong khu vực cơ quan lập pháp/hành pháp/tư pháp và tổ chức CT-XH mà không có BHXH. Có đúng không?',
                                          onpress: (){
                                            Navigator.of(context).pop();
                                            if(p50 < 3 && p51 == 2){
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => UINotificationDialog(
                                                    notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                                    onpress: (){
                                                      Navigator.of(context).pop();
                                                      p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                                        idho: thanhvien.idho,
                                                        idtv: thanhvien.idtv,
                                                        c44: p50,
                                                        c45: p51,
                                                      ));
                                                    },
                                                  )
                                              );
                                            }
                                            else {
                                              p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c44: p50,
                                                c45: p51,
                                              ));
                                            }
                                          },
                                        )
                                    );
                                  }
                                  else if(p50 < 3 && p51 == 2){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                          onpress: (){
                                            Navigator.of(context).pop();
                                            p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c44: p50,
                                              c45: p51,
                                            ));
                                          },
                                        )
                                    );
                                  }
                                  else {
                                    p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c44: p50,
                                      c45: p51,
                                    ));
                                  }
                                },
                              )
                          );
                        }
                        else if((thanhvien.c38 == 10 || thanhvien.c38 == 11) &&
                            (thanhvien.c43 == 5 || thanhvien.c43 == 6) && p51 == 2){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là lao động làm công ăn lương/chủ cơ sở trong khu vực cơ quan lập pháp/hành pháp/tư pháp và tổ chức CT-XH mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p50 < 3 && p51 == 2){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                          onpress: (){
                                            Navigator.of(context).pop();
                                            p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c44: p50,
                                              c45: p51,
                                            ));
                                          },
                                        )
                                    );
                                  }
                                  else {
                                    p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c44: p50,
                                      c45: p51,
                                    ));
                                  }
                                },
                              )
                          );
                        }
                        else if(p50 < 3 && p51 == 2){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c44: p50,
                                    c45: p51,
                                  ));
                                },
                              )
                          );
                        }
                        else {
                          p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c44: p50,
                            c45: p51,
                          ));
                        }
                      },
                    )
                );
              }
              else if(thanhvien.c43 == 5 && (thanhvien.c38 == 5 || thanhvien.c38 == 6
                  || thanhvien.c38 == 7 || thanhvien.c38 == 8 || thanhvien.c38 == 9
                  || thanhvien.c38 == 12) && p51 == 2 && (p50 == 1 || p50 == 2|| p50 == 3)){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} làm công hưởng lương trong khu vực doanh nghiệp/tổ chức đoàn thể khác và có HĐLĐ từ 3 tháng trở lên mà không có BHXH. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if((thanhvien.c38 == 10 || thanhvien.c38 == 11) &&
                            (thanhvien.c43 == 5 || thanhvien.c43 == 6) && p51 == 2){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là lao động làm công ăn lương/chủ cơ sở trong khu vực cơ quan lập pháp/hành pháp/tư pháp và tổ chức CT-XH mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  if(p50 < 3 && p51 == 2){
                                    showDialog(
                                        context: context,
                                        builder: (_) => UINotificationDialog(
                                          notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                          onpress: (){
                                            Navigator.of(context).pop();
                                            p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c44: p50,
                                              c45: p51,
                                            ));
                                          },
                                        )
                                    );
                                  }
                                  else {
                                    p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c44: p50,
                                      c45: p51,
                                    ));
                                  }
                                },
                              )
                          );
                        }
                        else if(p50 < 3 && p51 == 2){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c44: p50,
                                    c45: p51,
                                  ));
                                },
                              )
                          );
                        }
                        else {
                          p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c44: p50,
                            c45: p51,
                          ));
                        }
                      },
                    )
                );
              }
              else if((thanhvien.c38 == 10 || thanhvien.c38 == 11) &&
                  (thanhvien.c43 == 5 || thanhvien.c43 == 6) && p51 == 2){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} là lao động làm công ăn lương/chủ cơ sở trong khu vực cơ quan lập pháp/hành pháp/tư pháp và tổ chức CT-XH mà không có BHXH. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        if(p50 < 3 && p51 == 2){
                          showDialog(
                              context: context,
                              builder: (_) => UINotificationDialog(
                                notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                                onpress: (){
                                  Navigator.of(context).pop();
                                  p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c44: p50,
                                    c45: p51,
                                  ));
                                },
                              )
                          );
                        }
                        else {
                          p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c44: p50,
                            c45: p51,
                          ));
                        }
                      },
                    )
                );
              }
              else if(p50 < 3 && p51 == 2){
                showDialog(
                    context: context,
                    builder: (_) => UINotificationDialog(
                      notification: '${BaseLogic.getInstance().getMember(thanhvien)} ${thanhvien.c00} ký loại HĐLĐ là ${p50 == 1? "Hợp đồng không xác định thời hạn" : "Hợp đồng 1 năm đến dưới 3 năm"} mà không có BHXH. Có đúng không?',
                      onpress: (){
                        Navigator.of(context).pop();
                        p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c44: p50,
                          c45: p51,
                        ));
                      },
                    )
                );
              }
              else {
                p50_51ViewModel.P50_51Next(thongTinThanhVienModel(
                  idho: thanhvien.idho,
                  idtv: thanhvien.idtv,
                  c44: p50,
                  c45: p51,
                ));
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