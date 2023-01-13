// ignore_for_file: annotate_overrides, override_on_non_overriding_member, non_constant_identifier_names, camel_case_types, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/login/forgotpass.dart';
import 'package:sbc/login/register.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';
import '../Coognito/awsregister.dart';

String? UserID;
String? EmailID;
String? Message;

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  bool loding = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(fontFamily: "popins", color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: !loding
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.always,
                        // key: formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height / 20,
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/image/splayscreen.png",
                                  scale: 1.5,
                                ),
                              ),
                              SizedBox(
                                height: Get.height / 20,
                              ),
                              const Text(
                                "Welcome",
                                style: TextStyle(
                                    fontFamily: "popins",
                                    color: Colors.blue,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                height: Get.height / 20,
                              ),
                              TextFormField(
                                  controller: emailcontroller,
                                  style: const TextStyle(
                                    fontFamily: "popins",
                                  ),
                                  validator: (value) => GetUtils.isEmail(value!)
                                      ? null
                                      : "Email Not Valid !",
                                  autofocus: false,
                                  decoration: buildInputDecoration(
                                    hintText: "Email",
                                    lbltext: "Email",
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  controller: passwordcontroller,
                                  style: const TextStyle(
                                    fontFamily: "popins",
                                  ),
                                  autofocus: false,
                                  decoration: buildInputDecoration(
                                    hintText: "Password",
                                    lbltext: "Password",
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.to(() => forget());
                                        },
                                        child: const Text(
                                          "Forgot your password?",
                                          style: TextStyle(
                                              fontFamily: "popins",
                                              fontSize: 14,
                                              color: Colors.blue),
                                        ))
                                  ]),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {});
                                      EmailID = emailcontroller.toString();
                                      save('EmailID',
                                          emailcontroller.text.toString());
                                      UserID = null;

                                      login(emailcontroller.text,
                                          passwordcontroller.text);
                                    } else {
                                      ApiWrapper.showToastMessage(
                                          'Enter Valid Email??');
                                    }
                                  },
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: Get.width / 40,
                                          ),
                                          const Text(
                                            "Login",
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
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  )),
                              SizedBox(
                                height: Get.height / 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account yet?",
                                      style: TextStyle(
                                        fontFamily: "popins",
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.to(() => register());
                                        },
                                        child: const Text("Register",
                                            style: TextStyle(
                                              fontFamily: "popins",
                                              fontSize: 14,
                                              color: Colors.blue,
                                            )))
                                  ])
                            ]))))
            : const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: null,
                strokeWidth: 3.0,
              )));
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

  login(String email, String password) =>
      AWSServices().createInitialRecord(email.toString(), password.toString());
}
