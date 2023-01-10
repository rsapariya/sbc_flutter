import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbc/deshboard/qrcode.dart';
import 'home.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events"),
      ),
      drawer: Drower(),
      body: Container(
        child: event.isEmpty
            ? Center(
                child: Text(
                  'No Event Found',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.red, fontSize: 20)),
                ),
              )
            : ListView.builder(
                // controller: controller,
                itemCount: event.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 30, vertical: Get.height / 80),
                    child: Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                event[index]['ev_title'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontFamily: "popins"),
                              ),
                            ),
                            Divider(),
                            Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            Text(
                              event[index]['ev_address'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "popins"),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            Text(
                              event[index]['ev_description'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "popins"),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Date & Time",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            Text(
                              "${event[index]['ev_date']} (${event[index]['ev_start']} to ${event[index]['ev_end']})",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "popins"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => QRViewExample());
                                  // event[index]['ev_status'] == "OPEN"
                                  //     ? Get.to(() => QRViewExample())
                                  //     : "";
                                },
                                child: Container(
                                  width: Get.width / 1.5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 20,
                                        vertical: 8),
                                    child: Center(
                                      child: Text(
                                        event[index]['ev_status'] == "OPEN"
                                            ? "JOIN NOW"
                                            : event[index]['ev_status'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: "popins"),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 4)
                                      ],
                                      color: event[index]['ev_status'] == "OPEN"
                                          ? Colors.green
                                          : Colors.blue,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              // offset: Offset(9,7),
                              spreadRadius: 4,
                              blurRadius: 5,
                              color: Colors.grey.withOpacity(0.1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
