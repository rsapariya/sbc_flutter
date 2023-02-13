// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sbc/splaysh.dart';
import 'package:sbc/units/color.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(provider());
}

class provider extends StatelessWidget {
  const provider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// SHA1: 01:4A:EE:E3:96:DE:C3:21:85:5B:89:F0:E8:20:FD:86:F8:07:EE:94
// SHA256: FA:2F:83:CD:18:EC:99:1C:D0:9D:99:49:1F:FF:B8:F7:0E:32:BF:0C:2C:F8:06:90:1A:48:87:4D:39:0F:FF:90
// GITTOKEN: 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

// cognito :

// userPoolId = "ap-south-1_lwgNuwQin"
// clientId = "36eq6uunll8l5t4ugouhenatjd"
// clientSecretId = "v5i8g01ne0u5tepp521j229unkuinikk3dauakel22oiu8dkcs1"
