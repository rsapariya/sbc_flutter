import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sbc/units/api.dart';
import 'login/onboarding.dart';

var countryCode = [];
var cat = [];
var Users = <String>[];
var Usersid = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    city();
    catapi();
    Timer(const Duration(seconds: 4), () => Get.off(() => BoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/splayscreen.png',
                scale: 1.5,
              ),
            ],
          ),
        )
        // Center(
        //     child: Text(
        //   "go".tr,
        //   style: TextStyle(
        //       color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        // )),
        );
  }

  city() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.city).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        val.forEach((e) {
          countryCode.add(e['city_name']);
          print(e);
          setState(() {});
        });
        print("City------>>>>$countryCode");
      }
    });
  }

  catapi() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    ApiWrapper.dataGet(AppUrl.cetagory).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------->>>>$val");
        val.forEach((e) {
          cat.add(e['cat_name']);
          print(e);
          setState(() {});
        });
        print("Catagory----->>>>$cat");
      }
    });
  }
}
