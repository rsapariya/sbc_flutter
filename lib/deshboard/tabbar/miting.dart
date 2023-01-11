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
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Business Received",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["life_time_detailes"]['business_recieved']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Business Given",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          "₹${getdata.read("dashboard")["life_time_detailes"]['business_given']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Referral Received",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['connection_received'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Referral Given",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['connection_given'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Face-to-Face",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['p2p'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Visitors",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins"),
                        ),
                        Text(
                          getdata.read("dashboard")["life_time_detailes"]
                              ['visitor'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "popins Light"),
                        ),
                      ],
                    ),
                    SizedBox(
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
