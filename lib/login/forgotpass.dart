// ignore_for_file: sort_child_properties_last, camel_case_types, unnecessary_new, prefer_const_constructors_in_immutables, void_checks, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/units/api.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Coognito/regiater.dart';
import 'otp.dart';

TextEditingController email = new TextEditingController();

class forget extends StatefulWidget {
  forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  final _formKey = GlobalKey<FormState>();

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
                              ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                    ))),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Forgot password",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black)),
            )),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height / 15,
                          ),
                          Text(
                            "Enter your Email Adresss",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                          ),
                          SizedBox(
                            height: Get.height / 30,
                          ),
                          TextFormField(
                              validator: (value) => GetUtils.isEmail(value!)
                                  ? null
                                  : "Email Not Valid !",
                              style: GoogleFonts.poppins(),
                              controller: email,
                              autofocus: false,
                              decoration: buildInputDecoration(
                                hintText: "Email",
                                lbltext: "Email",
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text("Back to sign in",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                  )))),
                          const SizedBox(
                            height: 25,
                          ),
                          InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Email = email.toString();
                                  Forgot(email.text);
                                } else {
                                  return ApiWrapper.showToastMessage(
                                      'Enter Valid Email');
                                }

                                // Get.to(() => const verification());
                              },
                              child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Submit",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                                      )
                                    ]),
                                height: Get.height / 15,
                                width: Get.width / 1.8,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(40)),
                              ))
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
      hintStyle: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
      labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
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

  Forgot(String emaill) => Forgotpass().createInitialRecord(emaill.toString());
}
