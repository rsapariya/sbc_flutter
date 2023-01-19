// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, annotate_overrides, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/Facetoface/AddFacetoFace.dart';
import '../../units/api.dart';
import '../home.dart';
import 'package:http/http.dart' as http;

class Facetoface extends StatefulWidget {
  const Facetoface({Key? key}) : super(key: key);

  @override
  State<Facetoface> createState() => _FacetofaceState();
}

class _FacetofaceState extends State<Facetoface> {
  List Face = [];
  var faceis;
  bool Loding = true;
  void initState() {
    facetofaceapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => addfacetoface());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
        ),
      ),
      drawer: const Drower(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Face to Face',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Face.isEmpty
          ? Center(
              child: Text(
                "Requests Not Found",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontFamily: "popinns")),
              ),
            )
          : !Loding
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Face.length,
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
                                    Face[index]['username'],
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
                                        faceis = Face[index]['oto_id'];
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
                                        "Location",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                      ),
                                      Text(
                                        Face[index]['oto_location'],
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
                                        )),
                                      ),
                                      Text(
                                        Face[index]['oto_date'],
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
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
                                        "Conversion",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.2,
                                        child: Text(
                                          Face[index]["oto_conversation"],
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
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    value: null,
                    strokeWidth: 3.0,
                  ),
                ),
    );
  }

  facetofaceapi() {
    if (kDebugMode) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    ApiWrapper.dataGet(AppUrl.facetoface).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("FACETOFACE--->>>>$val");
        Face.clear();
        print("--------------------------????????????$Face");
        val.forEach((e) {
          Face.add(e);
          print(e);
        });
        setState(() {});
        Loding = false;
        print("**********************$Face");
      } else {
        setState(() {});
        Loding = false;
        Face.clear();
      }
    });
  }

  deletefacetofaceapi() async {
    print(">>>>>>>>>>>       DELETE      >>>>>>>>>>>>");
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.Request(
        'GET', Uri.parse('https://sbc.sgcci.in/api-old/deleteOTO/' + faceis));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      facetofaceapi();
      print(await response.stream.bytesToString());
    } else {
      ApiWrapper.showToastMessage("Something Went Wrong!!");
      print(response.reasonPhrase);
    }
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you Sure Want to Delete Face to Face ?',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    Get.back();
                    Loding = true;
                    deletefacetofaceapi();
                  });
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red, fontFamily: "popins"),
                )),
          ],
        );
      },
    );
  }
}
