import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/units/api.dart';

import '../login/login.dart';

class AWSServices {
  final userPool = CognitoUserPool(
      "ap-south-1_sibAO5sKY", "292k0u072s6v0i4esbefrfogoq",
      clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

  Future createInitialRecord(email, password) async {
    debugPrint('Authenticating User... ${userPool.toString()}');
    final cognitoUser = CognitoUser(email, userPool,
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      debugPrint('Login Success...');
      EmailID = email.toString();
      Get.to(() => home());
      ApiWrapper.showToastMessage("Login Successfully.");
    } on CognitoUserNewPasswordRequiredException catch (e) {
      debugPrint('CognitoUserNewPasswordRequiredException $e');
    } on CognitoUserMfaRequiredException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserSelectMfaTypeException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserMfaSetupException catch (e) {
      debugPrint('CognitoUserMfaSetupException $e');
    } on CognitoUserTotpRequiredException catch (e) {
      debugPrint('CognitoUserTotpRequiredException $e');
    } on CognitoUserCustomChallengeException catch (e) {
      debugPrint('CognitoUserCustomChallengeException $e');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      debugPrint('CognitoUserConfirmationNecessaryException $e');
    } on CognitoClientException catch (e) {
      debugPrint('CognitoClientException ---->>>$e');
    } catch (e) {
      print(e);
    }
  }
}
