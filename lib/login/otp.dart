// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sbc/units/api.dart';

import 'newpass.dart';

bool submit = false;
var Email;
var OTP;

class verification extends StatefulWidget {
  const verification({Key? key}) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  @override
  void initState() {
    submit = false;
    OTP = null;
    super.initState();
  }

  @override
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
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
          "Verification",
          style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 15,
              ),
               Text(
                "We have sent a 4 digit OTP to",
                style:GoogleFonts.poppins(textStyle: const  TextStyle(
                  fontSize: 18,
                ))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "test123@gmail.com",
                    style:GoogleFonts.poppins(textStyle: const TextStyle(
                      fontSize: 18,
                    ))
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Edit Email",
                      style: GoogleFonts.poppins(textStyle:const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              PinPut(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "Gilroy Bold",
                    fontSize: Get.height / 40),
                fieldsCount: 6,
                eachFieldWidth: Get.width / 8,
                withCursor: false,
                submittedFieldDecoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),

                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border.all(color: notifire.getgreycolor.withOpacity(0.4)),
                ).copyWith(
                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border.all(color: notifire.getgreycolor.withOpacity(0.4)),
                ),
                selectedFieldDecoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border.all(color: notifire.getgreycolor.withOpacity(0.4)),
                ),
                followingFieldDecoration: BoxDecoration(
                  // border: Border.all(color: notifire.getgreycolor.withOpacity(0.4)),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ).copyWith(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.5),
                ),
                onSubmit: (pin) async {
                  setState(() {});
                  submit = true;
                  OTP = pin.toString();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "If you don't recive code",
                    style: GoogleFonts.poppins(textStyle: const TextStyle(
                      fontSize: 14,
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child:  Text(
                      "Resend",
                      style:GoogleFonts.poppins(textStyle: const  TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),)
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  print(OTP);
                  submit == true
                      ? Get.to(() => newpass())
                      : ApiWrapper.showToastMessage('Enter OTP');
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Submit",
                        style:GoogleFonts.poppins(textStyle: const  TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                      ),
                    ],
                  ),
                  height: Get.height / 15,
                  width: Get.width / 1.8,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    IconData? icon,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blue),
      suffix: surfix,
      hintText: hintText,
      hintStyle:GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
      labelStyle:GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
