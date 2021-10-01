import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/src/pages/login.dart';
import 'package:plantilla_mivilsoft/src/pages/main_page.dart';
import 'package:plantilla_mivilsoft/src/utils/user_shared_preferences.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool? darkModePrefs;
  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: _heigth * 0.3,
              width: _width,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.badge), labelText: 'Nombre'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.alternate_email),
                              labelText: 'Correo electrónico'),
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _obscureText = !_obscureText;
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Contraseña'),
                        ),
                        Divider(),
                        MaterialButton(
                          minWidth: 200.0,
                          color: darkModePrefs == false
                              ? Colors.blue
                              : Colors.greenAccent,
                          child: Text(
                            'Crear cuenta',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage(
                                          titulo: 'Listas',
                                        )));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        Divider(),
                        MaterialButton(
                          minWidth: 200.0,
                          color: darkModePrefs == false
                              ? Colors.blue
                              : Colors.greenAccent,
                          child: Text(
                            'Volver',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {}); //manda a cambiar los estados
  }
}
