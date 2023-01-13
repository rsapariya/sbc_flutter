// ignore_for_file: sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            title: const Text(
              "Forgot password",
              style: TextStyle(fontFamily: "popins", color: Colors.black),
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
                          const Text(
                            "Enter your Email Adresss",
                            style: TextStyle(
                              fontFamily: "popins Medium",
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 30,
                          ),
                          TextFormField(
                              validator: (value) => GetUtils.isEmail(value!)
                                  ? null
                                  : "Email Not Valid !",
                              style: const TextStyle(
                                fontFamily: "popins",
                              ),
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
                              child: const Text("Back to sign in",
                                  style: TextStyle(
                                    fontFamily: "popins",
                                    fontSize: 14,
                                  ))),
                          const SizedBox(
                            height: 25,
                          ),
                          InkWell(
                              onTap: () {
                                Email = email.toString();
                                Forgot(email.text);
                                // Get.to(() => const verification());
                              },
                              child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
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

  Forgot(String emaill) => Forgotpass().createInitialRecord(emaill.toString());
}
