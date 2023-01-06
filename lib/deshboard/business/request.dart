import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  @override
  late TabController _tabController;
  @override
  void initState() {
    GetUSers();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Business"),
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
                      'Received',
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
              children: [Recieved(), Sent()],
            ),
          ),
        ],
      ),
    );
  }

  catapi() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.cetagory).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        val.forEach((e) {
          print(e);
          setState(() {});
        });
        // print("Catagory----->>>>$cat");
      }
    });
  }

  GetUSers() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.getusers).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        Users.clear();
        Usersid.clear();
        // print("----------->>>>$val");
        val.forEach((e) {
          Users.add(e['username']);
          print(">>>$Users");
        });
        val.forEach((e) {
          Usersid.add(e['id']);
          print(Usersid);
        });
        setState(() {});
        // print("~~~~~~~~~~~~~~~~~>>>$Usersid");
      } else {}
    });
  }
}
