// ignore_for_file: unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../units/storage.dart';

class mitting extends StatefulWidget {
  const mitting({Key? key}) : super(key: key);

  @override
  State<mitting> createState() => _mittingState();
}

class _mittingState extends State<mitting> {
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
                        const Text(
                          "Total Business Received",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["life_time_detailes"]['business_recieved']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
                        const Text(
                          "Total Business Given",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["life_time_detailes"]['business_given']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
                        const Text(
                          "Total Referral Received",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['connection_received'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
                        const Text(
                          "Total Referral Given",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['connection_given'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
                        const Text(
                          "Face-to-Face",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['p2p'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
                        const Text(
                          "Visitors",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['visitor'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
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
