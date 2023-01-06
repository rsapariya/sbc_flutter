import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

var id;

class ApiWrapper {
  static var headers = {
    'x-api-key': '11a4046a-88f5-4530-a354-0098ccfc77ff',
    'Cookie': 'PHPSESSID=afabc7af98fb08c41619f3448a8e2954'
  };
  static doImageUpload(
      String endpoint, Map<String, String> params, List imgs) async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.atandence));
    request.fields.addAll(params);
    for (int i = 0; i < imgs.length; i++) {
      log(imgs[i].toString(), name: "Image name $i");
      request.files.add(await http.MultipartFile.fromPath('image$i', imgs[i]));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var model = await response.stream.bytesToString();
    return jsonDecode(model);
  }

  static showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static dataPost(appUrl, method) async {
    try {
      var url = Uri.parse(appUrl);
      print(url);
      print(method);
      var request =
          await http.post(url, headers: headers, body: jsonEncode(method));
      var response = jsonDecode(request.body);
      print("response----- $response");
      if (request.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return e;
      print("Exeption----- $e");
    }
  }

  static dataGet(appUrl) async {
    try {
      var url = Uri.parse(appUrl);
      var request = await http.get(url, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
        print(request.reasonPhrase);
      }
    } catch (e) {
      return e;
    }
  }

  static dataGetLocation(appUrl) async {
    try {
      var request = await http.get(appUrl, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
        print(request.reasonPhrase);
      }
    } catch (e) {
      print("Exeption----- $e");
    }
  }
}

class AppUrl {
  static const String baseurl = 'https://sbc.sgcci.in/api-old/';
  static const String Imageurl = 'https://sbc.sgcci.in/uploads/profile/';
  static const String dashbord = baseurl + 'getDashboard/287';
  static const String city = baseurl + 'getCity';
  static const String cetagory = baseurl + 'getCategories';
  static const String Rbuiss = baseurl + 'getRecievedBusiness/287';
  static const String Gbuiss = baseurl + 'getGivenBusiness/287';
  static const String addbusiness = baseurl + 'addBusinessRecieved';
  static const String getusers = baseurl + 'getUsers/tushardesai4981@gmail.com';
  static const String getgivenraf = baseurl + 'getGivenReferral/287';
  static const String getreciveraf = baseurl + 'getRecievedReferral/287';
  static const String visitors = baseurl + 'getUserVisitors/287';
  static const String facetoface = baseurl + 'getGivenOTO/287';
  static const String deleteface = baseurl + 'deleteOTO/';
  static const String eventsss = baseurl + 'getChapterEvents/1/287';
  static const String atandence = baseurl + 'getAttendence/1/287';
  static const String GetallUsers =
      baseurl + 'getUsers/tushardesai4981@gmail.com';
  static const String GetUser =
      baseurl + 'getUserProfile/tushardesai4981@gmail.com';
}
