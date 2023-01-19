// ignore_for_file: unnecessary_import, annotate_overrides, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: GoogleFonts.poppins(),
        ),
      ),
      drawer: const Drower(),
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
                  indicatorPadding: const EdgeInsets.all(4),
                  indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40)),
                  tabs: [
                    Text(
                      'Recevied',
                      style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight:FontWeight.w500)),
                    ),
                    Text(
                      'Given',
                      style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight:FontWeight.w500)),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [const Reciev(), const given()],
            ),
          ),
        ],
      ),
    );
  }

  getgivenrefrel() {
    ApiWrapper.dataGet(AppUrl.getgivenraf).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        Givenreffrel.clear();
        setState(() {});
        val.forEach((e) {
          Givenreffrel.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        Givenreffrel.clear();
      }
    });
  }

  getrecivereffrel() {

    ApiWrapper.dataGet(AppUrl.getreciveraf).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        Recivereffrel.clear();
        setState(() {});
        val.forEach((e) {
          Recivereffrel.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        Recivereffrel.clear();
      }
    });
  }
}
