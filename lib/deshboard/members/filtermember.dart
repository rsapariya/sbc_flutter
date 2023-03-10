// ignore_for_file: sort_child_properties_last, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sbc/deshboard/members/MemberDetails.dart';
import 'package:sbc/units/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../splaysh.dart';
import '../../units/api.dart';
import '../home.dart';

class FilterMember extends StatefulWidget {
  const FilterMember({Key? key}) : super(key: key);

  @override
  State<FilterMember> createState() => _FilterMemberState();
}

class _FilterMemberState extends State<FilterMember>
    with SingleTickerProviderStateMixin {
  @override
  var Filter = 'Name';
  TextEditingController search = TextEditingController();
  var dropdownValue = cat.first;
  bool hide = false;
  List _foundUsers = [];
  void initState() {
    _foundUsers = Userss;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = Userss.cast<Map<String, dynamic>>();
    } else {
      results = Userss.where((user) => user['username']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  void _runFilterr(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = Userss.cast<Map<String, dynamic>>();
    } else {
      results = Userss.where((user) => user['phone']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  void _runFilterk(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = Userss.cast<Map<String, dynamic>>();
    } else {
      results = Userss.where((user) => user['keywords']
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  Future<void> rfresher() async {
    return getallusers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drower(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  hide = !hide;
                });
              },
              icon: const Icon(Icons.filter_alt_outlined))
        ],
        title: Text(
          "Member List",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white)),
        ),
      ),
      // drawer: Drower(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            hide
                ? Padding(
                    padding: EdgeInsets.only(
                        top: Get.height / 60, left: Get.width / 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Filter = "Name";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Filter == "Name"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Name',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Filter == "Name"
                                            ? Colors.white
                                            : Colors.blue)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Filter = "Phone";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Filter == "Phone"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Phone',
                                style: TextStyle(
                                    color: Filter == "Phone"
                                        ? Colors.white
                                        : Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Filter = "keywords";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Filter == "keywords"
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Keywords',
                                style: TextStyle(
                                    color: Filter == "keywords"
                                        ? Colors.white
                                        : Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: 10),
              child: TextFormField(
                style: GoogleFonts.poppins(),
                // controller: code,
                autofocus: false,
                onChanged: (value) => Filter == 'Name'
                    ? _runFilter(value)
                    : Filter == "keywords"
                        ? _runFilterk(value)
                        : _runFilterr(value),

                controller: search,
                decoration: buildInputDecoration(hintText: "Search"),
              ),
            ),
            _foundUsers.isNotEmpty
                ? RefreshIndicator(
                    child: Container(
                      height: Get.height / 1.2,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                          // controller: controller,
                          itemCount: _foundUsers.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width / 30,
                                  vertical: Get.height / 80),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                  save('userdeta', _foundUsers[index]);
                                  if (kDebugMode) {

                                  }
                                  Get.to(() => const MemberDetalis());
                                },
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Get.height / 60),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.grey,
                                                backgroundImage: _foundUsers[
                                                            index]['profile'] ==
                                                        null
                                                    ? const NetworkImage(
                                                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                                      )
                                                    : NetworkImage(
                                                        'https://sbc.sgcci.in/uploads/profile/${_foundUsers[index]['profile']}'),
                                              ),
                                              SizedBox(width: Get.width / 30),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 2,
                                                    child: Text(
                                                        _foundUsers[index]
                                                                ['username'] ??
                                                            "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                  ),
                                                  _foundUsers[index][
                                                                  'business'] ==
                                                              null ||
                                                          _foundUsers[index][
                                                                  'business'] ==
                                                              ""
                                                      ? const SizedBox()
                                                      : SizedBox(
                                                          width:
                                                              Get.width / 1.5,
                                                          child: Text(
                                                            _foundUsers[index]
                                                                ['business'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                            )),
                                                          ),
                                                        ),
                                                  _foundUsers[index]
                                                              ['cat_name'] ==
                                                          null
                                                      ? const SizedBox()
                                                      : SizedBox(
                                                          width:
                                                              Get.width / 1.5,
                                                          child: Text(
                                                            _foundUsers[index]
                                                                ['cat_name'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                            )),
                                                          ),
                                                        ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
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
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    onRefresh: rfresher)
                : Center(
                    child: Text(
                      'No results found',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                      )),
                    ),
                  ),
          ],
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

  getallusers() {
    ApiWrapper.dataGet(AppUrl.GetallUsers + getdata.read('EMAIL').toString())
        .then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {
          Userss.clear();
        });
        val.forEach((e) {
          Userss.add(e);
        });
      } else {
        setState(() {
          Userss.clear();
        });
      }
    });
  }
}
