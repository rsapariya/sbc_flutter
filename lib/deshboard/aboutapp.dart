// ignore_for_file: annotate_overrides, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/qrcode.dart';
import 'package:sbc/units/storage.dart';
import 'home.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 3,
              ),
              Center(
                child: Image.asset(
                  'assets/image/splayscreen.png',
                  scale: 1.5,
                ),
              ),
              SizedBox(
                height: Get.height / 3,
              ),
              Text(
                'Version 0.0.${getdata.read('varsion')}',
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
