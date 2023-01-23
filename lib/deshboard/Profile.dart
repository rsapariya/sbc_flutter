// ignore_for_file: deprecated_member_use, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/customwidget.dart';
import 'package:sbc/units/storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'home.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
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
  final ImagePicker _picker = ImagePicker();
  void initState() {
    Fname.text = getdata.read('User')['name'];
    Lname.text = getdata.read('User')['lname'];
    Email.text = getdata.read('User')['email'];
    Phone.text = getdata.read('User')['phone'];
    Date.text = getdata.read('User')['birthdate'];
    sDate.text = getdata.read('User')['anniversary'];
    Pcode.text = getdata.read('User')['postalcode'];
    Address.text = getdata.read('User')['address'];
    Achivments.text = getdata.read('User')['achievements'];
    Business.text = getdata.read('User')['business'];
    Website.text = getdata.read('User')['website'];
    Businessinfo.text = getdata.read('User')['business_info'];
    BusinessWhatt.text = getdata.read('User')['whatsapp'];
    Businessadd.text = getdata.read('User')['business_address'];
    Fb.text = getdata.read('User')['facebook'];
    Insta.text = getdata.read('User')['instagram'];
    Linkdin.text = getdata.read('User')['linkedin'];
    Twiter.text = getdata.read('User')['twitter'];
    Googlemap.text = getdata.read('User')['google_map'];
    Keywords.text = getdata.read('User')['keywords'];

    super.initState();
  }

  @override
  bool Lodin = false;
  PickedFile? imageFile;

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      // ignore: unnecessary_cast
      imageFile = pickedFile as PickedFile?;
      profileuplode();
    });
  }

  var member = getdata.read('User')['gender'];
  var date;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: !Lodin
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 40, vertical: Get.width / 40),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: getdata.read('User')['profile'] !=
                                    null
                                ? NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    "https://sbc.sgcci.in/uploads/profile/" +
                                        getdata.read('User')['profile'])
                                : NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                            radius: 40,
                          ),
                        ),
                        Text(
                          getdata.read('User')['name'] +
                              getdata.read('User')['lname'],
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                        ),
                        Text(
                          'About',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )),
                        ),
                        Text(
                          getdata.read('User')['role_type'],
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        TextFormField(
                          style: GoogleFonts.poppins(),
                          controller: Fname,
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
                          decoration: buildInputDecoration(
                            hintText: "Last Name",
                            lbltext: "Last Name",
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        TextFormField(
                          readOnly: true,
                          // controller: emailcontroller,
                          style: GoogleFonts.poppins(),
                          controller: Email,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Phone,
                          autofocus: false,
                          keyboardType: TextInputType.phone,
                          decoration: buildInputDecoration(
                            hintText: "Phone No.",
                            lbltext: "Phone No.",
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  member = "Male";
                                });
                              },
                              child: Container(
                                height: Get.height / 25,
                                decoration: BoxDecoration(
                                    color: member == "Male"
                                        ? Colors.blue
                                        : Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      "Male",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: member == "Male"
                                                  ? Colors.white
                                                  : Colors.blue)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  member = "Female";
                                });
                              },
                              child: Container(
                                height: Get.height / 25,
                                decoration: BoxDecoration(
                                    color: member == "Female"
                                        ? Colors.blue
                                        : Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      "Female",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: member == "Female"
                                                  ? Colors.white
                                                  : Colors.blue)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        TextFormField(
                          style: GoogleFonts.poppins(),
                          autofocus: false,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                Date.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                          controller: Date,
                          decoration: buildInputDecoration(
                              hintText: "Birthdate",
                              lbltext: "Birthdate",
                              prifix: const Icon(Icons.calendar_month_sharp)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "   yyyy-MM-dd",
                              style: GoogleFonts.poppins(
                                  textStyle: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        TextFormField(
                          style:
                              GoogleFonts.poppins(textStyle: const TextStyle()),
                          controller: sDate,
                          autofocus: false,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                sDate.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                          decoration: buildInputDecoration(
                              hintText: "Anniversry",
                              lbltext: "Anniversry",
                              prifix: const Icon(Icons.calendar_month_sharp)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "   yyyy-MM-dd",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        TextFormField(
                          // controller: emailcontroller,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          )),
                          controller: Pcode,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Address,
                          autofocus: false,
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
                          // controller: code,
                          autofocus: false,
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
                          // controller: code,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Website,
                          autofocus: false,
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
                          // controller: code,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Businessadd,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          // controller: code,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          // controller: code,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Insta,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Linkdin,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Twiter,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          controller: Googlemap,
                          autofocus: false,
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
                          style: GoogleFonts.poppins(),
                          maxLines: 3,
                          controller: Keywords,
                          autofocus: false,
                          decoration: buildInputDecoration(
                            hintText: "KeyWords",
                            lbltext: "KeyWords",
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                        appbutton(
                            onTap: () {
                              setState(() {});
                              Lodin = true;
                              UpdateUserapi();
                            },
                            titel: "Update"),
                        SizedBox(
                          height: Get.height / 60,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: Get.width / 2),
                      child: IconButton(
                          onPressed: () {
                            takePhoto(ImageSource.gallery);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    )
                  ])),
            )
          : const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: null,
                strokeWidth: 3.0,
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

  UpdateUserapi() async {
    var headers = {'Cookie': 'PHPSESSID=96e5eb5258d6ea9e422f81c683fea5f8'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://sbc.sgcci.in/api-old/updateUser/${getdata.read('EMAIL').toString()}'));
    request.fields.addAll({
      'name': Fname.text,
      "lname": Lname.text,
      // "profile": imageFile!.path,
      "birthdate": Date.text,
      "anniversary": sDate.text,
      "postalcode": Pcode.text,
      "address": Address.text,
      "achievements": Achivments.text,
      "business": Business.text,
      "website": Website.text,
      "business_info": Businessinfo.text,
      "business_address": Businessadd.text,
      "whatsapp": BusinessWhatt.text,
      "facebook": Fb.text,
      "instagram": Insta.text,
      "twitter": Twiter.text,
      "linkedin": Linkdin.text,
      "google_map": Googlemap.text,
      "keywords": Keywords.text,
      "gender": member.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        Lodin = false;
      });
      Get.off(() => const home());
      ApiWrapper.showToastMessage("Profile Update Succesfuly.");
    } else {
      setState(() {
        Lodin = false;
      });
      ApiWrapper.showToastMessage("Something Went Wrong!!");
    }
  }

  profileuplode() async {
    var headers = {'Cookie': 'PHPSESSID=1dfd04b2e90396cdff14902457261edf'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sbc.sgcci.in/api-old/profile'));
    request.fields.addAll({'email': getdata.read('EMAIL').toString()});
    request.files.add(await http.MultipartFile.fromPath(
        'profile', imageFile!.path.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.off(() => const home());
      ApiWrapper.showToastMessage("Profile Update Succesfuly.");
    } else {}
  }
}
