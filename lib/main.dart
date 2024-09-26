import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/best_books_screen.dart';
import 'screens/main_screen.dart';
import 'screens/premium_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/synopsis_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await _checkFirstTime();
  runApp(BookBudApp(isFirstTime: isFirstTime));
}

Future<bool> _checkFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  if (isFirstTime) {
    await prefs.setBool('isFirstTime', false);
  }
  return isFirstTime;
}

class BookBudApp extends StatelessWidget {
  final bool isFirstTime;

  BookBudApp({required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'BookBud',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.crimsonTextTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.blue,
          ),
          home: isFirstTime ? SplashScreen() : MainScreen(),
          routes: {
            '/synopsis': (context) => SynopsisScreen(),
            '/best-books': (context) => BestBooksScreen(),
            '/settings': (context) => SettingsScreen(),
            '/premium': (context) => PremiumScreen(),
          },
        );
      },
    );
  }
}
