// ignore_for_file: unnecessary_import, camel_case_types, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/business/recieved.dart';
import 'package:sbc/deshboard/business/sent.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/splaysh.dart';

import '../../units/api.dart';

class bussnesss extends StatefulWidget {
  const bussnesss({Key? key}) : super(key: key);

  @override
  State<bussnesss> createState() => _bussnesssState();
}

class _bussnesssState extends State<bussnesss>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    GetUSers();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Business"),
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
                      'Received',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      'Given',
                      style: GoogleFonts.poppins(),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [Recieved(), Sent()],
            ),
          ),
        ],
      ),
    );
  }

  catapi() {
    if (kDebugMode) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    ApiWrapper.dataGet(AppUrl.cetagory).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        if (kDebugMode) {
          print("----------->>>>$val");
        }
        val.forEach((e) {
          if (kDebugMode) {
            print(e);
          }
          setState(() {});
        });
        // print("Catagory----->>>>$cat");
      }
    });
  }

  GetUSers() {
    if (kDebugMode) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    ApiWrapper.dataGet(AppUrl.getusers).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        Users.clear();
        Usersid.clear();
        // print("----------->>>>$val");
        val.forEach((e) {
          Users.add(e['username']);
          if (kDebugMode) {
            print(">>>$Users");
          }
        });
        val.forEach((e) {
          Usersid.add(e['id']);
          if (kDebugMode) {
            print(Usersid);
          }
        });
        setState(() {});
        // print("~~~~~~~~~~~~~~~~~>>>$Usersid");
      } else {}
    });
  }
}
