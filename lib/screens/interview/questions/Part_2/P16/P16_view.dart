import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P16_viewmodel.dart';

class P16View extends StatefulWidget {
  const P16View({Key? key}) : super(key: key);

  @override
  State<P16View> createState() => _P16ViewState();
}

class _P16ViewState extends State<P16View> {
  late P16ViewModel p16ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p16a = 0, p16b =0, p16c =0, p16d =0, p16e =0, p16f =0;
  bool check = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p16ViewModel = context.read();
      p16ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p16ViewModel.thanhvien;
              p16a = p16ViewModel.thanhvien.c14A ?? 0;
              p16b = p16ViewModel.thanhvien.c14B ?? 0;
              p16c = p16ViewModel.thanhvien.c14C ?? 0;
              p16d = p16ViewModel.thanhvien.c14D ?? 0;
              p16e = p16ViewModel.thanhvien.c14E ?? 0;
              p16f = p16ViewModel.thanhvien.c14F ?? 0;
              if(thanhvien.c04! >= 18){
                check = true;
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
                //p16
                UIRichText(
                  text1: "P16. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " đã đạt được các loại trình độ nào sau đây?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                const UIText(
                  text: "1. CÓ\n2. KHÔNG",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      width: 40,
                      child: UIText(
                        text: "1",
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 40,
                      child: UIText(
                        text: "2",
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 1,
                          child: UIText(
                            text: "Sơ cấp/Giấy phép\nlái xe ô tô",
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                          )
                      ),
                      Row(
                        children: [
                          RoundCheckBox(
                            isChecked: p16a == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p16a = p16a == 1 ? 0 : 1;
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
                          const SizedBox(width: 10,),
                          RoundCheckBox(
                            isChecked: p16a == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p16a = p16a == 2 ? 0 : 2;
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UIText(
                        text: "Trung cấp",
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          RoundCheckBox(
                            isChecked: p16b == 1 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p16b = p16b == 1 ? 0 : 1;
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
                          const SizedBox(width: 10,),
                          RoundCheckBox(
                            isChecked: p16b == 2 ? true : false,
                            onTap: (selected) {
                              setState(() {
                                p16b = p16b == 2 ? 0 : 2;
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
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: check,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const UIText(
                                text: "Cao đẳng",
                                textColor: Colors.black,
                                textFontSize: fontLarge,
                                textAlign: TextAlign.start,
                              ),
                              Row(
                                children: [
                                  RoundCheckBox(
                                    isChecked: p16c == 1 ? true : false,
                                    onTap: (selected) {
                                      setState(() {
                                        p16c = p16c == 1 ? 0 : 1;
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
                                  const SizedBox(width: 10,),
                                  RoundCheckBox(
                                    isChecked: p16c == 2 ? true : false,
                                    onTap: (selected) {
                                      setState(() {
                                        p16c = p16c == 2 ? 0 : 2;
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
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const UIText(
                                  text: "Đại học",
                                  textColor: Colors.black,
                                  textFontSize: fontLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  children: [
                                    RoundCheckBox(
                                      isChecked: p16d == 1 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16d = p16d == 1 ? 0 : 1;
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
                                    const SizedBox(width: 10,),
                                    RoundCheckBox(
                                      isChecked: p16d == 2 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16d = p16d == 2 ? 0 : 2;
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
                                  ],
                                )
                              ],
                            ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const UIText(
                                  text: "Thạc sỹ",
                                  textColor: Colors.black,
                                  textFontSize: fontLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  children: [
                                    RoundCheckBox(
                                      isChecked: p16e == 1 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16e = p16e == 1 ? 0 : 1;
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
                                    const SizedBox(width: 10,),
                                    RoundCheckBox(
                                      isChecked: p16e == 2 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16e = p16e == 2 ? 0 : 2;
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
                                  ],
                                )
                              ],
                            ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const UIText(
                                  text: "Tiến sỹ",
                                  textColor: Colors.black,
                                  textFontSize: fontLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  children: [
                                    RoundCheckBox(
                                      isChecked: p16f == 1 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16f = p16f == 1 ? 0 : 1;
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
                                    const SizedBox(width: 10,),
                                    RoundCheckBox(
                                      isChecked: p16f == 2 ? true : false,
                                      onTap: (selected) {
                                        setState(() {
                                          p16f = p16f == 2 ? 0 : 2;
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
                                  ],
                                )
                              ],
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
                          p16ViewModel.P16Back();
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
                          if(p16a == 0 || p16b == 0 || (check && (p16c == 0 ||p16d == 0 || p16e == 0 || p16f == 0))){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} có P16 - Trình độ CMKT bị bỏ trống!',)
                            );
                          }
                          else if(p16c == 1 && thanhvien.c04! < 18){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} dưới 18 tuổi mà đã tốt nghiệp cao đẳng!',)
                            );
                          }
                          else if(p16d == 1 && thanhvien.c04! < 20){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} dưới 20 tuổi mà đã tốt nghiệp đại học!',)
                            );
                          }
                          else if(p16e == 1 && thanhvien.c04! < 21){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} dưới 21 tuổi mà đã tốt nghiệp thạc sỹ!',)
                            );
                          }
                          else if(p16f == 1 && thanhvien.c04! < 22){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} dưới 22 tuổi mà đã tốt nghiệp tiến sỹ!',)
                            );
                          }
                          else if(p16d == 1 && thanhvien.c13! <= 4){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} trình độ cao nhất chưa tốt nghiệp Trung học phổ thông mà trình độ chuyên môn kỹ thuật là Đại học!',)
                            );
                          }
                          else if(p16e == 1 && thanhvien.c13! <= 4){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} trình độ cao nhất chưa tốt nghiệp Trung học phổ thông mà trình độ chuyên môn kỹ thuật là Thạc sỹ!',)
                            );
                          }
                          else if(p16f == 1 && thanhvien.c13! <= 4){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} trình độ cao nhất chưa tốt nghiệp Trung học phổ thông mà trình độ chuyên môn kỹ thuật là Tiến sỹ!',)
                            );
                          }
                          else if(p16d == 2 && p16f == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} chưa tốt nghiệp đại học mà trình độ chuyên môn kỹ thuật là Tiến sỹ!',)
                            );
                          }
                          else if(p16d == 2 && p16e == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: '${thanhvien.c00} chưa tốt nghiệp đại học mà trình độ chuyên môn kỹ thuật là Thạc sỹ!',)
                            );
                          }
                          else if((thanhvien.c04 == 20 || thanhvien.c04 == 21) && p16e == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp thạc sỹ. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if((thanhvien.c04! > 20 && thanhvien.c04! < 24) && p16f == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp tiến sỹ. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! < 15 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi < 15 mà đã tốt nghiệp trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c04! <= 20 && p16d == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c04! <= 18 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16c == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                                    onpress: (){
                                                                                      Navigator.of(context).pop();
                                                                                      if(thanhvien.c13! <= 3 && p16b == 1){
                                                                                        showDialog(
                                                                                            context: context,
                                                                                            builder: (_) => UINotificationDialog(
                                                                                              notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                              onpress: (){
                                                                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                                  idho: thanhvien.idho,
                                                                                                  idtv: thanhvien.idtv,
                                                                                                  c14A: p16a,
                                                                                                  c14B: p16b,
                                                                                                  c14C: p16c,
                                                                                                  c14D: p16d,
                                                                                                  c14E: p16e,
                                                                                                  c14F: p16f,
                                                                                                ));
                                                                                              },
                                                                                            )
                                                                                        );
                                                                                      }
                                                                                      else {
                                                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                          idho: thanhvien.idho,
                                                                                          idtv: thanhvien.idtv,
                                                                                          c14A: p16a,
                                                                                          c14B: p16b,
                                                                                          c14C: p16c,
                                                                                          c14D: p16d,
                                                                                          c14E: p16e,
                                                                                          c14F: p16f,
                                                                                        ));
                                                                                      }
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c04! <= 18 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c04! <= 20 && p16d == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c04! <= 18 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! < 15 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi < 15 mà đã tốt nghiệp trung cấp. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! <= 20 && p16d == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c04! <= 18 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! <= 20 && p16d == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! <= 18 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if((thanhvien.c04! > 20 && thanhvien.c04! < 24) && p16f == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp tiến sỹ. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c04! < 15 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi < 15 mà đã tốt nghiệp trung cấp. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! <= 20 && p16d == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c04! <= 18 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16c == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                          onpress: (){
                                                                            Navigator.of(context).pop();
                                                                            if(thanhvien.c13! <= 3 && p16b == 1){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (_) => UINotificationDialog(
                                                                                    notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                                    onpress: (){
                                                                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                        idho: thanhvien.idho,
                                                                                        idtv: thanhvien.idtv,
                                                                                        c14A: p16a,
                                                                                        c14B: p16b,
                                                                                        c14C: p16c,
                                                                                        c14D: p16d,
                                                                                        c14E: p16e,
                                                                                        c14F: p16f,
                                                                                      ));
                                                                                    },
                                                                                  )
                                                                              );
                                                                            }
                                                                            else {
                                                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                                idho: thanhvien.idho,
                                                                                idtv: thanhvien.idtv,
                                                                                c14A: p16a,
                                                                                c14B: p16b,
                                                                                c14C: p16c,
                                                                                c14D: p16d,
                                                                                c14E: p16e,
                                                                                c14F: p16f,
                                                                              ));
                                                                            }
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! <= 20 && p16d == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! <= 18 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c04! < 15 && p16b == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} có tuổi < 15 mà đã tốt nghiệp trung cấp. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c04! <= 20 && p16d == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c04! <= 18 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16c == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                                onpress: (){
                                                                  Navigator.of(context).pop();
                                                                  if(thanhvien.c13! <= 3 && p16b == 1){
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (_) => UINotificationDialog(
                                                                          notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                          onpress: (){
                                                                            p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                              idho: thanhvien.idho,
                                                                              idtv: thanhvien.idtv,
                                                                              c14A: p16a,
                                                                              c14B: p16b,
                                                                              c14C: p16c,
                                                                              c14D: p16d,
                                                                              c14E: p16e,
                                                                              c14F: p16f,
                                                                            ));
                                                                          },
                                                                        )
                                                                    );
                                                                  }
                                                                  else {
                                                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                      idho: thanhvien.idho,
                                                                      idtv: thanhvien.idtv,
                                                                      c14A: p16a,
                                                                      c14B: p16b,
                                                                      c14C: p16c,
                                                                      c14D: p16d,
                                                                      c14E: p16e,
                                                                      c14F: p16f,
                                                                    ));
                                                                  }
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c04! <= 18 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c04! <= 20 && p16d == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Đại học. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c04! <= 18 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16c == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                                      onpress: (){
                                                        Navigator.of(context).pop();
                                                        if(thanhvien.c13! <= 3 && p16b == 1){
                                                          showDialog(
                                                              context: context,
                                                              builder: (_) => UINotificationDialog(
                                                                notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                                onpress: (){
                                                                  p16ViewModel.P16Next(thongTinThanhVienModel(
                                                                    idho: thanhvien.idho,
                                                                    idtv: thanhvien.idtv,
                                                                    c14A: p16a,
                                                                    c14B: p16b,
                                                                    c14C: p16c,
                                                                    c14D: p16d,
                                                                    c14E: p16e,
                                                                    c14F: p16f,
                                                                  ));
                                                                },
                                                              )
                                                          );
                                                        }
                                                        else {
                                                          p16ViewModel.P16Next(thongTinThanhVienModel(
                                                            idho: thanhvien.idho,
                                                            idtv: thanhvien.idtv,
                                                            c14A: p16a,
                                                            c14B: p16b,
                                                            c14C: p16c,
                                                            c14D: p16d,
                                                            c14E: p16e,
                                                            c14F: p16f,
                                                          ));
                                                        }
                                                      },
                                                    )
                                                );
                                              }
                                              else if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c04! <= 18 && p16c == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} có tuổi là ${thanhvien.c04} mà đã tốt nghiệp Cao đẳng. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c13! <= 3 && p16c == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                            onpress: (){
                                              Navigator.of(context).pop();
                                              if(thanhvien.c13! <= 3 && p16b == 1){
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => UINotificationDialog(
                                                      notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                                      onpress: (){
                                                        p16ViewModel.P16Next(thongTinThanhVienModel(
                                                          idho: thanhvien.idho,
                                                          idtv: thanhvien.idtv,
                                                          c14A: p16a,
                                                          c14B: p16b,
                                                          c14C: p16c,
                                                          c14D: p16d,
                                                          c14E: p16e,
                                                          c14F: p16f,
                                                        ));
                                                      },
                                                    )
                                                );
                                              }
                                              else {
                                                p16ViewModel.P16Next(thongTinThanhVienModel(
                                                  idho: thanhvien.idho,
                                                  idtv: thanhvien.idtv,
                                                  c14A: p16a,
                                                  c14B: p16b,
                                                  c14C: p16c,
                                                  c14D: p16d,
                                                  c14E: p16e,
                                                  c14F: p16f,
                                                ));
                                              }
                                            },
                                          )
                                      );
                                    }
                                    else if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c13! <= 3 && p16c == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là cao đẳng. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    if(thanhvien.c13! <= 3 && p16b == 1){
                                      showDialog(
                                          context: context,
                                          builder: (_) => UINotificationDialog(
                                            notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                            onpress: (){
                                              p16ViewModel.P16Next(thongTinThanhVienModel(
                                                idho: thanhvien.idho,
                                                idtv: thanhvien.idtv,
                                                c14A: p16a,
                                                c14B: p16b,
                                                c14C: p16c,
                                                c14D: p16d,
                                                c14E: p16e,
                                                c14F: p16f,
                                              ));
                                            },
                                          )
                                      );
                                    }
                                    else {
                                      p16ViewModel.P16Next(thongTinThanhVienModel(
                                        idho: thanhvien.idho,
                                        idtv: thanhvien.idtv,
                                        c14A: p16a,
                                        c14B: p16b,
                                        c14C: p16c,
                                        c14D: p16d,
                                        c14E: p16e,
                                        c14F: p16f,
                                      ));
                                    }
                                  },
                                )
                            );
                          }
                          else if(thanhvien.c13! <= 3 && p16b == 1){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: '${thanhvien.c00} trình độ cao nhất dưới Trung học cơ sở mà trình độ chuyên môn kỹ thuật là trung cấp. Có đúng không?',
                                  onpress: (){
                                    p16ViewModel.P16Next(thongTinThanhVienModel(
                                      idho: thanhvien.idho,
                                      idtv: thanhvien.idtv,
                                      c14A: p16a,
                                      c14B: p16b,
                                      c14C: p16c,
                                      c14D: p16d,
                                      c14E: p16e,
                                      c14F: p16f,
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p16ViewModel.P16Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c14A: p16a,
                              c14B: p16b,
                              c14C: p16c,
                              c14D: p16d,
                              c14E: p16e,
                              c14F: p16f,
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
    );
  }
}