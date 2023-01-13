import 'dart:math';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/login/login.dart';
import 'package:sbc/units/api.dart';

import '../login/otp.dart';

class Forgotpass {
  Future createInitialRecord(emaill) async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    final cognitoUser = CognitoUser(emaill, userPool,
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

    var data;
    try {
      data = await cognitoUser.forgotPassword();
      ApiWrapper.showToastMessage('Code Sent.');
      Get.to(() => const verification());
      print('Code sent to $data');
      print(emaill);
    } catch (e) {
      print(e);
    }
    print('Code sent to $data');
  }
}

class conformpass {
  Future createInitialRecord(Email, String ootp, newpass) async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    final cognitoUser = CognitoUser(Email, userPool,
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    bool passwordConfirmed = false;
    try {
      print(Email);
      print(ootp);
      print(newpass);
      passwordConfirmed = await cognitoUser.confirmPassword(ootp, newpass);
      Get.offAll(() => login());
      ApiWrapper.showToastMessage("Password Updated.");
      print(e.toString());
    } catch (e) {
      print(Email.toString());
      print(ootp);
      print(newpass);
      print(e);
    }
  }
}

class NewUSer {
  Future createInitialRecord() async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

    final userAttributes = [
      AttributeArg(name: "Name"),
      AttributeArg(name: "lastname"),
    ];

    var data;
    try {
      data = await userPool.signUp(
        'somilvekariya06@gmail.com',
        'Password001',
        userAttributes: userAttributes,
      );
    } catch (e) {
      print(e);
    }
  }
}
