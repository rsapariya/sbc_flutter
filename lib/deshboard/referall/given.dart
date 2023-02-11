import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/referall/Reffrel.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
    getgivenrefrel();
    super.initState();
  }

  Future<void> refresher() async {
    return getgivenrefrel();
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
        body: RefreshIndicator(
          child: Container(
            height: Get.height / 1,
            child: Givenreffrel.isEmpty
                ? Center(
                    child: Text(
                      "Referral Not Found",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      )),
                    ),
                  )
                : !Loding
                    ? ListView.builder(
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
                                            Givenreffrel[index]['username']??"",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                          ),
                                          Text(
                                            Givenreffrel[index]["ref_date"]??"",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            refid =
                                                Givenreffrel[index]["ref_id"];
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
                                    borderRadius: BorderRadius.circular(10)),
                              ),
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
          ),
          onRefresh: refresher,
        ));
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
      hintStyle: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
      labelStyle: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
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
                getdata.read('details')["username"]??"",
                style: GoogleFonts.poppins(),
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
                        "Person Name",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            )),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          getdata.read('details')["person_name"]??"",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ),
                      ),Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                getdata.read('details')["person_contact"]??"",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
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
                      Text(
                        "Remarks",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          getdata.read('details')["remarks"]??"",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                        ),
                      ),
                      Text(
                        "Priority",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          getdata.read('details')["priority"]??"",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                        ),
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
                    deletrefrel();
                  });
                },
                child: Text(
                  'Delete',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.red,
                  )),
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

  void getgivenrefrel() async {
    print("GIVEN___REFREEEEL____________________");
    ApiWrapper.dataGet(AppUrl.getgivenraf).then((val) {
      print("GIVEN____REFREEEEL____________________");
      if ((val != null) && (val.isNotEmpty)) {
        Givenreffrel.clear();
        setState(() {});
        val.forEach((e) {
          Givenreffrel.add(e);
        });
        Givenreffrel.sort((a, b) {
          var adate = a['ref_date']; //before -> var adate = a.expiry;
          var bdate = b['ref_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
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
