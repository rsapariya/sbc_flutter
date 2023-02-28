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
      Get.to(() => const verification(), transition: Transition.leftToRight);
    } catch (e) {
    }
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

      passwordConfirmed = await cognitoUser.confirmPassword(ootp, newpass);
      Get.offAll(() => login());
      ApiWrapper.showToastMessage("Password Updated.");

    } catch (e) {

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


      data = await userPool.signUp(email.toString(), pass.toString());
      ApiWrapper.showToastMessage('Register Success.');
      Get.offAll(() => login());

      // Get.to(() => newotp());
    } catch (e) {
      ApiWrapper.showToastMessage('Email is Already Registered');

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

      status = await cognitoUser.resendConfirmationCode();
      ApiWrapper.showToastMessage("OTP Sent.");
    } catch (e) {

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

      ApiWrapper.showToastMessage("OTP Wrong");
    }

  }
}
