import 'dart:math';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/login/login.dart';
import 'package:sbc/login/register.dart';
import 'package:sbc/units/api.dart';

import '../login/forgotpass.dart';
import '../login/newOTP.dart';
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
  Future createInitialRecord(email, pass) async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    var data;
    try {
      print('---------   register    ----------');
      print(email.toString());
      print(pass.toString());
      data = await userPool.signUp(email.toString(), pass.toString());

      // Get.to(() => newotp());
    } catch (e) {
      print('---------   else  ----------');
      print(email.toString());
      print(pass.toString());
      print(e);
    }
  }
}

class Sendotp {
  Future createInitialRecord() async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

    final cognitoUser = CognitoUser('sheetalchotaliya1@gmail.com', userPool,
        clientSecret: '1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib');
    final String status;
    try {
      print("----------  send otp    --------");
      status = await cognitoUser.resendConfirmationCode();
      ApiWrapper.showToastMessage("OTP Sent.");
    } catch (e) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.toString());
    }
  }
}

class conformnew {
  Future createInitialRecord() async {
    final userPool = CognitoUserPool(
        'ap-south-1_sibAO5sKY', '292k0u072s6v0i4esbefrfogoq',
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

    final cognitoUser = CognitoUser(emailcontroller.text, userPool,
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

    bool registrationConfirmed = false;
    try {
      registrationConfirmed = await cognitoUser.confirmRegistration('920328');

      ApiWrapper.showToastMessage("Comform Email");
      Get.offAll(() => login());
    } catch (e) {
      print(e);
      print(OTPnew.toString());
      ApiWrapper.showToastMessage("OTP Wrong");
    }
    print(registrationConfirmed);
  }
}
