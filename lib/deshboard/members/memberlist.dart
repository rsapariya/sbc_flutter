// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:sbc/deshboard/home.dart';
// import 'package:sbc/deshboard/members/filtermember.dart';
// import 'package:sbc/units/customwidget.dart';
// import '../../../splaysh.dart';
//
// class Memberlist extends StatefulWidget {
//   const Memberlist({Key? key}) : super(key: key);
//
//   @override
//   State<Memberlist> createState() => _MemberlistState();
// }
//
// class _MemberlistState extends State<Memberlist> {
//   TextEditingController city = TextEditingController();
//
//   var dropdownValue = cat.first;
//   // TextEditingController city = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     // print("=============>>>>$cityname");
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Member List",
//           style: TextStyle(color: Colors.white, fontFamily: "popins"),
//         ),
//       ),
//       drawer: Drower(),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: Get.width / 30, vertical: Get.height / 60),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: Get.height / 15,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey.withOpacity(0.1),
//                 ),
//                 child: Dropdown(),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: Get.height / 80),
//                 child: TextFormField(
//                   onTap: Dropdown,
//                   style: TextStyle(
//                     fontFamily: "popins",
//                   ),
//                   controller: city,
//                   autofocus: false,
//                   // onChanged: searh,
//                   decoration: buildInputDecoration(
//                     hintText: "City",
//                     lbltext: "City",
//                     // prifix: Image.asset(
//                     //   'asstes/image/Lock.png',
//                     //   scale: 2.5,
//                     // ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: Get.height / 80),
//                 child: TextFormField(
//                   maxLines: 1,
//                   onTap: Dropdown,
//                   style: TextStyle(
//                     fontFamily: "popins",
//                   ),
//                   // controller: code,
//                   autofocus: false,
//                   decoration: buildInputDecoration(
//                     hintText: "Name",
//                     lbltext: "Name",
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: Get.height / 80),
//                 child: TextFormField(
//                   maxLines: 1,
//                   onTap: Dropdown,
//                   style: TextStyle(
//                     fontFamily: "popins",
//                   ),
//                   // controller: code,
//                   autofocus: false,
//
//                   decoration: buildInputDecoration(
//                     hintText: "Mobile Number",
//                     lbltext: "Mobile Number",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               appbutton(
//                   titel: "Search",
//                   onTap: () {
//                     setState(() {
//                       Get.to(() => FilterMember());
//                     });
//                   }),
//               SizedBox(
//                 height: 15,
//               ),
//               // SizedBox(width:100,
//               //   child: buidanimation(
//               //       "This Text is animation my name is saumil vekariya..."),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   InputDecoration buildInputDecoration({
//     String? hintText,
//     prifix,
//     surfix,
//     String? lbltext,
//   }) {
//     return InputDecoration(
//       prefixIcon: prifix,
//       suffix: surfix,
//       hintText: hintText,
//       hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
//       labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
//       labelText: lbltext,
//       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(
//           color: Colors.white,
//           width: 1,
//         ),
//       ),
//       filled: true,
//       fillColor: Colors.grey.withOpacity(0.1),
//     );
//   }
//
//   Dropdown() {
//     return Padding(
//       padding: EdgeInsets.only(left: Get.width / 30),
//       child: DropdownButton<String>(
//         style: Theme.of(context).textTheme.button,
//         value: dropdownValue,
//         icon: Icon(
//           Icons.keyboard_arrow_down,
//           size: 20,
//           color: Color(0xff828294),
//         ),
//         elevation: 1,
//         dropdownColor: Color(0xffFFFFFF),
//         underline: Container(
//           height: 0,
//         ),
//         onChanged: (String? value) {
//           setState(() {
//             dropdownValue = value!;
//             // save('cccode', dropdownValue.toString());
//           });
//         },
//         items: cat.map((value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(
//               value,
//               style: TextStyle(
//                   fontFamily: 'popins',
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400),
//             ),
//           );
//         }).toList(),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
// }
