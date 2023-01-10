// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show AlertDialog, AppBar, BorderRadius, BouncingScrollPhysics, BoxDecoration, BoxShadow, BuildContext, Center, CircularProgressIndicator, Colors, Column, Container, CrossAxisAlignment, Divider, EdgeInsets, FloatingActionButton, Icon, Icons, InkWell, Key, ListView, MainAxisAlignment, Padding, Row, Scaffold, SizedBox, Spacer, State, StatefulWidget, Text, TextButton, TextStyle, Widget, showDialog;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:sbc/deshboard/visitors/addvisitors.dart';

import '../../units/api.dart';

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
      drawer: const Drower(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Visitors', style: GoogleFonts.poppins()),
      ),
      body: visitors.isEmpty
          ? Center(
              child: Text("Visitors Not Found",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 18,
                  )),
            )
          : !Loding
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: visitors.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
                      child: Container(
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
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    color: Colors.transparent,
                                  ),
                                  Text(
                                    visitors[index]['ev_title'],
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //
                                      setState(() {
                                        visitid = visitors[index]['id'];
                                        _showMyDialogg();
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.black45,
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                      ),
                                      Text(
                                        visitors[index]['visitor_name'],
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontFamily: "popins Light")),
                                      ),
                                      Text(
                                        visitors[index]['ev_date'],
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: "popins")),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width / 20,
                                  )
                                ],
                              ),
                              const SizedBox(
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
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontFamily: "popins Light")),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.2,
                                        child: Text(
                                          visitors[index]["visitor_contact"],
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "popins")),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
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
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(color: Colors.black, fontFamily: "popins")),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontFamily: "popins")),
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
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.red, fontFamily: "popins")),
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
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
    } else {
      Loding = false;
      ApiWrapper.showToastMessage("Something Went Wrong !!");
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
  }

  Visitors() {
    if (kDebugMode) {
      print(">>>>>>>>>vivivivdicjdcj>>>>>>>>>>>>>");
    }

    ApiWrapper.dataGet(AppUrl.visitors).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        if (kDebugMode) {
          print("VISITORS--->>>>$val");
        }
        setState(() {
          visitors.clear();
        });
        val.forEach((e) {
          visitors.add(e);
          if (kDebugMode) {
            print(e);
          }
        });
        Loding = false;
        ApiWrapper.showToastMessage("Delete Visitor Succesefuly.");
        if (kDebugMode) {
          print("VISITORS>>>>>>----->>>>$visitors");
        }
      } else {
        visitors.clear();
        setState(() {
          Loding = false;
        });
      }
    });
  }
}
