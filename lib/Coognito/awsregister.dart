import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbc/deshboard/home.dart';
import 'package:sbc/units/api.dart';
import 'package:sbc/units/storage.dart';

import '../login/login.dart';

class AWSServices {
  final userPool = CognitoUserPool(
      "ap-south-1_sibAO5sKY", "292k0u072s6v0i4esbefrfogoq",
      clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");

  Future createInitialRecord(email, password) async {

    final cognitoUser = CognitoUser(email, userPool,
        clientSecret: "1eucun5p225vvlqrpsccvu5uodj05d2etmkl6f9ksa1et3rf7tib");
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);

      save('EMAIL', email.toString());
      // EmailID = email.toString();
      save('LoginLoding', false);

      Get.offAll(() => home(), transition: Transition.leftToRight);
      // save('Login', true);
      ApiWrapper.showToastMessage("Login Successfully.");
    } on CognitoUserNewPasswordRequiredException catch (e) {
      save('LoginLoding', false);

    } on CognitoUserMfaRequiredException catch (e) {
      save('LoginLoding', false);
    } on CognitoUserSelectMfaTypeException catch (e) {
      save('LoginLoding', false);
    } on CognitoUserMfaSetupException catch (e) {
      save('LoginLoding', false);
    } on CognitoUserTotpRequiredException catch (e) {
      save('LoginLoding', false);
    } on CognitoUserCustomChallengeException catch (e) {
      save('LoginLoding', false);
    } on CognitoUserConfirmationNecessaryException catch (e) {
      save('LoginLoding', false);
    } on CognitoClientException catch (e) {
      save('LoginLoding', false);
      Get.offAll(() => login());
      ApiWrapper.showToastMessage(e.message);
    } catch (e) {
      save('LoginLoding', false);
      ApiWrapper.showToastMessage('Something Went ');
    }
  }
}

class loginloder extends StatefulWidget {
  const loginloder({Key? key}) : super(key: key);

  @override
  State<loginloder> createState() => _loginloderState();
}

class _loginloderState extends State<loginloder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
