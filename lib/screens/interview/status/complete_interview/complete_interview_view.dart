import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import 'complete_interview_viewmodel.dart';

class CompleteInterviewView extends StatefulWidget {
  const CompleteInterviewView({Key? key}) : super(key: key);

  @override
  State<CompleteInterviewView> createState() => _CompleteInterviewViewState();
}

class _CompleteInterviewViewState extends State<CompleteInterviewView> {
  late CompleteInterviewViewModel completeInterviewViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  List<BangKeCsModel> list = [];
  List<BangKeThangDTModel> listBangKeThangDTModel = [];
  final _text_find = TextEditingController();

  queryList(int thangDT) {
    for(var item in listBangKeThangDTModel) {
      list.add(listBangKeCs.singleWhere((e) => item.idhO_BKE == e.idho && e.thangDT == thangDT));
    }
    var list_query = listBangKeCs.where((e) => (e.trangthai_BK == 2 ||
        e.trangthai_BK == 3 ||e.trangthai_BK == 4) && e.thangDT == thangDT).toList();
    list.addAll(list_query);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      completeInterviewViewModel = context.read();
      completeInterviewViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = completeInterviewViewModel.data;
          listBangKeThangDTModel = completeInterviewViewModel.bangKeThangDTModel.where((e) => e.trangThai == 9 || e.trangThai == 8).toList();
          queryList(completeInterviewViewModel.thangDT!);
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
            onPressed: () => completeInterviewViewModel.CompleteInterviewBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.completeInterviewed,
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
                    //CompleteInterviewViewModel.searchData(text).then((value) => listBangKeCs = value);
                  });
                },
                style: const TextStyle(color: Colors.black, fontSize: fontMedium),
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
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      completeInterviewViewModel.CompleteInterview(listBangKeThangDTModel[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: _item(list[index]),
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
    var textColor = Colors.black;
    var text = "HOÀN THÀNH PHỎNG VẤN";
    if(listBangKeThangDTModel.any((e) => e.idhO_BKE == bangKeCsModel.idho && e.thangDT == bangKeCsModel.thangDT)) {
      BangKeThangDTModel bangKeThangDTModel = listBangKeThangDTModel
          .singleWhere((e) =>
      e.idhO_BKE == bangKeCsModel.idho && e.thangDT == bangKeCsModel.thangDT);
      if (bangKeThangDTModel.trangThai == 9) {
        if (bangKeThangDTModel.sync == 1) {
          textColor = mCompleteColor;
        } else {
          textColor = Colors.blue;
        }
        text = "HOÀN THÀNH PHỎNG VẤN";
      } else {
        textColor = Colors.black;
        text = "ĐANG SỬA";
      }
    } else {
      textColor = Colors.red.shade900;
      switch(bangKeCsModel.trangthai_BK){
        case 2: text = "TỪ CHỐI PHỎNG VẤN";break;
        case 3: text = "KHÔNG CÒN TẠI ĐỊA BÀN";break;
        case 4: text = "KHÔNG LIÊN LẠC ĐƯỢC";break;
      }
    }
    return UIRichText(
      text1: "${bangKeCsModel.hoSo} : ",
      text2: "$text - ${bangKeCsModel.tenChuHo}",
      text3: " - ${bangKeCsModel.diaChi}",
      textColor: textColor,
      textFontSize: fontLarge,
    );
  }
}