import 'package:flutter/widgets.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class Serveices {
  final userPool = CognitoUserPool(
      // '${(dotenv.env['POOl_ID'])}',
      // '${(dotenv.env['CLIENT_ID'])}'

      'ap-south-1_sibAO5sKY',
      '292k0u072s6v0i4esbefrfogoq');

  Future createInitialRecord(email, password) async {
    final cognitoUser = CognitoUser(email, userPool);

    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      debugPrint("Login Success.....");
      debugPrint('CognitoClientException ====>>>> $email $password');
      debugPrint("Authentication User....");
    } on CognitoUserNewPasswordRequiredException catch (e) {
      debugPrint('CognitoUserNewPasswordRequiredException $e');
    } on CognitoUserMfaRequiredException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserSelectMfaTypeException catch (e) {
      debugPrint('CognitoUserSelectMfaTypeException $e');
    } on CognitoUserMfaSetupException catch (e) {
      debugPrint('CognitoUserMfaSetupException $e');
    } on CognitoUserTotpRequiredException catch (e) {
      debugPrint('CognitoUserTotpRequiredException $e');
    } on CognitoUserCustomChallengeException catch (e) {
      debugPrint('CognitoUserCustomChallengeException $e');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      debugPrint('CognitoUserConfirmationNecessaryException $e');
    } on CognitoClientException catch (e) {
      debugPrint('CognitoClientException ====>>>> $email $password');
      debugPrint('CognitoClientException ====>>>> $e');
    } catch (e) {
      print(e);
    }
  }

//   final userPooll = CognitoUserPool(
//     '${(dotenv.env['POOl_ID'])}', '${(dotenv.env['CLIENT_ID'])}',
//   );
//   final userAttributes = [
//     AttributeArg(name: 'first_name', value: 'Jimmy'),
//     AttributeArg(name: 'last_name', value: 'Wong'),
//   ];
//
//   var data;
//   try  async {
//   data = await userPool.signUp(
//   'email@inspire.my',
//   'Password001',
//   userAttributes: userAttributes,
//   );
// } catch (e) {
// print(e);
// }

}
