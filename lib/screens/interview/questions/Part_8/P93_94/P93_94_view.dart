import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P93_94_viewmodel.dart';

class P93_94View extends StatefulWidget {
  const P93_94View({Key? key}) : super(key: key);

  @override
  State<P93_94View> createState() => _P93_94ViewState();
}

class _P93_94ViewState extends State<P93_94View> {
  late P93_94ViewModel p93_94ViewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _other_93 = TextEditingController();
  final _other_94 = TextEditingController();
  var list_p93 = [0,0,0,0];
  var list_p94 = [0,0,0,0,0,0,0,0];

  final Map<String, int> _mucdich = {
    "Chuẩn bị cho tuổi già" : 1,
    "Chi cho giáo dục (cho mình hoặc người thân)" : 2,
    "Đầu tư hoặc mở rộng kinh doanh" : 3,
    "Khác, ghi rõ" : 4,
  };

  final Map<String, int> _hinhthuc = {
    "Gửi tại ngân hàng": 1,
    "Đầu tư vào thị trường chứng khoán (Cổ phiếu/Trái phiếu/Chứng chỉ quỹ)": 2,
    "Giữ tại nhà": 3,
    "Hợp đồng ủy thác đầu tư": 4,
    "Quỹ hưu trí": 5,
    "Thông qua các nhóm tiết kiệm không chính thức (bao gồm gửi người trong "
            "gia đình, người không phải thành viên trong gia đình, hụi, họ, phường)": 6,
    "Đầu tư vào tài sản với ý định sẽ bán trong tương lai": 7,
    "Khác, ghi rõ": 8,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p93_94ViewModel = context.read();
      p93_94ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p93_94ViewModel.thanhvien;
              list_p93 = p93_94ViewModel.list_p93;
              list_p94 = p93_94ViewModel.list_p94;
              _other_93.text = p93_94ViewModel.dichVuTaiChinhModel.c93K ?? "";
              _other_94.text = p93_94ViewModel.dichVuTaiChinhModel.c94K ?? "";
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
          textFontSize: fontLarge,
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
                //p93
                UIRichText(
                  text1: "P93. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " để dành tiền/tiết kiệm tiền cho các mục đích nào "
                      "sau đây? (Có thể lựa chọn hơn 1 đáp án)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mucdich.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _mucdich.keys.elementAt(index),
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
                        value: _mucdich.values.elementAt(index),
                        groupValue: list_p93[index],
                        onChanged: (value) {
                          setState(() {
                            if(list_p93.contains(value)){
                              list_p93.fillRange(index, index+1, 0);
                            } else {
                              list_p93.fillRange(index, index+1, value);
                            }
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                      onTap: (){
                        setState(() {
                          if(list_p93.contains(_mucdich.values.elementAt(index))){
                            list_p93.fillRange(index, index+1, 0);
                          } else {
                            list_p93.fillRange(index, index+1, _mucdich.values.elementAt(index));
                          }
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: list_p93[list_p93.length-1] == 4 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UIText(
                        text: "Mục đích khác",
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      const SizedBox(height: 5,),
                      TextFormField(
                        autofocus: true,
                        controller: _other_93,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Vui lòng nhập mục đích khác';
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
                const SizedBox(height: 10,),
                //p94
                UIRichText(
                  text1: "P94. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " để dành/tiết kiệm theo hình thức "
                      "nào sau đây? (Có thể lựa chọn hơn 1 đáp án)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _hinhthuc.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _hinhthuc.keys.elementAt(index),
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
                        value: _hinhthuc.values.elementAt(index),
                        groupValue: list_p94[index],
                        onChanged: (value) {
                          setState(() {
                            if(list_p94.contains(value)){
                              list_p94.fillRange(index, index+1, 0);
                            } else {
                              list_p94.fillRange(index, index+1, value);
                            }
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                      onTap: (){
                        setState(() {
                          if(list_p94.contains(_hinhthuc.values.elementAt(index))){
                            list_p94.fillRange(index, index+1, 0);
                          } else {
                            list_p94.fillRange(index, index+1, _hinhthuc.values.elementAt(index));
                          }
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: list_p94[list_p94.length-1] == 8 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UIText(
                        text: "Hình thức khác",
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      const SizedBox(height: 5,),
                      TextFormField(
                        autofocus: true,
                        controller: _other_94,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Vui lòng nhập hình thức khác';
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
                          p93_94ViewModel.P93_94Back();
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
                          String p93 = "", p94 = "";
                          for(int i = 0; i < list_p93.length; i++){
                            if(list_p93[i] != 0){
                              p93 = '$p93,${list_p93[i]}';
                            }
                          }
                          for(int i = 0; i < list_p94.length; i++){
                            if(list_p94[i] != 0){
                              p94 = '$p94,${list_p94[i]}';
                            }
                          }
                          p93_94ViewModel.P93_94Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c93: p93.replaceFirst(RegExp(r','), ''),
                            c93K: _other_93.text,
                            c94: p94.replaceFirst(RegExp(r','), ''),
                            c94K: _other_94.text,
                          ));
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