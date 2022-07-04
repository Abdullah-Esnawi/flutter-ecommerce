import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final _auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active)  {
          final user = snapshot.data;
          if(user==null) {
            return ChangeNotifierProvider<AuthController>(
              create: (_)=> AuthController(auth: _auth),
              child: AuthPage(),
            );
          } else {
            return BottomNavbar();
          }
        } 
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
