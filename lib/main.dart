import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/src/pages/splash.dart';
import 'package:plantilla_mivilsoft/src/providers/app_provider.dart';
import 'package:plantilla_mivilsoft/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: provider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.blue),
            home: SplashScreen(),
          );
        }));
  }
}
