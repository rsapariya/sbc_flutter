import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/deshboard/Profile.dart';
import 'package:sbc/deshboard/attendance.dart';
import 'package:sbc/deshboard/Facetoface/facetoface.dart';
import 'package:sbc/deshboard/referall/Reffrel.dart';
import 'package:sbc/deshboard/envents.dart';
import 'package:sbc/deshboard/tabbar/miting.dart';
import 'package:sbc/deshboard/tabbar/stats.dart';
import 'package:sbc/deshboard/tabbar/summery.dart';
import 'package:sbc/deshboard/visitors/Visitors.dart';
import '../units/api.dart';
import '../units/storage.dart';
import 'business/request.dart';
import 'members/filtermember.dart';

List getbuss = [];
List recivebuss = [];
List visitors = [];
List events = [];
List event = [];
List Userss = [];

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  @override
  List screens = [summery(), mitting(), states()];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    getbiss();
    recibiss();
    Visitors();
    getevents();
    getUser();
    getallusers();
    homeapi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Profile",
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: "Change Password",
                  child: Text('Change Password'),
                ),
                PopupMenuItem(
                  value: "Sign Out",
                  child: Text('Sign Out'),
                ),
                PopupMenuItem(
                  value: "Rate Us",
                  child: Text('Rate Us'),
                ),
              ],
              onSelected: (String menu) {
                if (menu == "Profile") {
                  Get.to(() => Profilepage());
                } else if (menu == "Change Password") {
                } else if (menu == "Sign Out") {
                } else if (menu == "Rate Us") {}
              },
            )
          ],
          centerTitle: true,
          title: Text(
            "Dashbord",
            style: TextStyle(color: Colors.white, fontFamily: "popins"),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 80),
              child: Container(
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
                      horizontal: Get.width / 20, vertical: Get.height / 80),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            "https://sbc.sgcci.in/uploads/profile/" +
                                    getdata.read('User')['profile'] ??""),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getdata.read('User')['username'] ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "popins"),
                          ),
                          Text(
                            "Status : ${getdata.read('User')['status'] ?? ""}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "popins"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4),
                  ],
                ),
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
                            "Next Meeting Date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "popins"),
                          ),
                          Text(
                            getdata.read("dashboard")['next_event']['date'] ??
                                "",
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
                            "Visitor",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "popins"),
                          ),
                          Text(
                            getdata.read("dashboard")['next_event']
                                    ['visitors'] ??
                                "",
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
                            "Speakers",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "popins"),
                          ),
                          Text(
                            getdata.read("dashboard")['next_event']
                                    ['speakers'] ??
                                "",
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
            ),
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
                        'Summary',
                        style: TextStyle(fontFamily: 'popins'),
                      ),
                      Text(
                        'All time',
                        style: TextStyle(fontFamily: 'popins'),
                      ),
                      Text(
                        '12 Month',
                        style: TextStyle(fontFamily: 'popins'),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [summery(), mitting(), states()],
              ),
            )
          ],
        ),
        drawer: Drower());
  }

  getbiss() {
    print(">>>>>>>>>>>>       GETBUSINESS     >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.Gbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        setState(() {
          getbuss.clear();
        });
        val.forEach((e) {
          getbuss.add(e);
          print(e);
        });
        print("Get>>>>>>----->>>>$getbuss");
      }
    });
  }

  getallusers() {
    print(">>>>>>>>>>>>       USERSSSSS     >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.GetallUsers).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        setState(() {
          Userss.clear();
        });
        val.forEach((e) {
          Userss.add(e);
          print(e);
        });
        print("Get>>>>>>----->>>>$Userss");
      } else {
        setState(() {
          Userss.clear();
        });
      }
    });
  }

  Visitors() {
    print(">>>>>>>>>>>>>       VISITORS      >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.visitors).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("VISITORS--->>>>$val");
        setState(() {
          visitors.clear();
        });
        val.forEach((e) {
          visitors.add(e);
          print(e);
        });
        print("VISITORS>>>>>>----->>>>$visitors");
      }
    });
  }

  recibiss() {
    print(">>>>>>>>>>>>         RECIVE        >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        recivebuss.clear();
        print("--------------------------????????????$recivebuss");
        val.forEach((e) {
          recivebuss.add(e);
          print(e);
          print("**********************>>>>>>>>>>$recivebuss");
        });
        setState(() {});
        print("**********************$recivebuss");
      } else {
        recivebuss.clear();
      }
    });
  }

  getevents() {
    print("--------------   EVENTS   ---------------");
    ApiWrapper.dataGet(AppUrl.eventsss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        events.clear();

        print("------------????????????$events");
        val.forEach((e) {
          events.add(e['ev_title']);
          print(e);
          print("**********************>>>>>>>>>>$events");
        });
        event.clear();
        val.forEach((e) {
          event.add(e);
          print(e);
          print("**********************>>>>>>>>>>$events");
        });
        setState(() {});
        print("**********************$events");
      } else {
        setState(() {});
        events.clear();
      }
    });
  }

  getUser() {
    print("--------------   USER   ---------------");
    ApiWrapper.dataGet(AppUrl.GetUser).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("    USER----->>>>$val");
        save('User', val);

        setState(() {});
        print("**********************${getdata.read('User')}");
      } else {
        print('XXXXXXXXXXXX');
      }
    });
  }
}

homeapi() {
  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

  ApiWrapper.dataGet(AppUrl.dashbord).then((val) {
    if ((val != null) && (val.isNotEmpty)) {
      save('dashboard', val);
      save('deta', val['data']);

      print("----------->>>${getdata.read('dashboard')}");
      print(val);
    }
  });
}

class Drower extends StatefulWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  @override
  final rightSlide = Get.width / 10;
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.3,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height / 40),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.asset(
                'assets/image/business.png',
                scale: 18,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => home()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/bussiness.png',
                scale: 18,
              ),
              title: Text(
                "Business",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => bussnesss()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/reffer.png',
                scale: 18,
              ),
              title: Text(
                "Referral",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Refferal()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/face.png',
                scale: 18,
              ),
              title: Text(
                "Face to Face",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Facetoface()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/calendar.png',
                scale: 18,
              ),
              title: Text(
                "Events",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.of(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Events()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/attendance.png',
                scale: 18,
              ),
              title: Text(
                "Attendance",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Attendance()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/visitor.png',
                scale: 18,
              ),
              title: Text(
                "Visitors",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Visitors()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/business.png',
                scale: 18,
              ),
              title: Text(
                "Members List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "popins light"),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FilterMember()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
