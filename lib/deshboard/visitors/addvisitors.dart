import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/visitors/Visitors.dart';
import 'package:sbc/units/customwidget.dart';
import '../../units/api.dart';
import 'package:http/http.dart' as http;

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
            child: Icon(Icons.arrow_back)),
        title: const Text(
          "Add Visitors",
          style: TextStyle(color: Colors.white, fontFamily: "popins"),
        ),
      ),
      body: !Loding
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 60),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
                      controller: visitorname,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Visitors Name.",
                        lbltext: "Visitors Name.",
                      ),
                    ),
                    SizedBox(
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
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
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
                      style: TextStyle(
                        fontFamily: "popins",
                      ),
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Phone No. ",
                        lbltext: "Phone No. ",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Is SGCCI Member ? ",
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: member == "Yes"
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: member == "No"
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
                      controller: description,
                      autofocus: false,
                      decoration: buildInputDecoration(
                        hintText: "Description",
                        lbltext: "Description",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: appbutton(
                          titel: "Add",
                          onTap: () {
                            if (visitorname.text.isNotEmpty &&
                                business.text.isNotEmpty &&
                                phone.text.isNotEmpty &&
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

  Addvisitorsapi() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/addVisitor'));
    request.fields.addAll({
      'visitor_name': visitorname.text,
      'visitor_contact': phone.text,
      'business': business.text,
      'added_by': '287',
      'event_id': _selected.toString(),
      'ch_id': '1',
      'is_member': member.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Loding = false;
      setState(() {});
      Get.off(() => Visitors());
      ApiWrapper.showToastMessage("Visitor Add Successfully");
      print(await response.stream.bytesToString());
    } else {
      Loding = false;
      setState(() {});
      ApiWrapper.showToastMessage("Something Went Wrong!!");
      print(response.reasonPhrase);
    }
  }

  drop() {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isDense: true,
          hint: new Text("Select Filled"),
          value: _selected,
          onChanged: (String? newValue) {
            setState(() {
              _selected = newValue!;
            });
            print(_selected);
          },
          items: _myJson.map((Map map) {
            return new DropdownMenuItem<String>(
              value: map["ev_id"].toString(),
              // value: _mySelection,
              child: Row(
                children: <Widget>[
                  // Image.asset(
                  //   map["id"],
                  //   width: 25,
                  // ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
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
    print("--------------   EVENTS   ---------------");
    ApiWrapper.dataGet(AppUrl.eventsss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        _myJson.clear();

        print("------------????????????$_myJson");

        _myJson.clear();
        val.forEach((e) {
          _myJson.add(e);
          print(e);
          print("**********************>>>>>>>>>>$_myJson");
        });
        setState(() {});
        print("**********************$_myJson");
      } else {
        setState(() {});
        _myJson.clear();
      }
    });
  }
}
