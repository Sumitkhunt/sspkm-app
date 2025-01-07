import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sspkm/form/admission_form1.dart';
import 'package:sspkm/screen/firebase_options.dart';
import 'package:sspkm/screen/splash.dart';
import 'form/payment.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      // ignore: prefer_const_constructors
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
        home: splash_screen(),
        debugShowCheckedModeBanner: false,
        );
      }
      );
    }
  }

