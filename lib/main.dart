import 'package:banking/firebase_options.dart';
import 'package:banking/routes/app_route.dart';
import 'package:banking/shared/Constants/app_colors.dart';
import 'package:banking/shared/helper/firebase_service.dart';
import 'package:banking/shared/helper/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseService().init();
  LocalNotificationService().init();
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          secondary: Colors.indigo,
          onSecondary: Colors.white,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.black
          ),
          titleMedium: GoogleFonts.roboto(
            fontSize: 15,
            color: Colors.black54
          ),
          titleSmall: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.grey
          )
        )
      ),
      initialRoute: '/login',
      getPages: AppRoute.routes,
    );
  }
}