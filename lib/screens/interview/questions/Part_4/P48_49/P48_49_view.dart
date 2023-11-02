import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P48_49_viewmodel.dart';

class P48_49View extends StatefulWidget {
  const P48_49View({Key? key}) : super(key: key);

  @override
  State<P48_49View> createState() => _P48_49ViewState();
}

class _P48_49ViewState extends State<P48_49View> {
  late P48_49ViewModel p48_49ViewModel;
  var _tien = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p49 = 0;
  bool check = false, check_draw = true;

  var _vaitro = [
    "Chủ cơ sở (có thuê lao động)",
    "Tự làm",
    "Lao động gia đình",
    "Xã viên hợp tác xã",
    "Làm công ăn lương",
  ];
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p48_49ViewModel = context.read();
      p48_49ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p48_49ViewModel.thanhvien;
              p49 = p48_49ViewModel.thanhvien.c43 ?? 0;
              if(thanhvien.c41 == 1){
                check = true;
                _tien.text = "0";
              }else {
                _tien.text = p48_49ViewModel.thanhvien.c42.toString();
              }
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
        centerTitle: true,
        iconTheme: const IconThemeData(color: mPrimaryColor),
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
                //p48
                UIRichText(
                  text1: "P48. Cụ thể, ",
                  text2: thanhvien.c00 ?? "",
                  text3: " nhận được bao nhiêu tiền cho công việc này? "
                      "(ĐƠN VỊ TÍNH: NGHÌN ĐỒNG)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _tien,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Vui lòng nhập số tiền';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                  style: const TextStyle( color: Colors.black),
                  readOnly: check,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                  ),
                ),
                //p49
                const SizedBox(height: 10,),
                UIRichText(
                  text1: "P49. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " làm công việc này với vai trò là gì?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _vaitro.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _vaitro[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p49 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p49 = p49 == index+1 ? 0 : index+1;
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
                          p49 = p49 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                //Button
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p48_49ViewModel.P48_49Back();
                    }),
                    UINextButton(ontap: (){
                      if(p49 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(waring: 'P49 - Vai trò trong công việc chính nhập vào chưa đúng!',)
                        );
                      }
                      else if(thanhvien.c41 == 2 && (int.parse(_tien.text) > 1000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 2)!',)
                        );
                      }
                      else if(thanhvien.c41 == 3 && (int.parse(_tien.text) < 1000 || int.parse(_tien.text) > 10000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 3)!',)
                        );
                      }
                      else if(thanhvien.c41 == 4 && (int.parse(_tien.text) < 10000 || int.parse(_tien.text) > 20000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 4)!',)
                        );
                      }
                      else if(thanhvien.c41 == 5 && (int.parse(_tien.text) < 20000 || int.parse(_tien.text) > 50000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 5)!',)
                        );
                      }
                      else if(thanhvien.c41 == 6 && (int.parse(_tien.text) < 50000 || int.parse(_tien.text) > 100000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 6)!',)
                        );
                      }
                      else if(thanhvien.c41 == 7 && (int.parse(_tien.text) < 100000)){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}) không phù hợp với khoảng mức tiền công (P47 = 7)!',)
                        );
                      }
                      else if(int.parse(_tien.text) > 900000){
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P48 - Tổng số tiền nhận được của CV chính  = ${_tien.text} quá lớn!',)
                        );
                      }
                      else if(thanhvien.c38! >= 8 && (p49 == 2 || p49 == 3)){
                        String vithe = p49 == 2 ? "Tự làm" : "Lao động gia đình";
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} làm việc trong khu vực nhà nước/tổ chức mà vị thế là $vithe!',)
                        );
                      }
                      else if(thanhvien.c38! == 4 && (p49 == 1 || p49 == 2 || p49 == 3)){
                        String vaitro = p49 == 1 ?  "Chủ cơ sở" : (p49 == 2 ? "Tự làm" : "Lao động gia đình");
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có loại hình cơ sở là HTX (p49 = 4) nhưng P49 - Vai trò trong công việc chính là $vaitro!',)
                        );
                      }
                      else if(thanhvien.c38 != 4 && p49 == 4){
                        String p49 = "";
                        switch (thanhvien.c38){
                          case 1: p49 = "Hộ hoạt động nông, lâm nghiệp, thủy sản";break;
                          case 2: p49 = "Cơ sở sản xuất kinh doanh cá thể";break;
                          case 3: p49 = "Cá nhân làm tự do";break;
                          case 5: p49 = "Doanh nghiệp do Nhà nước làm chủ";break;
                          case 6: p49 = "Doanh nghiệp do tư nhân làm chủ";break;
                          case 7: p49 = "Doanh nghiệp do nước ngoài làm chủ";break;
                          case 8: p49 = "Đơn vị sự nghiệp nhà nước";break;
                          case 9: p49 = "Đơn vị sự nghiệp ngoài nhà nước";break;
                          case 10: p49 = "Cơ quan lập pháp/hành pháp/tư pháp";break;
                          case 11: p49 = "Tổ chức chính trị - xã hội";break;
                          case 12: p49 = "Tổ chức nước ngoài";break;
                          case 13: p49 = "Tổ chức đoàn thể khác";break;
                        }
                        showDialog(
                            context: context,
                            builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} là xã viên hợp tác xã (P49 = 4) mà cơ sở làm việc thuộc loại hình không phải hợp tác xã (p49 là $p49). Kiểm tra lại!',)
                        );
                      }
                      //Notifi
                      else if((int.parse(_tien.text) > 500000)){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}), thu nhập quá cao trên 500 triệu đồng/tháng. Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                if((thanhvien.c38 == 5 || thanhvien.c38 == 9) && (p49 == 2 || p49 == 3)){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien.c00} làm việc trong khu vực doanh nghiệp/đơn vị sự nghiệp ngoài nhà nước mà vị thế là ${p49 == 2 ? "Tự làm" : "Lao động gia đình"} . Có đúng không?',
                                        onpress: (){
                                          Navigator.of(context).pop();
                                          if(thanhvien.c38 == 4 && p49 == 5){
                                            showDialog(
                                                context: context,
                                                builder: (_) => UINotificationDialog(
                                                  notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                                                  onpress: (){
                                                    p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                                      idho: thanhvien.idho,
                                                      idtv: thanhvien.idtv,
                                                      c42: int.parse(_tien.text),
                                                      c43: p49,
                                                    ));
                                                  },
                                                )
                                            );
                                          }
                                          else {
                                            p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c42: int.parse(_tien.text),
                                              c43: p49,
                                            ));
                                          }
                                        },
                                      )
                                  );
                                }
                                else if(thanhvien.c38 == 4 && p49 == 5){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                                        onpress: (){
                                          p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                            idho: thanhvien.idho,
                                            idtv: thanhvien.idtv,
                                            c42: int.parse(_tien.text),
                                            c43: p49,
                                          ));
                                        },
                                      )
                                  );
                                }
                                else {
                                  p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c42: int.parse(_tien.text),
                                    c43: p49,
                                  ));
                                }
                              },
                            )
                        );
                      }
                      else if((int.parse(_tien.text) < 50)){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: 'Thành viên ${thanhvien.c00} có số tiền nhận được của CV chính (P48 = ${_tien.text}), thu nhập thấp dưới 50 nghìn đồng/tháng. Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                if((thanhvien.c38 == 5 || thanhvien.c38 == 9) && (p49 == 2 || p49 == 3)){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien.c00} làm việc trong khu vực doanh nghiệp/đơn vị sự nghiệp ngoài nhà nước mà vị thế là ${p49 == 2 ? "Tự làm" : "Lao động gia đình"} . Có đúng không?',
                                        onpress: (){
                                          Navigator.of(context).pop();
                                          if(thanhvien.c38 == 4 && p49 == 5){
                                            showDialog(
                                                context: context,
                                                builder: (_) => UINotificationDialog(
                                                  notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                                                  onpress: (){
                                                    p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                                      idho: thanhvien.idho,
                                                      idtv: thanhvien.idtv,
                                                      c42: int.parse(_tien.text),
                                                      c43: p49,
                                                    ));
                                                  },
                                                )
                                            );
                                          }
                                          else {
                                            p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                              idho: thanhvien.idho,
                                              idtv: thanhvien.idtv,
                                              c42: int.parse(_tien.text),
                                              c43: p49,
                                            ));
                                          }
                                        },
                                      )
                                  );
                                }
                                else if(thanhvien.c38 == 4 && p49 == 5){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                                        onpress: (){
                                          p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                            idho: thanhvien.idho,
                                            idtv: thanhvien.idtv,
                                            c42: int.parse(_tien.text),
                                            c43: p49,
                                          ));
                                        },
                                      )
                                  );
                                }
                                else {
                                  p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c42: int.parse(_tien.text),
                                    c43: p49,
                                  ));
                                }
                              },
                            )
                        );
                      }
                      else if((thanhvien.c38 == 5 || thanhvien.c38 == 9) && (p49 == 2 || p49 == 3)){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: 'Thành viên ${thanhvien.c00} làm việc trong khu vực doanh nghiệp/đơn vị sự nghiệp ngoài nhà nước mà vị thế là ${p49 == 2 ? "Tự làm" : "Lao động gia đình"} . Có đúng không?',
                              onpress: (){
                                Navigator.of(context).pop();
                                if(thanhvien.c38 == 4 && p49 == 5){
                                  showDialog(
                                      context: context,
                                      builder: (_) => UINotificationDialog(
                                        notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                                        onpress: (){
                                          p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                            idho: thanhvien.idho,
                                            idtv: thanhvien.idtv,
                                            c42: int.parse(_tien.text),
                                            c43: p49,
                                          ));
                                        },
                                      )
                                  );
                                }
                                else {
                                  p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                    idho: thanhvien.idho,
                                    idtv: thanhvien.idtv,
                                    c42: int.parse(_tien.text),
                                    c43: p49,
                                  ));
                                }
                              },
                            )
                        );
                      }
                      else if(thanhvien.c38 == 4 && p49 == 5){
                        showDialog(
                            context: context,
                            builder: (_) => UINotificationDialog(
                              notification: 'Thành viên ${thanhvien.c00} có cơ sở làm việc thuộc loại hình là hợp tác xã mà vị thế là làm công ăn lương. Có đúng không?',
                              onpress: (){
                                p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                                  idho: thanhvien.idho,
                                  idtv: thanhvien.idtv,
                                  c42: int.parse(_tien.text),
                                  c43: p49,
                                ));
                              },
                            )
                        );
                      }
                      else {
                        p48_49ViewModel.P48_49Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c42: int.parse(_tien.text),
                          c43: p49,
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