import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/home.dart';
import '../../units/api.dart';
import '../../units/storage.dart';

class Sent extends StatefulWidget {
  const Sent({Key? key}) : super(key: key);

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    getbiss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refresher,
        child: Container(
          child: getbuss.isEmpty
              ? Center(
                  child: Text(
                    "Business Not Found",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: "popinns")),
                  ),
                )
              : ListView.builder(
                  itemCount: getbuss.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Text(
                                  getbuss[index]['username']??"",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  )),
                                ),
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                      ),
                                      Text(
                                        getbuss[index]['entry_date']??"",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                      ),
                                      Text(
                                        getbuss[index]['amount']??"",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Remark",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height:5,),
                                      SizedBox(
                                        width:Get.width/3,
                                        child: Text(
                                          getbuss[index]['remarks']??"",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     ,
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> refresher() async {
    return getbiss();
  }

  getbiss() {
    print(">>>>>>>>>>>>       GETBUSINESS     >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.Gbuiss).then((val) {
      print(getdata.read('USERID'));

      if ((val != null) && (val.isNotEmpty)) {
        print("           GETBUSINESS          $val");
        setState(() {
          getbuss.clear();
        });
        val.forEach((e) {
          getbuss.add(e);
          print(e);
        });
        getbuss.sort((a, b) {
          var adate = a['entry_date']; //before -> var adate = a.expiry;
          var bdate = b['entry_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
        });
        print("           BUSINESSSSSSSSSSSS          ----->>>>$getbuss");
      } else {
        if (kDebugMode) {
          print(val);
        }
      }
    });
  }
}
