// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int iconIndex = 0;
//
//   List iconName = <String>['icon1', 'icon2', 'icon3'];
//   List imagelist = <String>['icon1', 'icon2', 'icon3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: buildAppBar(appBarTitle: widget.title),
//       body: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildIconTile(0, 'red'),
//               buildIconTile(1, 'dark'),
//               buildIconTile(2, 'blue'),
//               // HeightSpacer(myHeight: kSpacing),
//
//               TextButton(onPressed: (){changeAppIcon();}, child: Text("set as app icon"))
//             ],
//           )),
//     );
//   }
//
//   Widget buildIconTile(int index, String themeTxt) => Padding(
//         padding: EdgeInsets.all(10),
//         child: GestureDetector(
//           onTap: () => setState(() => iconIndex = index),
//           child: ListTile(
//               contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
//               leading: Image.asset(
//                 imagelist[index],
//                 width: 45,
//                 height: 45,
//               ),
//               title: Text(themeTxt, style: const TextStyle(fontSize: 25)),
//               trailing: iconIndex == index
//                   ? const Icon(
//                       Icons.check_circle_rounded,
//                       color: Colors.green,
//                       size: 30,
//                     )
//                   : Icon(
//                       Icons.circle_outlined,
//                       color: Colors.grey.withOpacity(0.5),
//                       size: 30,
//                     )),
//         ),
//       );
//   changeAppIcon() async {
//     try {
//       if (await FlutterDynamicIcon.supportsAlternateIcons) {
//         await FlutterDynamicIcon.setAlternateIconName(iconName[iconIndex]);
//         debugPrint("App icon change successful");
//         return;
//       }
//     } catch (e) {
//       debugPrint("Exception: ${e.toString()}");
//     }
//     debugPrint("Failed to change app icon ");
//
// }}
