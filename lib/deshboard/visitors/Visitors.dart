import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/deshboard/visitors/addvisitors.dart';

import '../../units/api.dart';
import '../home.dart';
import '../home.dart';
import '../home.dart';
import '../home.dart';
import '../home.dart';

class Visitors extends StatefulWidget {
  const Visitors({Key? key}) : super(key: key);

  @override
  State<Visitors> createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors> {
  bool Loding = false;
  var visitid;
  @override
  void initState() {
    Visitors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Addvisitors());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
        ),
      ),
      drawer: Drower(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Visitors',
          style: TextStyle(fontFamily: "popins"),
        ),
      ),
      body: visitors.isEmpty
          ? Center(
              child: Text(
                "Visitors Not Found",
                style: TextStyle(
                    color: Colors.red, fontSize: 18, fontFamily: "popinns"),
              ),
            )
          : !Loding
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: visitors.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
                      child: Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
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
                                    visitors[index]['ev_title'],
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontFamily: "popins"),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //
                                      setState(() {
                                        visitid = visitors[index]['id'];
                                        _showMyDialogg();
                                      });
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
                                        "Name",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: "popins Light"),
                                      ),
                                      Text(
                                        visitors[index]['visitor_name'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "popins"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
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
                                        visitors[index]['ev_date'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "popins"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width / 20,
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
                                        "Phone No.",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: "popins Light"),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.2,
                                        child: Text(
                                          visitors[index]["visitor_contact"],
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
    );
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you Sure Want to Delete Visitor ?',
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
                    Loding = true;
                    deletevisitors();
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

  deletevisitors() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.Request('GET',
        Uri.parse('https://sbc.sgcci.in/api-old/deleteVisitor/' + visitid));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Visitors();
      print(await response.stream.bytesToString());
    } else {
      Loding = false;
      ApiWrapper.showToastMessage("Something Went Wrong !!");
      print(response.reasonPhrase);
    }
  }

  Visitors() {
    print(">>>>>>>>>vivivivdicjdcj>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.visitors).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("VISITORS--->>>>$val");
        setState(() {
          visitors.clear();
        });
        val.forEach((e) {
          visitors.add(e);
          print(e);
        });
        Loding = false;
        ApiWrapper.showToastMessage("Delete Visitor Succesefuly.");
        print("VISITORS>>>>>>----->>>>$visitors");
      } else {
        visitors.clear();
        setState(() {
          Loding = false;
        });
      }
    });
  }
}
