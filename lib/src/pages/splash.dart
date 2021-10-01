import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: FractionallySizedBox(
                  widthFactor: .8,
                  child: Image.asset('assets/images/logo.png')),
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
