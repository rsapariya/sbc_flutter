// ignore_for_file: prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool loding = false;
  @override
  void initState() {
    recibiss();
    super.initState();
  }

  @override
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
      body: RefreshIndicator(
        child: Container(
          child: recivebuss.isEmpty
              ? Center(
                  child: Text(
                    "Business Not Found",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    )),
                  ),
                )
              : !loding
                  ? ListView.builder(
                      itemCount: recivebuss.length,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width / 30),
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
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Center(
                                          child: Text(
                                            recivebuss[index]['username']??"",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                            )),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          entruid =
                                              recivebuss[index]['entry_id'];
                                          setState(() {});
                                          if (kDebugMode) {
                                            print(">>>>$delatebiss");
                                          }
                                          _showMyDialog();
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                            )),
                                          ),
                                          Text(
                                            recivebuss[index]['entry_date']??"",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Amount",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            )),
                                          ),
                                          Text(
                                            recivebuss[index]['amount']??"",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )),
                                          ),
                                        ],
                                      ),SizedBox(width:25,),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Remark",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                )),
                                          ),
                                          SizedBox(
                                            width: Get.width /3,
                                            child: Text(
                                              recivebuss[index]['remarks']??"",overflow:TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
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
        ),
        onRefresh: regresher,
      ),
    );
  }

  Future<void> regresher() async {
    recibiss();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you Sure Want to Delete Business ?',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    Get.back();
                    deletbiss();
                    loding = true;
                  });
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )),
          ],
        );
      },
    );
  }

  deletbiss() async {
    if (kDebugMode) {
      print('________-DELETE BUSINESS-___________');
    }
    var headers = {
      'x-api-key': '11a4046a-88f5-4530-a354-0098ccfc77ff',
      'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'
    };

    var request = http.Request('GET',
        Uri.parse('https://sbc.sgcci.in/api-old/deleteEntry/' + entruid));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('________-DELETE SUCSESS-___________');
      }
      if (kDebugMode) {
        print(response.stream.bytesToString());
      }

      recibiss();
      setState(() {
        ApiWrapper.showToastMessage('Business Delete Sucsessfuly.');
      });
    } else {
      setState(() {
        loding = false;
        ApiWrapper.showToastMessage("Somthing Went Wrong");
      });
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
  }

  recibiss() {
    if (kDebugMode) {
      print("_______---RECIVEBUSINESS______________");
    }
    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if (kDebugMode) {
        print("************");
      }
      if ((val != null) && (val.isNotEmpty)) {
        if (kDebugMode) {
          print("___________RECIVEBUSINESS SUCSESS>>>>");
        }
        recivebuss.clear();
        val.forEach((e) {
          recivebuss.add(e);
          print(e);
        });
        recivebuss.sort((a, b) {
          var adate = a['entry_date']; //before -> var adate = a.expiry;
          var bdate = b['entry_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
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
