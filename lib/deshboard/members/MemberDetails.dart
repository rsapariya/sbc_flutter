import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:sbc/units/storage.dart';

class MemberDetalis extends StatefulWidget {
  const MemberDetalis({Key? key}) : super(key: key);

  @override
  State<MemberDetalis> createState() => _MemberDetalisState();
}

class _MemberDetalisState extends State<MemberDetalis> {
  @override
  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController Pcode = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Achivments = TextEditingController();
  TextEditingController Business = TextEditingController();
  TextEditingController Website = TextEditingController();
  TextEditingController BusinessWhatt = TextEditingController();
  TextEditingController Businessadd = TextEditingController();
  TextEditingController Fb = TextEditingController();
  TextEditingController Insta = TextEditingController();
  TextEditingController Linkdin = TextEditingController();
  TextEditingController Twiter = TextEditingController();
  TextEditingController Googlemap = TextEditingController();
  TextEditingController Keywords = TextEditingController();
  TextEditingController Businessinfo = TextEditingController();
  void initState() {
    Fname.text = getdata.read('userdeta')['name'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['name'].toString();
    Lname.text = getdata.read('userdeta')['lname'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['lname'].toString();
    Email.text = getdata.read('userdeta')['email'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['email'].toString();
    Phone.text = getdata.read('userdeta')['phone'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['phone'].toString();
    Date.text = getdata.read('userdeta')['birthdate'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['birthdate'].toString();
    sDate.text = getdata.read('userdeta')['anniversary'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['anniversary'].toString();
    Pcode.text = getdata.read('userdeta')['postalcode'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['postalcode'].toString();
    Address.text = getdata.read('userdeta')['address'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['address'].toString();
    Achivments.text =
        getdata.read('userdeta')['achievements'].toString() == 'null'
            ? ""
            : getdata.read('userdeta')['achievements'].toString();
    Business.text = getdata.read('userdeta')['business'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['business'].toString();
    Website.text = getdata.read('userdeta')['website'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['website'].toString();
    Businessinfo.text =
        getdata.read('userdeta')['business_info'].toString() == 'null'
            ? ""
            : getdata.read('userdeta')['business_info'].toString();
    BusinessWhatt.text =
        getdata.read('userdeta')['whatsapp'].toString() == 'null'
            ? ""
            : getdata.read('userdeta')['whatsapp'].toString();
    Businessadd.text =
        getdata.read('userdeta')['business_address'].toString() == 'null'
            ? ""
            : getdata.read('userdeta')['business_address'].toString();
    Fb.text = getdata.read('userdeta')['facebook'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['facebook'].toString();
    Insta.text = getdata.read('userdeta')['instagram'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['instagram'].toString();
    Linkdin.text = getdata.read('userdeta')['linkedin'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['linkedin'].toString();
    Twiter.text = getdata.read('userdeta')['twitter'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['twitter'].toString();
    Googlemap.text = getdata.read('userdeta')['google_map'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['google_map'].toString();
    Keywords.text = getdata.read('userdeta')['keywords'].toString() == 'null'
        ? ""
        : getdata.read('userdeta')['keywords'].toString();
    super.initState();
  }

  @override
  var member = getdata.read('userdeta')['gender'].toString();
  var date;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontFamily: "popins"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 40, vertical: Get.width / 40),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: getdata.read('userdeta')['profile'] == null
                      ? NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                        )
                      : NetworkImage(
                          'https://sbc.sgcci.in/uploads/profile/${getdata.read('userdeta')['profile']}'),
                ),
              ),
              Text(
                getdata.read('userdeta')['username'],
                style: TextStyle(
                    color: Colors.black, fontSize: 16, fontFamily: "popins"),
              ),
              Text(
                'About',
                style: TextStyle(
                    color: Colors.grey, fontSize: 14, fontFamily: "popins"),
              ),
              Text(
                getdata.read('userdeta')['role_type'],
                style: TextStyle(
                    color: Colors.black, fontSize: 16, fontFamily: "popins"),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Fname,
                readOnly: true,
                autofocus: false,
                decoration: buildInputDecoration(
                  hintText: "First Name",
                  lbltext: "First Name",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: Lname,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Last Name",
                  lbltext: "Last Name",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Email,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Email",
                  lbltext: "Email",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Phone,
                autofocus: false, readOnly: true,
                keyboardType: TextInputType.phone,
                decoration: buildInputDecoration(
                  hintText: "Phone No.",
                  lbltext: "Phone No.",
                ),
              ),
              // SizedBox(
              //   height: Get.height / 60,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       height: Get.height / 25,
              //       width: Get.width / 3.5,
              //       decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.circular(30)),
              //       child: Center(
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 20),
              //           child: Text(
              //             member,
              //             style: TextStyle(
              //                 fontFamily: 'popins', color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Date,
                autofocus: false, readOnly: true,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  hintText: "Birthdate",
                  lbltext: "Birthdate",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "   yyyy-MM-dd",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: sDate,
                autofocus: false, readOnly: true,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  hintText: "Eniversry",
                  lbltext: "Eniversry",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "   yyyy-MM-dd",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Pcode,
                autofocus: false, readOnly: true,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  hintText: "Postal Code",
                  lbltext: "Postal Code",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Address,
                autofocus: false, readOnly: true,
                maxLines: 3,
                decoration: buildInputDecoration(
                  hintText: "Address",
                  lbltext: "Address",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: Achivments,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false, readOnly: true,
                maxLines: 3,
                decoration: buildInputDecoration(
                  hintText: "Achievements",
                  lbltext: "Achievements",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: Business,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Business",
                  lbltext: "Business",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Website,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Website",
                  lbltext: "Website",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: Businessinfo,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false, readOnly: true,
                maxLines: 3,
                decoration: buildInputDecoration(
                  hintText: "Business Info",
                  lbltext: "Business Info",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Businessadd,
                autofocus: false, readOnly: true,
                maxLines: 3,
                decoration: buildInputDecoration(
                  hintText: "Business Address",
                  lbltext: "Business Address",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: BusinessWhatt,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Business Whattsapp",
                  lbltext: "Business Whattsapp",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                controller: Fb,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Facebook Link",
                  lbltext: "Facebook Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Insta,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Intagram Link",
                  lbltext: "Intagram Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Linkdin,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Linkdin Link",
                  lbltext: "Linkdin Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Twiter,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Twitter Link",
                  lbltext: "Twitter Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                controller: Googlemap,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Google Map Link",
                  lbltext: "Google Map Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                // controller: emailcontroller,
                style: TextStyle(
                  fontFamily: "popins",
                ),
                maxLines: 3,
                controller: Keywords,
                autofocus: false, readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "KeyWords",
                  lbltext: "KeyWords",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
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
      suffix: surfix,
      // border: InputBorder.none,,
      // enabledBorder: InputBorder.none,
      // errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: hintText,
      focusColor: Colors.transparent,
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
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
