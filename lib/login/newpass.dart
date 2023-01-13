// ignore_for_file: sort_child_properties_last, annotate_overrides, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/login/forgotpass.dart';
import 'package:sbc/units/api.dart';
import '../Coognito/regiater.dart';
import 'otp.dart';

class newpass extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  newpass({Key? key}) : super(key: key);

  @override
  State<newpass> createState() => _newpassState();
}

class _newpassState extends State<newpass> {
  TextEditingController newpass = TextEditingController();
  TextEditingController conpass = TextEditingController();
  @override
  bool pass = true;
  bool npass = true;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Get.height / 18,
                    width: Get.width / 8,
                    child: const Center(
                        child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                  ))),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "New password",
            style: TextStyle(fontFamily: "popins", color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        height: Get.height / 15,
                      ),
                      const Text(
                        "Enter new password",
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontFamily: "popins",
                        ),
                        controller: newpass,
                        autofocus: false,
                        onTap: () {
                          setState(() {
                            pass = !pass;
                          });
                        },
                        obscureText: pass,
                        decoration: buildInputDecoration(
                          hintText: "New Password",
                          lbltext: "New Password",
                          surfix: const Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontFamily: "popins",
                        ),
                        // controller: code,
                        autofocus: false,
                        controller: conpass,
                        onTap: () {
                          setState(() {
                            npass = !npass;
                          });
                        },
                        obscureText: npass,
                        decoration: buildInputDecoration(
                          hintText: "conform Password",
                          lbltext: "conform Password",
                          surfix: const Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                          onTap: () {
                            conpass.text == newpass.text
                                ? confo(
                                    email.text, OTP.toString(), newpass.text)
                                : ApiWrapper.showToastMessage(
                                    "Password Don't Metch!!");
                          },
                          child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "popins"),
                                  )
                                ]),
                            height: Get.height / 15,
                            width: Get.width / 1.8,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(40)),
                          )),
                      SizedBox(
                        height: Get.height / 10,
                      )
                    ])))));
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    prifix,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: prifix,
      suffix: surfix,
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }

  confo(String email, String ootp, newpass) =>
      conformpass().createInitialRecord(
          email.toString(), ootp.toString(), newpass.toString());
}
