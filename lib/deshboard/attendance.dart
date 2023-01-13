// ignore_for_file: annotate_overrides, sort_child_properties_last, override_on_non_overriding_member, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../units/api.dart';
import 'home.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  List Atandace = [];
  void initState() {
    getatendance();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Attendance"),
      ),
      drawer: const Drower(),
      body: Container(
        child: Atandace.isEmpty
            ? const Center(
                child: Text(
                  "Data Not Found",
                  style: TextStyle(
                      color: Colors.red, fontSize: 18, fontFamily: "popinns"),
                ),
              )
            : ListView.builder(
                // controller: controller,
                itemCount: Atandace.length,
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
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                Atandace[index]['ev_title'],
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontFamily: "popins"),
                              ),
                            ),
                            const Divider(),
                            const Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            Text(
                              Atandace[index]['ev_address'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "popins"),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            SizedBox(
                              child: Text(
                                Atandace[index]['ev_description'],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "popins"),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Date & Time",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "popins Light"),
                            ),
                            Text(
                              "${Atandace[index]['ev_date']} (${Atandace[index]['ev_start']} to ${Atandace[index]['ev_end']})",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "popins"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: Get.width / 1.5,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 4)
                                    ],
                                    color: Atandace[index]['user_attendence']
                                                .toString() ==
                                            "1"
                                        ? Colors.green
                                        : Colors.red.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20, vertical: 8),
                                  child: Center(
                                    child: Text(
                                      Atandace[index]['user_attendence']
                                                  .toString() ==
                                              '1'
                                          ? "PRESENT"
                                          : "ABSENT",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "popins"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
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

  getatendance() {

    ApiWrapper.dataGet(AppUrl.atandence).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          Atandace.clear();
        });
        val.forEach((e) {
          Atandace.add(e);
        });
      } else {
        setState(() {});
        Atandace.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }
}
