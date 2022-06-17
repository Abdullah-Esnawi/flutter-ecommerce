import 'package:e_commerce/utilities/router.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE5E5E5),
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(3.0),
          ),
          enabledBorder: OutlineInputBorder(
            
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(3.0),
          ),
          labelStyle: TextStyle(color: Colors.grey),
          
        ),
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.loginPageRoute,
    );
  }
}
