// ignore_for_file: non_constant_identifier_names, annotate_overrides, prefer_interpolation_to_compose_strings, avoid_print, override_on_non_overriding_member, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sbc/deshboard/Profile.dart';
import 'package:sbc/deshboard/aboutapp.dart';
import 'package:sbc/deshboard/attendance.dart';
import 'package:sbc/deshboard/Facetoface/facetoface.dart';
import 'package:sbc/deshboard/referall/Reffrel.dart';
import 'package:sbc/deshboard/envents.dart';
import 'package:sbc/deshboard/tabbar/miting.dart';
import 'package:sbc/deshboard/tabbar/stats.dart';
import 'package:sbc/deshboard/tabbar/summery.dart';
import 'package:sbc/deshboard/visitors/Visitors.dart';
import 'package:sbc/login/login.dart';
import '../notificationservice/local_notification_service.dart';
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
  List screens = [const summery(), const mitting(), const states()];
  late TabController _tabController;
  bool loding = true;

  String? _packageInfoText;

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        save('T', token);
      });
      print("My token is ----->>>>>> ${getdata.read('T')}");
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection('UserTokens')
        .doc(getdata.read('User')['id'].toString())
        .set({'token': token});
  }

  @override
  void initState() {
    setState(() {});
    getInfo();
    save('Login', true);
    _tabController = TabController(vsync: this, length: 3);
    getUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            actions: [
              PopupMenuButton(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: "Profile",
                            child:
                                Text("Profile", style: GoogleFonts.poppins())),
                        PopupMenuItem(
                            value: "Sign Out",
                            child:
                                Text("Sign Out", style: GoogleFonts.poppins())),
                        PopupMenuItem(
                            value: "Rate Us",
                            child:
                                Text("Rate Us", style: GoogleFonts.poppins())),
                        PopupMenuItem(
                            value: "About",
                            child: Text("About", style: GoogleFonts.poppins())),
                      ],
                  onSelected: (String menu) {
                    if (menu == "Profile") {
                      Get.to(() => const Profilepage(),
                          transition: Transition.rightToLeft);
                    } else if (menu == "Sign Out") {
                      setState(() {
                        save('Login', false);

                        Get.offAll(() => login(),
                            transition: Transition.leftToRight);
                        save('EMAIL', 'aaaa');
                      });
                    } else if (menu == "Rate Us") {
                      LaunchReview.launch(androidAppId: "com.sbc.sgcci");
                    } else if (menu == "About") {
                      Get.to(() => About(), transition: Transition.rightToLeft);
                    }
                  })
            ],
            centerTitle: true,
            title: Text("Dashboard",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.white)))),
        body: !loding
            ? DoubleBackToCloseApp(
                snackBar: SnackBar(content: Text('Tap back again to Exit.')),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.height / 80),
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
                                    horizontal: Get.width / 20,
                                    vertical: Get.height / 80),
                                child: Row(children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: getdata
                                                .read('User')['profile'] !=
                                            null
                                        ? NetworkImage(
                                            "https://sbc.sgcci.in/uploads/profile/" +
                                                getdata.read('User')['profile'])
                                        : const NetworkImage(
                                            'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          getdata.read('User')['username'] ??
                                              "",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ))),
                                      getdata.read('User')['due_date'] != "" ||
                                              getdata.read(
                                                      'User')['due_date'] !=
                                                  null
                                          ? Text(
                                              "Due : ${getdata.read('User')['due_date'] ?? ""}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14)))
                                          : SizedBox(),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                      "${getdata.read('User')['status'] ?? ""}",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: getdata.read(
                                                          'User')['status'] ==
                                                      "active"
                                                  ? Colors.blue
                                                  : Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)))
                                ])))),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 30),
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
                                    horizontal: Get.width / 20,
                                    vertical: Get.width / 40),
                                child: SingleChildScrollView(
                                    child: Column(children: [
                                  const SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Next Meeting Date",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                        ),
                                        Text(
                                            getdata.read("dashboard")[
                                                    'next_event']['date'] ??
                                                "",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )))
                                      ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Visitor",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ))),
                                        Text(
                                            getdata.read("dashboard")[
                                                    'next_event']['visitors'] ??
                                                "",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14)))
                                      ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Speakers",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ))),
                                        Text(
                                            getdata.read("dashboard")[
                                                    'next_event']['speakers'] ??
                                                "",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14)))
                                      ]),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ]))))),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.height / 80),
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
                                  Text('Summary',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500))),
                                  Text('All time',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500))),
                                  Text('12 Month',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500)))
                                ]))),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [summery(), mitting(), states()],
                      ),
                    )
                  ],
                ),
              )
            : DoubleBackToCloseApp(
                snackBar: SnackBar(content: Text('Tap back again to Exit.')),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      const SizedBox(height: 15),
                      Skeltel(height: Get.height / 15),
                      const SizedBox(height: 15),
                      Skeltel(height: Get.height / 8),
                      const SizedBox(height: 15),
                      Skeltel(height: Get.height / 15),
                      const SizedBox(height: 15),
                      Skeltel(height: Get.height / 3)
                    ])))),
        drawer: const Drower());
  }

  Future<void> refresher() async {
    return getUser();
  }

  getbiss() {
    ApiWrapper.dataGet(AppUrl.Gbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          getbuss.clear();
        });
        val.forEach((e) {
          getbuss.add(e);
        });
        getbuss.sort((a, b) {
          var adate = a['entry_date']; //before -> var adate = a.expiry;
          var bdate = b['entry_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
        });
      } else {
        if (kDebugMode) {}
      }
    });
  }

  getallusers() {
    ApiWrapper.dataGet(AppUrl.GetallUsers + getdata.read('EMAIL').toString())
        .then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          Userss.clear();
        });
        val.forEach((e) {
          Userss.add(e);
        });

        getToken();
      } else {
        setState(() {
          Userss.clear();
        });
      }
    });
  }

  Visitors() {
    ApiWrapper.dataGet(AppUrl.visitors).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          visitors.clear();
        });
        val.forEach((e) {
          visitors.add(e);
        });
        visitors.sort((a, b) {
          var adate = a['ev_date']; //before -> var adate = a.expiry;
          var bdate = b['ev_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
        });
      }
    });
  }

  recibiss() {
    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        recivebuss.clear();
        val.forEach((e) {
          recivebuss.add(e);
        });
        recivebuss.sort((a, b) {
          var adate = a['entry_date']; //before -> var adate = a.expiry;
          var bdate = b['entry_date']; //var bdate = b.expiry;
          return -adate.compareTo(bdate);
        });
        setState(() {});
      } else {
        recivebuss.clear();
      }
    });
  }

  getevents() {
    ApiWrapper.dataGet(AppUrl.eventsss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        events.clear();

        val.forEach((e) {
          events.add(e['ev_title']);
        });
        event.clear();
        val.forEach((e) {
          event.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        events.clear();
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
        Recivereffrel.sort((a, b) {
          var adate = a['ref_date'];
          var bdate = b['ref_date'];
          return -adate.compareTo(bdate);
        });
        setState(() {});
      } else {
        setState(() {});
        Recivereffrel.clear();
      }
    });
  }

  getUser() {
    ApiWrapper.dataGet(AppUrl.GetUser + getdata.read('EMAIL').toString())
        .then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          save('User', val);
          save('USERID', getdata.read('User')['id'].toString());
        });

        homeapi();
      } else {}
    });
  }

  homeapi() {
    ApiWrapper.dataGet(AppUrl.dashbord).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        save('dashboard', val);
        save('deta', val['data']);

        setState(() {});

        loding = false;
        getevents();
        recibiss();
        getrecivereffrel();
        getbiss();
        getallusers();
        Visitors();
      } else {
        loding = false;
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  void getInfo() async {
    setState(() {});

    if (getdata.read('varsion') != getdata.read('current')) {
      _showMyDialogg();
    }
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                'SBC New version 0.0.${getdata.read('varsion')} is available',
                style: GoogleFonts.poppins(),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {});
                      Get.back();
                    },
                    child: Text(
                      'Later',
                      style: GoogleFonts.poppins(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        LaunchReview.launch(androidAppId: "com.sbc.sgcci");
                      });
                    },
                    child: const Text('Update Now',
                        style: TextStyle(
                            color: Colors.blue, fontFamily: "popins")))
              ]);
        });
  }
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
              title: Text("Dashboard",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const home(), transition: Transition.leftToRight);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/growth.png',
                scale: 18,
              ),
              title: Text("Business",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const bussnesss(),
                    transition: Transition.leftToRight);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/team.png',
                scale: 18,
              ),
              title: Text("Referral",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const Refferal(),
                    transition: Transition.leftToRight);
              },
            ),
            ListTile(
              leading: Image.asset('assets/image/discussion.png', scale: 18),
              title: Text("Face to Face",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const Facetoface(),
                    transition: Transition.leftToRight);
              },
            ),
            ListTile(
              leading: Image.asset('assets/image/calendar.png', scale: 18),
              title: Text("Events",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.of(context);
                Get.to(() => const Events(),
                    transition: Transition.leftToRight);
              },
            ),
            ListTile(
              leading: Image.asset('assets/image/attendance.png', scale: 18),
              title: Text("Attendance",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const Attendance(),
                    transition: Transition.leftToRight);
              },
            ),
            ListTile(
                leading: Image.asset('assets/image/visitor.png', scale: 18),
                title: Text("Visitors",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, fontSize: 16))),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => const Visitors(),
                      transition: Transition.leftToRight);
                }),
            ListTile(
              leading: Image.asset('assets/image/business.png', scale: 18),
              title: Text("Members List",
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 16))),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const FilterMember(),
                    transition: Transition.leftToRight);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Skeltel extends StatelessWidget {
  const Skeltel({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16)));
  }
}
