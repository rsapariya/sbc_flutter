// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
import 'package:http/http.dart' as http;
import '../../units/storage.dart';
import '../home.dart';
import 'facetoface.dart';

class addfacetoface extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  addfacetoface({Key? key}) : super(key: key);

  @override
  State<addfacetoface> createState() => _addfacetofaceState();
}

class _addfacetofaceState extends State<addfacetoface> {
  TextEditingController city = TextEditingController();

  bool lodiing = false;
  List _foundUsers = [];
  var priority = "Cold";
  var userid = "null";
  bool list = false;
  bool Loding = false;
  TextEditingController menber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController convertion = TextEditingController();

  @override
  void initState() {
    _foundUsers = Userss;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: const Icon(Icons.arrow_back)),
        title: Text(
          "Add Face to Face",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            color: Colors.white,
          )),
        ),
      ),
      body: !Loding
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 60),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(textStyle: const TextStyle()),
                      // controller: code,
                      autofocus: false,
                      onChanged: (value) => _runFilterr(value),

                      controller: menber,
                      decoration: buildInputDecoration(hintText: "Members"),
                    ),
                    list == true
                        ? SizedBox(
                            height: Get.height / 1.2,
                            child: ListView.builder(
                              // controller: controller,
                              itemCount: _foundUsers.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20),
                                  child: InkWell(
                                    onTap: () {
                                      if (kDebugMode) {

                                      }
                                      FocusScope.of(context).unfocus();
                                      menber.text = _foundUsers[index]
                                              ['username']
                                          .toString();
                                      userid =
                                          _foundUsers[index]['id'].toString();

                                      list = false;
                                      setState(() {});
                                      if (kDebugMode) {

                                      }
                                    },
                                    child: SizedBox(
                                      width: Get.width / 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Get.height / 60),
                                        child: Text(
                                          _foundUsers[index]['username'] ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            color: Colors.red,
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: location,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Location",
                        lbltext: "Location",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: const TextStyle(),
                      controller: date,
                      autofocus: false,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          if (kDebugMode) {

                          } //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          if (kDebugMode) {

                          } //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            date.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          if (kDebugMode) {

                          }
                        }
                      },
                      decoration: buildInputDecoration(
                          hintText: "Date",
                          lbltext: "Date",
                          prifix: const Icon(Icons.calendar_month_sharp)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "   yyyy-MM-dd",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLines: 3,
                      style: const TextStyle(),
                      controller: convertion,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Remark",
                        lbltext: "Remark",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: appbutton(
                          titel: "Add",
                          onTap: () {
                            if (menber.text.isNotEmpty &&
                                convertion.text.isNotEmpty &&
                                location.text.isNotEmpty &&
                                date.text.isNotEmpty) {
                              if (userid.toString() != "null") {
                                setState(() {
                                  Loding = true;
                                });
                                if (kDebugMode) {

                                }
                                Addfacetofaceapi();
                              } else {
                                ApiWrapper.showToastMessage(
                                    "Please Enter valid Member??");
                              }
                            } else {
                              ApiWrapper.showToastMessage(
                                  "Please Fill Feilds ??");
                            }
                          }),
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: null,
                strokeWidth:3,
              ),
            ),
    );
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    prifix,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: prifix,
      suffix: surfix,
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
      labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }

  Addfacetofaceapi() async {
    if (kDebugMode) {

    }
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/addOTO'));
    request.fields.addAll({
      'oto_from': getdata.read('USERID').toString(),
      'oto_to': userid.toString(),
      'oto_location': location.text,
      'oto_date': date.text,
      'oto_conversation': convertion.text,
      'ch_id': '1'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        Loding = false;
      });
      Get.off(() => const Facetoface(), transition: Transition.leftToRight);
      ApiWrapper.showToastMessage("Add Successfully");

      if (kDebugMode) {

      }
    } else {
      setState(() {
        Loding = false;
        Get.off(() => const Facetoface(), transition: Transition.leftToRight);
      });

      ApiWrapper.showToastMessage("Something Went Wrong!!");

      if (kDebugMode) {

      }
    }
  }

  void _runFilterr(String enteredKeyword) {
    List results = [];
    setState(() {
      list = true;
    });
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = Userss.cast<Map<String, dynamic>>();
    } else {
      results = Userss.where((user) => user['username']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {});
    results.isEmpty ? list = false : _foundUsers = results;
  }
}
