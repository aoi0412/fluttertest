import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

            FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
          },
          child: const Text('login'),
        ),
      ),
    );
  }
}