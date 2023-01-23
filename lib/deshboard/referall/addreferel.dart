// ignore_for_file: avoid_print, override_on_non_overriding_member, sized_box_for_whitespace, curly_braces_in_flow_control_structures, camel_case_types, prefer_typing_uninitialized_variables, annotate_overrides, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
import '../../units/storage.dart';
import '../business/request.dart';
import '../home.dart';
import 'package:http/http.dart' as http;
import 'Reffrel.dart';

bool lodiing = false;

class addrefrel extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  addrefrel({Key? key}) : super(key: key);

  @override
  State<addrefrel> createState() => _addrefrelState();
}

class _addrefrelState extends State<addrefrel> {
  TextEditingController city = TextEditingController();

  @override
  var priority = "Cold";
  var userid;
  List _foundUsers = [];
  TextEditingController menber = TextEditingController();
  TextEditingController parson = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController remark = TextEditingController();

  void initState() {
    super.initState();
    // _foundUsers = Userss;
  }

  bool list = false;
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
                // Get.off(() => bussnesss());
                // lodiing = false;
              });
            },
            child: const Icon(Icons.arrow_back)),
        title: Text(
          "Add Referral",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            color: Colors.white,
          )),
        ),
      ),
      body: !lodiing
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
                      style: GoogleFonts.poppins(),
                      // controller: code,
                      autofocus: false,
                      onChanged: (value) => _runFilterr(value),

                      controller: menber,
                      decoration: buildInputDecoration(hintText: "Members"),
                    ),
                    list == true
                        // _foundUsers.isNotEmpty
                        ? Container(
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
                                      menber.text = _foundUsers[index]
                                              ['username']
                                          .toString();
                                      userid =
                                          _foundUsers[index]['id'].toString();
                                      list = false;
                                      _foundUsers.clear();
                                      setState(() {});
                                    },
                                    child: SizedBox(
                                      width: Get.width / 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Get.height / 60),
                                        child: Text(
                                          _foundUsers[index]['username'] ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: parson,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Person Name",
                        lbltext: "Person Name",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Phone No.",
                        lbltext: "Phone No.",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Priority",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      )),
                    ),
                    // appbutton(titel: "Request"),

                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              priority = "Cold";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: priority == "Cold"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Cold",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: priority == "Cold"
                                              ? Colors.white
                                              : Colors.blue)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              priority = "Regular";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: priority == "Regular"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Regular",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: priority == "Regular"
                                              ? Colors.white
                                              : Colors.blue)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              priority = "Hot";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: priority == "Hot"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Hot",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: priority == "Hot"
                                              ? Colors.white
                                              : Colors.blue)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
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
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            date.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
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
                    Text(
                      "   yyyy-MM-dd",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLines: 3,
                      style: GoogleFonts.poppins(),
                      controller: remark,
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
                                parson.text.isNotEmpty &&
                                phone.text.isNotEmpty &&
                                date.text.isNotEmpty &&
                                remark.text.isNotEmpty) {
                              if (userid.toString() != "null") {
                                setState(() {
                                  lodiing = true;
                                });
                                print(userid);
                                Addrefrence();
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
                strokeWidth: 3.0,
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

  recibiss() {
    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");

        val.forEach((e) {
          recivebuss.add(e);

          print(e);
        });
        lodiing = false;
        print('OKKKKKKKKKK>>>>>>>>>>>>>>>>>>>');

        lodiing == false ? Get.off(() => const bussnesss()) : lodiing;
      } else
        lodiing = false;
      Get.off(() => const bussnesss());
    });
  }

  Addrefrence() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/addReferral'));
    request.fields.addAll({
      'ref_from': getdata.read('USERID').toString(),
      'ref_to': userid.toString(),
      'person_name': parson.text,
      'person_contact': phone.text,
      'ref_date': date.text,
      'remarks': remark.text,
      'ch_id': '1',
      'priority': priority.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("______Sucsees________");
      print(response.statusCode);
      lodiing = false;
      setState(() {});
      Get.off(() => const Refferal());
      ApiWrapper.showToastMessage("Referral Add successfully.");
      print(await response.stream.bytesToString());
    } else {
      setState(() {});
      lodiing = false;
      ApiWrapper.showToastMessage("something Went Wrong!!");
      print(response.reasonPhrase);
    }
  }

  void _runFilterr(String enteredKeyword) {
    List results = [];
    setState(() {
      list = true;
    });
    if (enteredKeyword.isEmpty) {
      // _foundUsers.clear();

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
    results.isEmpty ? list = false : _foundUsers = results;
    setState(() {});
  }
}
