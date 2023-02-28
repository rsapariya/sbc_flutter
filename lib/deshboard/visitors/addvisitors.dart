// ignore_for_file: annotate_overrides, prefer_final_fields, override_on_non_overriding_member, unnecessary_import, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/visitors/Visitors.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
import 'package:http/http.dart' as http;

import '../../units/storage.dart';

class Addvisitors extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  Addvisitors({Key? key}) : super(key: key);

  @override
  State<Addvisitors> createState() => _AddvisitorsState();
}

class _AddvisitorsState extends State<Addvisitors> {
  TextEditingController city = TextEditingController();
  // var dropdownValue = events.first;
  String? _selected;
  @override
  var member = "Yes";
  List<Map> _myJson = [];
  var userid;
  bool Loding = false;
  TextEditingController visitorname = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController description = TextEditingController();

  void initState() {
    getevents();
    super.initState();
  }

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
          "Add Visitors",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white)),
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
                      style: GoogleFonts.poppins(),
                      controller: visitorname,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Visitors Name.",
                        lbltext: "Visitors Name.",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: Get.height / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: drop(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: business,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Business",
                        lbltext: "Business",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Phone No. ",
                        lbltext: "Phone No. ",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Is SGCCI Member ? ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      )),
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
                              member = "Yes";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: member == "Yes"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Yes",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: member == "Yes"
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
                              member = "No";
                            });
                          },
                          child: Container(
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: member == "No"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "No",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: member == "No"
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
                      controller: description,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Description",
                        lbltext: "Description",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: appbutton(
                          titel: "Add",
                          onTap: () {
                            if (visitorname.text.isNotEmpty &&
                                business.text.isNotEmpty &&
                                phone.text.isNotEmpty &&
                                _selected != null &&
                                description.text.isNotEmpty) {
                              setState(() {
                                Loding = true;
                              });
                              Addvisitorsapi();
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

  Addvisitorsapi() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/addVisitor'));
    request.fields.addAll({
      'visitor_name': visitorname.text,
      'visitor_contact': phone.text,
      'business': business.text,
      'added_by': getdata.read('USERID').toString(),
      'event_id': _selected.toString(),
      'ch_id': '1',
      'is_member': member.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Loding = false;
      setState(() {});
      Get.off(() => const Visitors());
      ApiWrapper.showToastMessage("Visitor Add Successfully");
    } else {
      Loding = false;
      setState(() {});
      ApiWrapper.showToastMessage("Something Went Wrong!!");
      if (kDebugMode) {
      }
    }
  }

  drop() {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isDense: true,
          hint: const Text("Select Filled"),
          value: _selected,
          onChanged: (String? newValue) {
            setState(() {
              _selected = newValue!;
            });
          },
          items: _myJson.map((Map map) {
            return DropdownMenuItem<String>(
              value: map["ev_id"].toString(),
              // value: _mySelection,
              child: Row(
                children: <Widget>[
                  // Image.asset(
                  //   map["id"],
                  //   width: 25,
                  // ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(map["ev_title"])),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  getevents() {
    ApiWrapper.dataGet(AppUrl.eventsss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        _myJson.clear();

        _myJson.clear();
        val.forEach((e) {
          _myJson.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        _myJson.clear();
      }
    });
  }
}
