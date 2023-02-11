// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/login/login.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';
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
    Timer(
        const Duration(seconds: 4),
        () => getdata.read('isOpen') == true
            ? getdata.read('Login') == true
                ? Get.offAll(() => home())
                : Get.off(() => login())
            : Get.off(() => const BoardingPage()));
  }

  @override
  final packageInfo = PackageInfo.fromPlatform();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/splayscreen.png',
                scale: 1.5,
              ),
            ],
          ),
        ));
  }

  city() {
    ApiWrapper.dataGet(AppUrl.city).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val.forEach((e) {
          countryCode.add(e['city_name']);
          setState(() {});
        });
      }
    });
  }

  catapi() {
    ApiWrapper.dataGet(AppUrl.cetagory).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val.forEach((e) {
          cat.add(e['cat_name']);
          setState(() {});
        });
      }
    });
  }
}
