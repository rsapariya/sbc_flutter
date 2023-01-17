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
      save('LoginLoding', false);

      Get.offAll(() => home());
      // save('Login', true);
      ApiWrapper.showToastMessage("Login Successfully.");
    } on CognitoUserNewPasswordRequiredException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserNewPasswordRequiredException $e');
    } on CognitoUserMfaRequiredException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserSelectMfaTypeException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserMfaSetupException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserMfaSetupException $e');
    } on CognitoUserTotpRequiredException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserTotpRequiredException $e');
    } on CognitoUserCustomChallengeException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserCustomChallengeException $e');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      save('LoginLoding', false);
      debugPrint('CognitoUserConfirmationNecessaryException $e');
    } on CognitoClientException catch (e) {
      save('LoginLoding', false);
      print('================================');
      print(getdata.read('LoginLoding'));
      Get.offAll(() => login());
      ApiWrapper.showToastMessage(e.message);
      debugPrint('CognitoClientException ---->>>$e');
    } catch (e) {
      save('LoginLoding', false);
      // ApiWrapper.showToastMessage('Something Went ');
      print(e);
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
