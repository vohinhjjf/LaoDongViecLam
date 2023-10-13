import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import 'not_interview_viewmodel.dart';

class NotInterviewedView extends StatefulWidget {
  const NotInterviewedView({Key? key}) : super(key: key);

  @override
  State<NotInterviewedView> createState() => _NotInterviewedViewState();
}

class _NotInterviewedViewState extends State<NotInterviewedView> {
  late NotInterviewedViewModel notInterviewedViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  List<BangKeThangDTModel> listBangKeThangDTModel = [];
  final _text_find = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notInterviewedViewModel = context.read();
      notInterviewedViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = notInterviewedViewModel.data;
          listBangKeThangDTModel = notInterviewedViewModel.bangKeThangDTModel;
          print(notInterviewedViewModel.bangKeThangDTModel.length);
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => notInterviewedViewModel.notInterviewedBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.unInterviewedList,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _text_find,
                onChanged: (text){
                  setState(() {
                    //notInterviewedViewModel.searchData(text).then((value) => listBangKeCs = value);
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: mPrimaryColor)),
                  hintText: "Nhập từ khóa tìm kiếm",
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: listBangKeCs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      //print('Index $index');
                      /*if (_sPrefAppModel.interviewStatus == 1) {
                        notInterviewedViewModel.notInterviewed(index);
                      }*/
                      notInterviewedViewModel.notInterviewed(listBangKeCs[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: _item(listBangKeCs[index]),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(BangKeCsModel bangKeCsModel) {
    String trangThai = "CHƯA PHỎNG VẤN";
    for(var bangke in listBangKeThangDTModel){
      if(bangke.idhO_BKE == bangKeCsModel.idho){
        trangThai = "ĐANG PHỎNG VẤN";
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UIText(
          textAlign: TextAlign.start,
          text:'${bangKeCsModel.hoSo}. ${bangKeCsModel.tenChuHo}',
          textColor: trangThai == "CHƯA PHỎNG VẤN" ? Colors.black : Colors.amber.shade800,
          textFontSize: fontLarge,
          isBold: true,
        ),
        const SizedBox(height: 5,),
        UIText(
          textAlign: TextAlign.start,
          text:'${bangKeCsModel.diaChi}',
          textColor: trangThai == "CHƯA PHỎNG VẤN" ? Colors.black : Colors.amber.shade800,
          textFontSize: 14.sp,
          isBold: false,
        ),
        UIText(
          text:"Phiếu 03/VVL-TG: $trangThai",
          textFontSize: fontMedium,
          textColor: trangThai == "CHƯA PHỎNG VẤN" ? Colors.black : Colors.amber.shade800,
          isBold: trangThai != "CHƯA PHỎNG VẤN",
        )
      ],
    );
  }
}