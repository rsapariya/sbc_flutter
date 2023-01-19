// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../units/storage.dart';

class states extends StatefulWidget {
  const states({Key? key}) : super(key: key);

  @override
  State<states> createState() => _statesState();
}

class _statesState extends State<states> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
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
                          "Total Business Received",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              )),
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["last_one_year"]['business_recieved']}",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),)
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
                          style:GoogleFonts.poppins(textStyle:const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                          ),)
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["last_one_year"]['business_given']}",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
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
                          "Total Referral Received",
                          style:GoogleFonts.poppins(textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              )),
                        ),
                        Text(
                          getdata.read("dashboard")["last_one_year"]
                              ['connection_received'],
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Total Referral Given",
                          style:GoogleFonts.poppins(textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                          )),
                        ),
                        Text(
                          getdata.read("dashboard")["last_one_year"]
                              ['connection_given'],
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              )) ,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Face-to-Face",
                          style: GoogleFonts.poppins(textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              )),
                        ),
                        Text(
                          getdata.read("dashboard")["last_one_year"]['p2p'],
                          style:GoogleFonts.poppins(textStyle:  const TextStyle(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Visitors",
                          style:GoogleFonts.poppins(textStyle:  TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        ),
                        Text(
                          getdata.read("dashboard")["last_one_year"]['visitor'],
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
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
    );
  }
}
