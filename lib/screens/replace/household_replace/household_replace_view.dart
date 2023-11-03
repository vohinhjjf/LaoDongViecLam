import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import 'household_replace_viewmodel.dart';

class HouseholdReplaceView extends StatefulWidget {
  const HouseholdReplaceView({Key? key}) : super(key: key);

  @override
  State<HouseholdReplaceView> createState() => _HouseholdReplaceViewState();
}

class _HouseholdReplaceViewState extends State<HouseholdReplaceView> {
  late HouseholdReplaceViewModel householdReplaceViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  final _text_find = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      householdReplaceViewModel = context.read();
      householdReplaceViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = householdReplaceViewModel.data;
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
            onPressed: () => householdReplaceViewModel.HouseholdReplaceBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.householdReplace,
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
                    //householdReplaceViewModel.searchData(text).then((value) => listBangKeCs = value);
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
                      _showNotificationDialog("Thay thế hộ",(){
                        Navigator.of(context).pop();
                      },() {
                        print("Next");
                        householdReplaceViewModel.HouseholdReplaceNext(listBangKeCs[index].nhom!, listBangKeCs[index].idho!);
                      },);
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

  _showNotificationDialog(String title, Function() onpress1, Function() onpress2){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: UIText(
            text: title,
            textColor: Colors.black,
            textFontSize:fontLarge,
            isBold: false,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 60,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed: onpress1,
                    child: const UIText(
                        text: 'Sửa',
                      textFontSize: fontMedium,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    )
                ),
                MaterialButton(
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width-80)/2,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black,width: 0.1)
                    ),
                    onPressed: onpress2,
                    child: const UIText(
                      text: 'Thay thế',
                      textFontSize: fontMedium,
                      textAlign: TextAlign.center,
                      textColor: mPrimaryColor,
                      isBold: true,
                    )
                )
              ],
            ),
          ),
        ));
  }

  Widget _item(BangKeCsModel bangKeCsModel) {
    String status = "";
    switch (bangKeCsModel.trangthai_BK){
      case 2: status = "TỪ CHỐI PHỎNG VẤN";break;
      case 3: status = "KHÔNG CÒN TẠI ĐỊA BÀN";break;
      case 4: status = "KHÔNG LIÊN LẠC ĐƯỢC";break;
    }
    return UIRichText(
      text1: "",
      text2: "${bangKeCsModel.hoSo} : $status - ${bangKeCsModel.tenChuHo}",
      text3: " - ${bangKeCsModel.diaChi}",
      textColor: Colors.black,
      textFontSize: fontLarge,
    );
  }
}