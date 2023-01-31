// ignore_for_file: unnecessary_import, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sbc/units/storage.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetalis extends StatefulWidget {
  const MemberDetalis({Key? key}) : super(key: key);

  @override
  State<MemberDetalis> createState() => _MemberDetalisState();
}

var url;

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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 40, vertical: Get.width / 40),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: getdata.read('userdeta')['profile'] == null
                      ? const NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                        )
                      : NetworkImage(
                          'https://sbc.sgcci.in/uploads/profile/${getdata.read('userdeta')['profile']}'),
                ),
              ),
              Text(
                getdata.read('userdeta')['username'],
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 16)),
              ),
              Text(
                'About',
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              Text(
                getdata.read('userdeta')['role_type'],
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
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
                style: GoogleFonts.poppins(),
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
                style: GoogleFonts.poppins(),
                onTap: () {
                  emaiollaunch();
                },
                controller: Email,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                    hintText: "Email",
                    lbltext: "Email",
                    prifix: Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
                controller: Phone,
                onTap: () {
                  _makingPhoneCall();
                },
                autofocus: false,
                readOnly: true,
                keyboardType: TextInputType.phone,
                decoration: buildInputDecoration(
                    hintText: "Phone No.",
                    lbltext: "Phone No.",
                    prifix: Icon(
                      Icons.call,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
                controller: Date,
                autofocus: false,
                readOnly: true,
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
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
                controller: sDate,
                autofocus: false,
                readOnly: true,
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
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
                controller: Pcode,
                autofocus: false,
                readOnly: true,
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
                style: GoogleFonts.poppins(),
                controller: Address,
                autofocus: false,
                readOnly: true,
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
                style: GoogleFonts.poppins(),
                autofocus: false,
                readOnly: true,
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
                style: GoogleFonts.poppins(),
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Business",
                  lbltext: "Business",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  setState(() {});
                  if (Website.text.isNotEmpty) {
                    url = Website.text;
                    launchURL(url);
                  }
                },
                style: GoogleFonts.poppins(),
                controller: Website,
                autofocus: false,
                readOnly: true,
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
                style: GoogleFonts.poppins(),
                autofocus: false,
                readOnly: true,
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
                style: GoogleFonts.poppins(),
                controller: Businessadd,
                autofocus: false,
                readOnly: true,
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
                onTap: () {
                  if (BusinessWhatt.text.isNotEmpty) {
                    _wahtt();
                  }
                },
                controller: BusinessWhatt,
                style: GoogleFonts.poppins(),
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  prifix: Icon(
                    Icons.whatsapp,
                    color: Colors.green,
                  ),
                  hintText: "Business Whattsapp",
                  lbltext: "Business Whattsapp",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  if (Fb.text.isNotEmpty) {
                    url = Fb.text;
                    launchURL(url);
                  }
                },
                controller: Fb,
                style: GoogleFonts.poppins(),
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Facebook Link",
                  lbltext: "Facebook Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  setState(() {});
                  if (Insta.text.isNotEmpty) {
                    url = Insta.text;
                    launchURL(url);
                  }
                },
                style: GoogleFonts.poppins(),
                controller: Insta,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Intagram Link",
                  lbltext: "Intagram Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  setState(() {});
                  if (Linkdin.text.isNotEmpty) {
                    url = Linkdin.text;
                    launchURL(url);
                  }
                },
                style: GoogleFonts.poppins(),
                controller: Linkdin,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Linkedin Link",
                  lbltext: "Linkedin Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  setState(() {});
                  if (Twiter.text.isNotEmpty) {
                    url = Twiter.text;
                    launchURL(url);
                  }
                },
                style: GoogleFonts.poppins(),
                controller: Twiter,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Twitter Link",
                  lbltext: "Twitter Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                onTap: () {
                  setState(() {});
                  if (Googlemap.text.isNotEmpty) {
                    url = Googlemap.text;
                    launchURL(url);
                  }
                },
                style: GoogleFonts.poppins(),
                controller: Googlemap,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "Google Map Link",
                  lbltext: "Google Map Link",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              TextFormField(
                style: GoogleFonts.poppins(),
                maxLines: 3,
                controller: Keywords,
                autofocus: false,
                readOnly: true,
                decoration: buildInputDecoration(
                  hintText: "KeyWords",
                  lbltext: "KeyWords",
                ),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: Get.height / 6,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: getdata.read('userdeta')['biz_img1'] != "" ||
                                    getdata.read('userdeta')['biz_img1'] != null
                                ? NetworkImage("https://sbc.sgcci.in/" +
                                    getdata.read('userdeta')['biz_img1'])
                                : NetworkImage(
                                    'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-picture-icon-editable-line-vector-no-image-no-photo-available-or-no-picture-for-your-website-or-m.jpg'))),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: getdata.read('userdeta')['biz_img2'] != "" ||
                                    getdata.read('userdeta')['biz_img2'] != null
                                    ? NetworkImage("https://sbc.sgcci.in/" +
                                    getdata.read('userdeta')['biz_img2'])
                                    : NetworkImage(
                                    'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-picture-icon-editable-line-vector-no-image-no-photo-available-or-no-picture-for-your-website-or-m.jpg'))),
                      )),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: getdata.read('userdeta')['biz_img3'] != "" ||
                                    getdata.read('userdeta')['biz_img3'] != null
                                    ? NetworkImage("https://sbc.sgcci.in/" +
                                    getdata.read('userdeta')['biz_img3'])
                                    :const NetworkImage(
                                    'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-picture-icon-editable-line-vector-no-image-no-photo-available-or-no-picture-for-your-website-or-m.jpg'))),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: getdata.read('userdeta')['biz_img4'] != "" ||
                                    getdata.read('userdeta')['biz_img4'] != null
                                    ? NetworkImage("https://sbc.sgcci.in/" +
                                    getdata.read('userdeta')['biz_img4'])
                                    : NetworkImage(
                                    'https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-picture-icon-editable-line-vector-no-image-no-photo-available-or-no-picture-for-your-website-or-m.jpg'))),
                      )),
                ],
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
      disabledBorder: InputBorder.none,
      hintText: hintText,
      focusColor: Colors.transparent,
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
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }

  _makingPhoneCall() async {
    String num = Phone.text;
    if (num.toString().length == 10) {
      var url = Uri.parse("tel:+91$num");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      var url = Uri.parse("tel:$num");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  _wahtt() async {
    String number = BusinessWhatt.text;

    final Uri uri = number.toString().length == 10
        ? Uri.parse("whatsapp://send?phone=" + "91" + number)
        : Uri.parse("whatsapp://send?phone=" + number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("error");
      throw "ERROR ";
    }
  }

  emaiollaunch() async {
    String email = Email.text;
    launch('mailto:$email');
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
