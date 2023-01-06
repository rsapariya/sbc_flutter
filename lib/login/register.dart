import 'package:flutter/material.dart';
import 'package:get/get.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
  // TextEditingController aa = TextEditingController();
  // TextEditingController bb = TextEditingController();
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
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
        title: Text(
          "Register",
          style: TextStyle(fontFamily: "popins", color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              TextFormField(
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false,
                decoration: buildInputDecoration(
                  hintText: "Enter Your Full Name",
                  lbltext: "Enter Your Full Name",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false,
                decoration: buildInputDecoration(
                  hintText: "Email",
                  lbltext: "Enter Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
                    child: Icon(Icons.remove_red_eye_outlined),
                  ),
                  lbltext: "Your Password",
                ),
              ),
              SizedBox(
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
                      padding: EdgeInsets.only(top: 8),
                      child: Container(
                        height: 15,
                        width: 15,
                        child: turms == true
                            ? Center(
                                child: Icon(
                                  Icons.done,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    turms == true ? Colors.blue : Colors.grey),
                            color: turms == true ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: Get.width / 1.3,
                    child: Text(
                      "By Countinuing you accept our Privecy policy and turms of use.",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              InkWell(
                onTap: () async {
                  // registerapoo(aa.text, bb.text);
                  // Get.offAll(() => home());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width / 40,
                      ),
                      Text(
                        "Register",
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
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Allredy have an account?",
                    style: TextStyle(
                      fontFamily: "popins",
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 20,
              ),
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
      suffixIcon: surfix,
      hintText: hintText,
      hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
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
}
