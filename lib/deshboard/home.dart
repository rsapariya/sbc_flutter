import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sbc/deshboard/Profile.dart';
import 'package:sbc/deshboard/attendance.dart';
import 'package:sbc/deshboard/Facetoface/facetoface.dart';
import 'package:sbc/deshboard/referall/Reffrel.dart';
import 'package:sbc/deshboard/envents.dart';
import 'package:sbc/deshboard/tabbar/miting.dart';
import 'package:sbc/deshboard/tabbar/stats.dart';
import 'package:sbc/deshboard/tabbar/summery.dart';
import 'package:sbc/deshboard/visitors/Visitors.dart';
import 'package:sbc/login/login.dart';
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
  bool loding = true;
  @override
  void initState() {
    // homeapi();
    _tabController = TabController(vsync: this, length: 3);
    // getbiss();
    // recibiss();
    // Visitors();
    // getevents();
    getUser();
    // getallusers();

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
                  child: Text(
                    'Profile',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                // PopupMenuItem(
                //   value: "Change Password",
                //   child: Text('Change Password'),
                // ),
                PopupMenuItem(
                  value: "Sign Out",
                  child: Text('Sign Out', style: GoogleFonts.poppins()),
                ),
                PopupMenuItem(
                  value: "Rate Us",
                  child: Text('Rate Us', style: GoogleFonts.poppins()),
                ),
              ],
              onSelected: (String menu) {
                if (menu == "Profile") {
                  Get.to(() => Profilepage());
                } else if (menu == "Sign Out") {
                  setState(() {
                    save('Login', false);
                    Get.offAll(() => login());
                  });
                } else if (menu == "Rate Us") {
                  LaunchReview.launch(androidAppId: "com.sbc.sgcci");
                }
              },
            )
          ],
          centerTitle: true,
          title: Text(
            "Dashbord",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.white)),
          ),
        ),
        body: !loding
            ? Column(
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
                            horizontal: Get.width / 20,
                            vertical: Get.height / 80),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: getdata
                                          .read('User')['profile'] !=
                                      null
                                  ? NetworkImage(
                                      "https://sbc.sgcci.in/uploads/profile/" +
                                          getdata.read('User')['profile'])
                                  : NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
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
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                                ),
                                Text(
                                  "Status : ${getdata.read('User')['status'] ?? ""}",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
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
                            horizontal: Get.width / 20,
                            vertical: Get.width / 40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  getdata.read("dashboard")['next_event']
                                          ['date'] ??
                                      "",
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
                                  "Visitor",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                                ),
                                Text(
                                  getdata.read("dashboard")['next_event']
                                          ['visitors'] ??
                                      "",
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
                                  "Speakers",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                                ),
                                Text(
                                  getdata.read("dashboard")['next_event']
                                          ['speakers'] ??
                                      "",
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
                          indicatorPadding: const EdgeInsets.all(4),
                          indicator: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(40)),
                          tabs: [
                            Text(
                              'Summary',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'All time',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              '12 Month',
                              style:GoogleFonts.poppins(),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        const summery(),
                        const mitting(),
                        const states()
                      ],
                    ),
                  )
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Skeltel(
                      height: Get.height / 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Skeltel(
                      height: Get.height / 8,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Skeltel(
                      height: Get.height / 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Skeltel(
                      height: Get.height / 3,
                    ),
                  ],
                ),
              ),
        drawer: const Drower());
  }

  getbiss() {
    print(">>>>>>>>>>>>       GETBUSINESS     >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.Gbuiss).then((val) {
      print(UserID.toString());

      if ((val != null) && (val.isNotEmpty)) {
        print("           GETBUSINESS          $val");
        setState(() {
          getbuss.clear();
        });
        val.forEach((e) {
          getbuss.add(e);
          print(e);
        });
        print("           BUSINESSSSSSSSSSSS          ----->>>>$getbuss");
      } else {
        print(val);
      }
    });
  }

  getallusers() {
    // print(">>>>>>>>>>>>       USERSSSSS     >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.GetallUsers).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        // print("----------->>>>$val");
        setState(() {
          Userss.clear();
        });
        val.forEach((e) {
          Userss.add(e);
          // print(e);
        });
        // print("Get>>>>>>----->>>>$Userss");
      } else {
        setState(() {
          Userss.clear();
        });
      }
    });
  }

  Visitors() {
    // print(">>>>>>>>>>>>>       VISITORS      >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.visitors).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        // print("VISITORS--->>>>$val");
        setState(() {
          visitors.clear();
        });
        val.forEach((e) {
          visitors.add(e);
          // print(e);
        });
        // print("VISITORS>>>>>>----->>>>$visitors");
      }
    });
  }

  recibiss() {
    // print(">>>>>>>>>>>>         RECIVE        >>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.Rbuiss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        recivebuss.clear();
        // print("--------------------------????????????$recivebuss");
        val.forEach((e) {
          recivebuss.add(e);
          // print(e);
          // print("**********************>>>>>>>>>>$recivebuss");
        });
        setState(() {});
        // print("**********************$recivebuss");
      } else {
        recivebuss.clear();
      }
    });
  }

  getevents() {
    // print("--------------   EVENTS   ---------------");
    ApiWrapper.dataGet(AppUrl.eventsss).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        events.clear();

        // print("------------????????????$events");
        val.forEach((e) {
          events.add(e['ev_title']);
          // print(e);
          // print("**********************>>>>>>>>>>$events");
        });
        event.clear();
        val.forEach((e) {
          event.add(e);
          // print(e);
          // print("**********************>>>>>>>>>>$events");
        });
        setState(() {});
        // print("**********************$events");
      } else {
        setState(() {});
        events.clear();
      }
    });
  }

  getUser() {
    ApiWrapper.dataGet(AppUrl.GetUser).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        // print("    USER----->>>>$val");
        save('User', val);
        UserID = getdata.read('User')['id'].toString();
        setState(() {});
        // print("**********************${getdata.read('User')}");
        homeapi();
      } else {
        // print('XXXXXXXXXXXX');
      }
    });
  }

  homeapi() {
    // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.dashbord).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        save('dashboard', val);
        save('deta', val['data']);

        // print("----------->>>${getdata.read('dashboard')}");
        // print(val);
        setState(() {});

        loding = false;
        getevents();
        recibiss();
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
              title:  Text(
                "Dashboard",
                style:GoogleFonts.poppins(textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => home());

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const home()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/growth.png',
                scale: 18,
              ),
              title:  Text(
                "Business",
                style:GoogleFonts.poppins(textStyle:const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => bussnesss());

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const bussnesss()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/team.png',
                scale: 18,
              ),
              title:  Text(
                "Referral",
                style:GoogleFonts.poppins(textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),)
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => Refferal());

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const Refferal()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/discussion.png',
                scale: 18,
              ),
              title:  Text(
                "Face to Face",
                style:GoogleFonts.poppins(textStyle: const  TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => Facetoface());

                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const Facetoface()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/calendar.png',
                scale: 18,
              ),
              title:  Text(
                "Events",
                style: GoogleFonts.poppins(textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                )),
              ),
              onTap: () {
                Navigator.of(context);
                Get.off(() => const Events());
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const Events()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/attendance.png',
                scale: 18,
              ),
              title:  Text(
                "Attendance",
                style: GoogleFonts.poppins(textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => Attendance());
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const Attendance()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/visitor.png',
                scale: 18,
              ),
              title:  Text(
                "Visitors",
                style:GoogleFonts.poppins(textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                   )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => Visitors());
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const Visitors()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/image/business.png',
                scale: 18,
              ),
              title:  Text(
                "Members List",
                style:GoogleFonts.poppins(textStyle:const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.off(() => FilterMember());

                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const FilterMember()));
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
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
