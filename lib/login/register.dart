// ignore_for_file: sort_child_properties_last, override_on_non_overriding_member, annotate_overrides, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/Coognito/regiater.dart';
import 'package:sbc/units/api.dart';

TextEditingController emailcontroller = new TextEditingController();

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController passcontroller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  bool npaas = true;
  bool cpaas = true;
  bool student = true;
  bool medium = true;
  bool group = true;
  String sub = "a";
  bool hide = true;
  bool turms = false;
  String gender = "male";
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fullname = TextEditingController();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
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
                              ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                    ))),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Register",
              style: TextStyle(fontFamily: "popins", color: Colors.black),
            )),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height / 20,
                          ),
                          Center(
                              child: Image.asset(
                            "assets/image/splayscreen.png",
                            scale: 1.5,
                          )),
                          SizedBox(
                            height: Get.height / 20,
                          ),
                          SizedBox(
                            height: Get.height / 20,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Username';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontFamily: "popins",
                              ),
                              controller: fullname,
                              autofocus: false,
                              decoration: buildInputDecoration(
                                hintText: "Enter Your Full Name",
                                lbltext: "Enter Your Full Name",
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: emailcontroller,
                              style: const TextStyle(
                                fontFamily: "popins",
                              ),
                              autofocus: false,
                              validator: (value) => GetUtils.isEmail(value!)
                                  ? null
                                  : "Email Not Valid !",
                              decoration: buildInputDecoration(
                                hintText: "Email",
                                lbltext: "Enter Email",
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              } else {
                                //call function to check password
                                bool result = validatePassword(value);
                                if (result) {
                                  // create account event
                                  return null;
                                } else {
                                  return "Password lenth must 8 charactor like Aa@123wa";
                                }
                              }
                            },
                            controller: passcontroller,
                            style: const TextStyle(
                              fontFamily: "popins",
                            ),
                            // controller: code,
                            autofocus: false,
                            obscureText: npaas,
                            decoration: buildInputDecoration(
                              hintText: "Your Password",
                              surfix: InkWell(
                                onTap: () {
                                  setState(() {
                                    npaas = !npaas;
                                  });
                                },
                                child:
                                    const Icon(Icons.remove_red_eye_outlined),
                              ),
                              lbltext: "Your Password",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        turms = !turms;
                                      });
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          child: turms == true
                                              ? const Center(
                                                  child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                ))
                                              : const SizedBox(),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: turms == true
                                                      ? Colors.blue
                                                      : Colors.grey),
                                              color: turms == true
                                                  ? Colors.blue
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ))),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                    width: Get.width / 1.3,
                                    child: const Text(
                                        "By Countinuing you accept our Privecy policy and turms of use.",
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: "popins",
                                          fontSize: 12,
                                        )))
                              ]),
                          SizedBox(
                            height: Get.height / 40,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                Register(
                                    emailcontroller.text, passcontroller.text);
                              } else {
                                ApiWrapper.showToastMessage(
                                    'Something Went Wrong??');
                              }
                            },
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 40,
                                    ),
                                    const Text(
                                      "Register",
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
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Allredy have an account?",
                                    style: TextStyle(
                                      fontFamily: "popins",
                                      fontSize: 14,
                                    )),
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Text("Login",
                                        style: TextStyle(
                                          fontFamily: "popins",
                                          fontSize: 14,
                                          color: Colors.blue,
                                        )))
                              ]),
                          SizedBox(
                            height: Get.height / 20,
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
      suffixIcon: surfix,
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          )),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }

  // sendddd() => Sendotp().createInitialRecord();
  Register(String Email, Password) =>
      NewUSer().createInitialRecord(Email.toString(), Password.toString());
}
