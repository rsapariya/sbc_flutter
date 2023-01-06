import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/referall/Reffrel.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../home.dart';
import 'addreferel.dart';

class given extends StatefulWidget {
  const given({Key? key}) : super(key: key);

  @override
  State<given> createState() => _givenState();
}

class _givenState extends State<given> with SingleTickerProviderStateMixin {
  @override
  bool Loding = false;
  var refid;
  TextEditingController search = TextEditingController();
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => addrefrel());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        child: Givenreffrel.isEmpty
            ? Center(
                child: Text(
                  "Raferral Not Found",
                  style: TextStyle(
                      color: Colors.red, fontSize: 18, fontFamily: "popinns"),
                ),
              )
            : !Loding
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: Get.width / 30),
                        //   child: SizedBox(
                        //     height: Get.height / 14,
                        //     child: TextFormField(
                        //       style: TextStyle(
                        //         fontFamily: "popins",
                        //       ),
                        //       // controller: code,
                        //       autofocus: false,
                        //       // onChanged: searh,
                        //       controller: search,
                        //       decoration:
                        //           buildInputDecoration(hintText: "Search"),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: Get.height / 1.4,
                          child: ListView.builder(
                            itemCount: Givenreffrel.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 30,
                                    vertical: Get.height / 80),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      save('details', Givenreffrel[index]);
                                      _showMyDialog();
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.height / 50,
                                          vertical: Get.height / 100),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Givenreffrel[index]
                                                    ['person_name'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily: "popins"),
                                              ),
                                              Text(
                                                Givenreffrel[index]["ref_date"],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "popins"),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {});
                                                refid = Givenreffrel[index]
                                                    ["ref_id"];
                                                _showMyDialogg();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.black38,
                                              ))
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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

  // void searh(String qury) {
  //   final suggestion = event.where((event) {
  //     final bookTitle = event['name'].toLowerCase();
  //     final input = qury.toLowerCase();
  //     return bookTitle.contains(input);
  //   }).toList();
  //   setState(() => event = suggestion);
  // }

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
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "popins"),
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
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "popins"),
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

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you Sure Want to Delete Raferral ?',
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
                    deletrefrel();
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

  deletrefrel() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.Request('GET',
        Uri.parse('https://sbc.sgcci.in/api-old/deleteReferral/' + refid));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {});
      getgivenrefrel();
      ApiWrapper.showToastMessage("Referral Delete successfully.");
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      setState(() {
        Loding = false;
      });
      ApiWrapper.showToastMessage("something Went Wrong!!");
    }
  }

  getgivenrefrel() {
    print("GIVEN___REFREEEEL____________________");
    ApiWrapper.dataGet(AppUrl.getgivenraf).then((val) {
      print("GIVEN____REFREEEEL____________________");
      if ((val != null) && (val.isNotEmpty)) {
        Givenreffrel.clear();
        setState(() {});
        val.forEach((e) {
          Givenreffrel.add(e);
        });
        Loding = false;
        setState(() {});
        print("~~~~~~~~~~~~~~~~~>>>$Givenreffrel");
      } else {
        setState(() {});
        Givenreffrel.clear();
        Loding = false;
      }
    });
  }
}
