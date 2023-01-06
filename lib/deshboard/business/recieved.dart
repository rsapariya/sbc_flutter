import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:http/http.dart' as http;
import '../../units/api.dart';
import 'addrequest.dart';

var entruid;
var delatebiss = "https://sbc.sgcci.in/api-old/deleteEntry/" + entruid;

class Recieved extends StatefulWidget {
  const Recieved({Key? key}) : super(key: key);

  @override
  State<Recieved> createState() => _RecievedState();
}

class _RecievedState extends State<Recieved>
    with SingleTickerProviderStateMixin {
  @override
  bool loding = false;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Addrequest());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        child: recivebuss.isEmpty
            ? Center(
                child: Text(
                  "Requests Not Found",
                  style: TextStyle(
                      color: Colors.red, fontSize: 18, fontFamily: "popinns"),
                ),
              )
            : !loding
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: recivebuss.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.height / 80),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      recivebuss[index]['username'],
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontFamily: "popins"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        entruid = recivebuss[index]['entry_id'];
                                        setState(() {});
                                        print(">>>>$delatebiss");
                                        _showMyDialog();
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: "popins Light"),
                                        ),
                                        Text(
                                          recivebuss[index]['entry_date'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Amount",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: "popins Light"),
                                        ),
                                        Text(
                                          recivebuss[index]['amount'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Remark",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: "popins Light"),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.2,
                                          child: Text(
                                            recivebuss[index]['remarks'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: "popins"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  // offset: Offset(9,7),
                                  spreadRadius: 4,
                                  blurRadius: 5,
                                  color: Colors.grey.withOpacity(0.1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      value: null,
                      strokeWidth: 3.0,
                    ),
                  ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you Sure Want to Delete Business ?',
            style: TextStyle(color: Colors.black, fontFamily: "popins"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black, fontFamily: "popins"),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    Get.back();
                    deletbiss();
                    loding = true;
                  });
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red, fontFamily: "popins"),
                )),
          ],
        );
      },
    );
  }

  deletbiss() async {
    print('________-DELETE BUSINESS-___________');
    var headers = {
      'x-api-key': '11a4046a-88f5-4530-a354-0098ccfc77ff',
      'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'
    };

    var request = await http.Request('GET',
        Uri.parse('https://sbc.sgcci.in/api-old/deleteEntry/' + entruid));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('________-DELETE SUCSESS-___________');
      print(response.stream.bytesToString());

      recibiss();
      setState(() {
        ApiWrapper.showToastMessage('Business Delete Sucsessfuly.');
      });
    } else {
      setState(() {
        loding = false;
        ApiWrapper.showToastMessage("Somthing Went Wrong");
      });
      print(response.reasonPhrase);
    }
  }

  recibiss() {
    print("_______---RECIVEBUSINESS______________");
    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      print("************");
      if ((val != null) && (val.isNotEmpty)) {
        print("___________RECIVEBUSINESS SUCSESS>>>>");
        recivebuss.clear();

        val.forEach((e) {
          recivebuss.add(e);
          print(e);
        });

        setState(() {});
        loding = false;
      } else {
        recivebuss.clear();
        loding = false;
        setState(() {});
      }
    });
  }
}
