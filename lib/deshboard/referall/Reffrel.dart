import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/deshboard/referall/recive.dart';

import '../../units/api.dart';
import 'given.dart';

List Givenreffrel = [];
List Recivereffrel = [];

class Refferal extends StatefulWidget {
  const Refferal({Key? key}) : super(key: key);

  @override
  State<Refferal> createState() => _RefferalState();
}

class _RefferalState extends State<Refferal>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    getgivenrefrel();
    getrecivereffrel();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Referral",
          style: TextStyle(fontFamily: "popins"),
        ),
      ),
      drawer: Drower(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 30, vertical: Get.height / 80),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 4)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  controller: _tabController,
                  indicatorPadding: EdgeInsets.all(4),
                  indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40)),
                  tabs: [
                    Text(
                      'Recevied',
                      style: TextStyle(fontFamily: 'popins'),
                    ),
                    Text(
                      'Given',
                      style: TextStyle(fontFamily: 'popins'),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [Reciev(), given()],
            ),
          ),
        ],
      ),
    );
  }

  getgivenrefrel() {
    print("GIVEN___REFREEEEL____________________");
    ApiWrapper.dataGet(AppUrl.getgivenraf).then((val) {
      print("GIVEN____REFREEEEL____________________");
      if ((val != null) && (val.isNotEmpty)) {
        Givenreffrel.clear();
        setState(() {});
        val.forEach((e) {
          Givenreffrel.add(e);
        });
        setState(() {});
        print("~~~~~~~~~~~~~~~~~>>>$Givenreffrel");
      } else {
        setState(() {});
        Givenreffrel.clear();
      }
    });
  }

  getrecivereffrel() {
    print("RECIVE___REFREEEEL____________________");

    ApiWrapper.dataGet(AppUrl.getreciveraf).then((val) {
      print("RECIVE____REFREEEEL____________________");
      if ((val != null) && (val.isNotEmpty)) {
        Recivereffrel.clear();
        setState(() {});
        val.forEach((e) {
          Recivereffrel.add(e);
        });
        setState(() {});
        print("RECIVE~~~~~~~~~>>>$Recivereffrel");
      } else {
        setState(() {});
        Recivereffrel.clear();
      }
    });
  }
}
