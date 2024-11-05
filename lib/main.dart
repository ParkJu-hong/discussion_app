import 'package:discussion_app/screens/auth_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 앱 초기화 보장
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 75, 17, 175),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'discussion_app',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: WidgetStateProperty.all(buttonColor),
            foregroundColor: WidgetStateProperty.all(Colors.black),
            side: WidgetStateProperty.all(
              const BorderSide(
                color: borderColor,
                style: BorderStyle.solid,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // 모서리를 둥글게 설정 (12px radius)
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const AuthSelectionScreen(),
    );
  }
}
