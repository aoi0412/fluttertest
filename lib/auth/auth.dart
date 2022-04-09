import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Center(
        child: Column(
          children: [
          ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signin');
          },
          child: const Text('go to signin'),),
          ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: const Text('goto signup'),),

          ],
        )
        
        
        ),
      );
  }
}