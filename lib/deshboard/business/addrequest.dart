// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sbc/deshboard/business/request.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
import '../../units/storage.dart';
import '../home.dart';
import 'package:http/http.dart' as http;

class Addrequest extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  Addrequest({Key? key}) : super(key: key);

  @override
  State<Addrequest> createState() => _AddrequestState();
}

class _AddrequestState extends State<Addrequest> {
  TextEditingController city = TextEditingController();
  bool loding = false;
  List _foundUsers = [];
  var bussiness = "New";
  var conaction = "Inside";
  var userid;
  bool list = false;
  TextEditingController menber = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController remark = TextEditingController();

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
                Get.off(() => const bussnesss(),
                    transition: Transition.leftToRight);
                loding = false;
              });
            },
            child: const Icon(Icons.arrow_back)),
        title: Text(
          "Add Business",
          style: GoogleFonts.poppins(
              textStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.white))),
        ),
      ),
      body: !loding
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
                      autofocus: false,
                      onChanged: (value) => _runFilterr(value),
                      controller: menber,
                      decoration: buildInputDecoration(hintText: "Members"),
                    ),
                    list == true
                        ? SizedBox(
                            height: Get.height / 1.5,
                            child: ListView.builder(
                              itemCount: _foundUsers.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {});
                                      FocusScope.of(context).unfocus();
                                      list = false;
                                      menber.text = _foundUsers[index]
                                              ['username']
                                          .toString();
                                      userid =
                                          _foundUsers[index]['id'].toString();
                                    },
                                    child: SizedBox(
                                      width: Get.width / 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Get.height / 60),
                                        child: Text(
                                          _foundUsers[index]['username'] ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              textStyle: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16))),
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
                      keyboardType: TextInputType.number,
                      controller: amount,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Amount",
                        lbltext: "Amount",
                      ),
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
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          //formatted date output using intl package =>  2021-03-16
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
                    Text(
                      "   yyyy-MM-dd",
                      style: GoogleFonts.poppins(
                          textStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Bussiness Type",
                      style: GoogleFonts.poppins(
                          textStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ))),
                    ),
                    // appbutton(titel: "Request"),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              bussiness = "New";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: bussiness == "New"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "New",
                                  style: GoogleFonts.poppins(
                                      textStyle: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: bussiness == "New"
                                                  ? Colors.white
                                                  : Colors.blue))),
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
                              bussiness = "repet";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: bussiness == "repet"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Repeat",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: bussiness == "repet"
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
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Connection Type",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      )),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              conaction = "Inside";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: conaction == "Inside"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Inside",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: conaction == "Inside"
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
                              conaction = "Outside";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: conaction == "Outside"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Outside",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: conaction == "Outside"
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
                              conaction = "Tier3+";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: conaction == "Tier3+"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Tier3+",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: conaction == "Tier3+"
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
                                amount.text.isNotEmpty &&
                                date.text.isNotEmpty &&
                                remark.text.isNotEmpty) {
                              if (userid.toString() != "null") {
                                setState(() {
                                  loding = true;
                                });
                                print(userid);
                                gettoken();
                                bissness();
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
                strokeWidth: 3,
              ),
            ),
    );
  }

  void gettoken() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("UserTokens")
        .doc(userid.toString())
        .get();

    String msjtoken = snap['token'];
    save('OTP', msjtoken.toString());
    setState(() {});
    print('---------------------------');
    print(msjtoken);
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
      print(AppUrl.Rbuiss);
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");

        val.forEach((e) {
          recivebuss.add(e);

          print(e);
        });
        loding = false;
        print('OKKKKKKKKKK>>>>>>>>>>>>>>>>>>>');
        setState(() {});
        loding == false
            ? Get.off(() => const bussnesss(),
                transition: Transition.leftToRight)
            : loding;
      } else {
        setState(() {});
        loding = false;
        loding == false
            ? Get.off(() => const bussnesss(),
                transition: Transition.leftToRight)
            : loding;
        ApiWrapper.showToastMessage("Something Went Wrong!!");
        print('Something Went Wrong!!');
        print(val);
      }
      // Get.off(() => const bussnesss());
    });
  }

  bissness() async {
    var headers = {
      'x-api-key': '11a4046a-88f5-4530-a354-0098ccfc77ff',
      'Cookie': 'PHPSESSID=be7ca6784528877fff702353ee5a3e12'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/addBusinessRecieved'));
    request.fields.addAll({
      'user': getdata.read('USERID').toString(),
      'user_from': userid.toString(),
      'amount': amount.text.toString(),
      'ch_id': '1',
      'entry_date': date.text.toString(),
      'remarks': remark.text.toString(),
      'business_type': bussiness.toString(),
      'referral_type': conaction.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('>>>>>>>>>>>>>>>>>>>');
      loding = false;
      setState(() {});
      Send();

      recivebuss.clear();
      recibiss();
      ApiWrapper.showToastMessage('Business Add Sucsessfuly.');
    } else {
      print('ELSEELSELSLEELL>>>>>>>>>>>>>>>>>>>');
    }
  }

  void _runFilterr(String enteredKeyword) {
    print("---------------${list}----------------");
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = Userss.cast<Map<String, dynamic>>();
    } else {
      setState(() {
        list = true;
      });
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

  void Send() async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAwCm_dwk:APA91bGFg_2sv7zm-Msb1-1ggSgF-_32ZydqoAAUyhHJ1UmMMzpKhBSlw4_wA1NDg4eLmFkKho5FuBhtPJdf3CaSZqVwrOru64Q8kb7M7No6GEnLWgn2AuJvRf3KKAxH5o0voIpYyrGa'
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': Get.to(() => Addrequest()),
              'status': 'done',
              'body':
                  "${menber.text.toString()} Recived ${amount.text.toString()} business from you.",
              'title': "SBC Business"
            },
            "notification": <String, dynamic>{
              "title": "SBC Business",
              'body':
                  "${menber.text.toString()} Recived ${amount.text.toString()} business from you.",
              "android_channel_id": "SBC.SGCCI"
            },
            'to': getdata.read('OTP'),
          }));
    } catch (e) {
      print('---ERRRO----->>>>>>$e');
    }
  }
}
