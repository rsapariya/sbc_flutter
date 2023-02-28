// ignore_for_file: annotate_overrides, override_on_non_overriding_member, non_constant_identifier_names, camel_case_types, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/login/forgotpass.dart';
import 'package:sbc/login/register.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';
import '../Coognito/awsregister.dart';
import 'package:google_fonts/google_fonts.dart';

// String? UserID;
// String? EmailID;
String? Message;

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  bool loding = false;
  bool npass = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  void initState() {
    print("--------------------------------");
    save('LoginLoding', false);
    save('EMAIL', 'aaaa');
    setState(() {});
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
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black)),
          ),
        ),
        backgroundColor: Colors.white,
        body: getdata.read('LoginLoding') == false
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                        key: _formKey,
                        // autovalidateMode: AutovalidateMode.always,
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
                              Text(
                                "Welcome",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.blue, fontSize: 24)),
                              ),
                              SizedBox(
                                height: Get.height / 20,
                              ),
                              TextFormField(
                                  controller: emailcontroller,
                                  style: GoogleFonts.poppins(),
                                  validator: (value) => GetUtils.isEmail(value!)
                                      ? null
                                      : "Email Not Valid !",
                                  autofocus: false,
                                  decoration: buildInputDecoration(
                                    prifix: Icon(Icons.email_outlined),
                                    hintText: "Email",
                                    lbltext: "Email",
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Password!!';
                                    }
                                    return null;
                                  },
                                  controller: passwordcontroller,
                                  style: GoogleFonts.poppins(),
                                  autofocus: false,
                                  obscureText: npass,
                                  decoration: buildInputDecoration(
                                    hintText: "Password",
                                    lbltext: "Password",
                                    prifix: InkWell(
                                      child: npass == true
                                          ? Icon(Icons.remove_red_eye_outlined)
                                          : Icon(Icons.remove_red_eye),
                                      onTap: () {
                                        setState(() {
                                          npass = !npass;
                                        });
                                      },
                                    ),
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
                                        child: Text(
                                          "Forgot your password?",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue)),
                                        ))
                                  ]),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                  onTap: () {
                                    print(
                                        ">>>>>>>>>>>>${getdata.read('EMAIL')}");

                                    if (_formKey.currentState!.validate()) {
                                      print(
                                          ">>>>>>>>>>>>${getdata.read('EMAIL')}");

                                      setState(() {
                                        print('.......................');
                                        print(getdata.read('EMAIL'));
                                        login(emailcontroller.text,
                                            passwordcontroller.text);
                                        save('LoginLoding', true);
                                      });
                                      // EmailID = emailcontroller.toString();

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
                                          Text(
                                            "Login",
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
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  )),
                              SizedBox(
                                height: Get.height / 10,
                              ),
                            ]))))
            : const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: null,
                strokeWidth: 3,
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
      // focusedBorder: OutlineInputBorder(),
      focusColor: Colors.red,
      hintStyle: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
      labelStyle: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
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
