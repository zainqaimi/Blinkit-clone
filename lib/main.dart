import 'package:blinkit_clone/repository/screens/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ yeh zaroor add karo
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffEC0505), // Blinkit Red
      statusBarIconBrightness: Brightness.light, // white icons
      statusBarBrightness: Brightness.dark, // iOS ke liye
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blinkit',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
