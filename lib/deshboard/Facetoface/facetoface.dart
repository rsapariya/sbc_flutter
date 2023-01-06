import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/deshboard/Facetoface/AddFacetoFace.dart';
import '../../units/api.dart';
import '../home.dart';
import 'package:http/http.dart' as http;

class Facetoface extends StatefulWidget {
  const Facetoface({Key? key}) : super(key: key);

  @override
  State<Facetoface> createState() => _FacetofaceState();
}

class _FacetofaceState extends State<Facetoface> {
  List Face = [];
  var faceis;
  bool Loding = true;
  void initState() {
    facetofaceapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => addfacetoface());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
        ),
      ),
      drawer: Drower(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Face to Face',
          style: TextStyle(fontFamily: 'popins'),
        ),
      ),
      body: Face.isEmpty
          ? Center(
              child: Text(
                "Requests Not Found",
                style: TextStyle(
                    color: Colors.red, fontSize: 18, fontFamily: "popinns"),
              ),
            )
          : !Loding
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Face.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
                      child: Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.transparent,
                                  ),
                                  Text(
                                    Face[index]['username'],
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontFamily: "popins"),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //
                                      setState(() {
                                        faceis = Face[index]['oto_id'];
                                        _showMyDialogg();
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.black45,
                                    ),
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: "popins Light"),
                                      ),
                                      Text(
                                        Face[index]['oto_location'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "popins"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: "popins Light"),
                                      ),
                                      Text(
                                        Face[index]['oto_date'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "popins"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width / 20,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Conversion",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: "popins Light"),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.2,
                                        child: Text(
                                          Face[index]["oto_conversation"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
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
    );
  }

  facetofaceapi() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.facetoface).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("FACETOFACE--->>>>$val");
        Face.clear();
        print("--------------------------????????????$Face");
        val.forEach((e) {
          Face.add(e);
          print(e);
        });
        setState(() {});
        Loding = false;
        print("**********************$Face");
      } else {
        setState(() {});
        Face.clear();
        Loding = false;
      }
    });
  }

  deletefacetofaceapi() async {
    print(">>>>>>>>>>>       DELETE      >>>>>>>>>>>>");
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.Request(
        'GET', Uri.parse('https://sbc.sgcci.in/api-old/deleteOTO/' + faceis));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      facetofaceapi();
      print(await response.stream.bytesToString());
    } else {
      ApiWrapper.showToastMessage("Something Went Wrong!!");
      print(response.reasonPhrase);
    }
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you Sure Want to Delete Face to Face ?',
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
                    deletefacetofaceapi();
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
}
