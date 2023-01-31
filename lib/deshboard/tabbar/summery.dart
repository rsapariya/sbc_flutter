// ignore_for_file: camel_case_types, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/units/storage.dart';

class summery extends StatefulWidget {
  const summery({Key? key}) : super(key: key);

  @override
  State<summery> createState() => _summeryState();
}

class _summeryState extends State<summery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4)
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 20, vertical: Get.width / 40),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Bussiness Received",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                          Text(
                            "₹${getdata.read("deta")[0]['amount']}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Business Given",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                          Text(
                            "₹${getdata.read("deta")[1]['amount']}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Raferral Received",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )),
                          Text(
                            getdata.read('deta')[2]['amount'],
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Referrel Given",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                          Text(
                            getdata.read('deta')[3]['amount'],
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Face to Face",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              "${getdata.read('deta')[4]['amount']}",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Visitors",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                          Text(
                            "${getdata.read('deta')[5]['amount']}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
