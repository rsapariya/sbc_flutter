import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sbc/deshboard/business/request.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
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

  @override
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

  void initState() {
    _foundUsers = Userss;
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
                Get.off(() => bussnesss());
                loding = false;
              });
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "Add Business",
          style: TextStyle(color: Colors.white, fontFamily: "popins"),
        ),
      ),
      body: !loding
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 60),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
                      // controller: code,
                      autofocus: false,
                      onChanged: (value) => _runFilterr(value),

                      controller: menber,
                      decoration: buildInputDecoration(hintText: "Members"),
                    ),
                    list == true
                        ? Container(
                            height: Get.height / 1.5,
                            child: ListView.builder(
                              // controller: controller,

                              itemCount: _foundUsers.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {});
                                      menber.text = _foundUsers[index]
                                              ['username']
                                          .toString();
                                      userid =
                                          _foundUsers[index]['id'].toString();
                                      list = false;
                                    },
                                    child: Container(
                                      child: SizedBox(
                                        width: Get.width / 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Get.height / 60),
                                          child: Text(
                                            _foundUsers[index]['username'] ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'popins'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : _foundUsers.isEmpty
                            ? Center(
                                child: Text(
                                  "User Not Found",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : Container(
                                color: Colors.red,
                              ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
                      keyboardType: TextInputType.number,
                      controller: amount,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Amount",
                        lbltext: "Amount",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
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
                          prifix: Icon(Icons.calendar_month_sharp)),
                    ),
                    Text(
                      "   yyyy-MM-dd",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "popins"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Bussiness Type",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "popins"),
                    ),
                    // appbutton(titel: "Request"),
                    SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: bussiness == "New"
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Repeat",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: bussiness == "repet"
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Connection Type",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "popins"),
                    ),

                    SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Inside",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: conaction == "Inside"
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Outside",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: conaction == "Outside"
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Tier3+",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: conaction == "Tier3+"
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
                      controller: remark,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Remark",
                        lbltext: "Remark",
                      ),
                    ),
                    SizedBox(
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
          : Center(
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

  recibiss() {
    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");

        val.forEach((e) {
          recivebuss.add(e);

          print(e);
        });
        loding = false;
        print('OKKKKKKKKKK>>>>>>>>>>>>>>>>>>>');

        loding == false ? Get.off(() => bussnesss()) : loding;
      } else
        loding = false;
      Get.off(() => bussnesss());
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
      'user': '287',
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
      recivebuss.clear();
      recibiss();
      ApiWrapper.showToastMessage('Business Add Sucsessfuly.');
      print(await response.stream.bytesToString());
    } else {
      print('ELSEELSELSLEELL>>>>>>>>>>>>>>>>>>>');

      print(response.reasonPhrase);
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
    results.isEmpty ? list = false : _foundUsers = results;
    setState(() {});
  }
}
