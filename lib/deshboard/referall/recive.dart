
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
                  "Requests Not Found",
                  style: TextStyle(
                      color: Colors.red, fontSize: 18, fontFamily: "popinns"),
                ),
              )
            : SingleChildScrollView(
          physics:BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    //   child: SizedBox(
                    //     height: Get.height / 14,
                    //     child: TextFormField(
                    //       style: TextStyle(
                    //         fontFamily: "popins",
                    //       ),
                    //       // controller: code,
                    //       autofocus: false,
                    //       onChanged: searh,
                    //       controller: search,
                    //       decoration: buildInputDecoration(hintText: "Search"),
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: "popins"),
                                      ),
                                      Text(
                                        Recivereffrel[index]['ref_date'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "popins"),
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
      hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
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
                style: TextStyle(color: Colors.black, fontFamily: "popins"),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
            ],
          ),
          content: SingleChildScrollView(
              physics:BouncingScrollPhysics(),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Remarks",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 14, fontFamily: "popins"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      getdata.read('details')["remarks"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "popins"),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 14, fontFamily: "popins"),
                  ),
                  Row(
                    children: [
                      Text(
                        getdata.read('details')["person_contact"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "popins"),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _makingPhoneCall();
                            });
                          },
                          child: Icon(
                            Icons.call,
                            color: Colors.green,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () async {
                            _wahtt();

                            setState(() {});
                          },
                          child: Icon(
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
      print("error");
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
