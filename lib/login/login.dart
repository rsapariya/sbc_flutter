import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbc/login/forgotpass.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/login/register.dart';
import '../aws.dart';
import '../units/validater.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final amplify = Amplify();

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                style: TextStyle(
                    fontFamily: "popins", color: Colors.blue, fontSize: 24),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              TextFormField(
                controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                validator: (value) =>
                    !validateEmail(value!) ? "Email is Invalid" : null,
                autofocus: false,
                decoration: buildInputDecoration(
                  hintText: "Email",
                  lbltext: "Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false,
                validator: (value) =>
                    value!.isEmpty ? "Password is invalid" : null,
                decoration: buildInputDecoration(
                  hintText: "Password",
                  lbltext: "Password",
                  // prifix: Image.asset(
                  //   'asstes/image/Lock.png',
                  //   scale: 2.5,
                  // ),
                ),
              ),
              SizedBox(
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
                      style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 14,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  setState(() {});
                  // ApiWrapper.showToastMessage("somil vekariya");
                  print('------------------------');
                  print('------------------------');
                  loginapi(emailcontroller.text, passwordcontroller.text);
                  Get.off(() => const home());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width / 40,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "popins"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
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
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
      hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }

  static Amplify() {}

  loginapi(String email, String password) =>
      Serveices().createInitialRecord(email, password);
}
