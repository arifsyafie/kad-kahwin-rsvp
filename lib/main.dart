import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print(const bool.fromEnvironment('isLelaki'));


  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA6nkr5kNt5JFyrBU77vbiVCjRNfHRuYK0',
      authDomain: 'kad-kahwin-70d32.firebaseapp.com',
      projectId: 'kad-kahwin-70d32',
      storageBucket: 'kad-kahwin-70d32.appspot.com',
      messagingSenderId: '471464289749',
      appId: '1:471464289749:web:eab79c6ee6e96be253495c',
    ),
  );
  runApp(const KadKahwinApp());
}

class KadKahwinApp extends StatelessWidget {
  const KadKahwinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Kad Kahwin RSVP Arif ♥ Ain',
          theme: ThemeData(
            primarySwatch: ColorsConstant.mainColorWithSwatch,
          ),
          home: const AppHomePage(),
        );
      },
    );
  }
}
