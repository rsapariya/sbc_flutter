import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/home.dart';

class Sent extends StatefulWidget {
  const Sent({Key? key}) : super(key: key);

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getbuss.isEmpty
            ? Center(
                child: Text(
                  "Requests Not Found",
                  style:GoogleFonts.poppins(textStyle:  TextStyle(
                      color: Colors.red, fontSize: 18, fontFamily: "popinns")),
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: getbuss.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 30, vertical: Get.height / 80),
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
                            Center(
                              child: Text(
                                getbuss[index]['username'],
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontFamily: "popins")),
                              ),
                            ),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "popins Light")),
                                    ),
                                    Text(
                                      getbuss[index]['entry_date'],
                                      style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "popins")),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: GoogleFonts.poppins(textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "popins Light")),
                                    ),
                                    Text(
                                      getbuss[index]['amount'],
                                      style:GoogleFonts.poppins(textStyle:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "popins")),
                                    ),
                                  ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Remark",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "popins Light"),
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.2,
                                      child: Text(
                                        getbuss[index]['remarks'],
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
              ),
      ),
    );
  }
}
