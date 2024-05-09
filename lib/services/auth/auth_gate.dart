import 'package:chat_app1/page/home_page.dart';
import 'package:chat_app1/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot) {
          // user is login
          if (snapshot.hasData){
            return const HomePage();
          }

          // user is not login
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
