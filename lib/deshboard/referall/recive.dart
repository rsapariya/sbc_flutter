import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../units/storage.dart';
import 'Reffrel.dart';

class Reciev extends StatefulWidget {
  const Reciev({Key? key}) : super(key: key);

  @override
  State<Reciev> createState() => _RecievState();
}

class _RecievState extends State<Reciev> with SingleTickerProviderStateMixin {
  @override
  List event = [
    {"name": "Ravi Sapariya", "date": "02-10-2022"},
    {"name": "avi Sapariya", "date": "02-10-2022"},
    {"name": "kavi Sapariya", "date": "02-10-2022"},
  ];
  TextEditingController search = TextEditingController();
  final Uri whattsapp = Uri.parse("https://wa.me/9714909088");
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Recivereffrel.isEmpty
            ? Center(
                child: Text(
                  "Referral Not Found",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  )),
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    //   child: SizedBox(
                    //     height: Get.height / 14,
                    //     child: TextFormField(
                    //       style: TextStyle(
                    //         ,
                    //       ),
                    //       // controller: code,
                    //       autofocus: false,
                    //       onChanged: searh,
                    //       controller: search,
                    //       decoration: buildInputDecoration(hintText: "Search"),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: Get.height / 1.4,
                      child: ListView.builder(
                        itemCount: Recivereffrel.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30,
                                vertical: Get.height / 80),
                            child: InkWell(
                              onTap: () {
                                _showMyDialog();
                                setState(() {
                                  save('details', Recivereffrel[index]);
                                });
                              },
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
                                      horizontal: Get.height / 50,
                                      vertical: Get.height / 100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Recivereffrel[index]['person_name'],
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        )),
                                      ),
                                      Text(
                                        Recivereffrel[index]['ref_date'],
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getdata.read('details')["person_name"],
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                )),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
            ],
          ),
          content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          getdata.read('details')["remarks"],
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                      ),
                      Row(
                        children: [
                          Text(
                            getdata.read('details')["person_contact"],
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _makingPhoneCall();
                                });
                              },
                              child: const Icon(
                                Icons.call,
                                color: Colors.green,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () async {
                                _wahtt();

                                setState(() {});
                              },
                              child: const Icon(
                                Icons.whatsapp,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }

  _makingPhoneCall() async {
    String num = getdata.read('details')['person_contact'].toString();
    var url = Uri.parse("tel:+91$num");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _wahtt() async {
    String number = getdata.read('details')['person_contact'].toString();
    final Uri uri = Uri.parse("whatsapp://send?phone=" + "91" + number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (kDebugMode) {
        print("error");
      }
      throw "ERROR ";
    }
  }

  // void searh(String qury) {
  //   final suggestion = event.where((event) {
  //     final bookTitle = event['name'].toLowerCase();
  //     final input = qury.toLowerCase();
  //     return bookTitle.contains(input);
  //   }).toList();
  //   setState(() => event = suggestion);
  // }
}
