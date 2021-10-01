import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/src/pages/main_page.dart';
import 'package:plantilla_mivilsoft/src/pages/register.dart';
import 'package:plantilla_mivilsoft/src/utils/user_shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: buildimage(),
            ),
            Divider(
              color: darkModePrefs == false ? Colors.white : Colors.grey[850],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[formulario()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formulario() => Form(
          child: Container(
              child: Column(
        children: [
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
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                icon: Icon(Icons.vpn_key),
                labelText: 'Contraseña'),
          ),
          Divider(
            color: darkModePrefs == false ? Colors.white : Colors.grey[850],
          ),
          MaterialButton(
            minWidth: 200.0,
            color: darkModePrefs == false ? Colors.blue : Colors.greenAccent,
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                  fontSize: 20.0,
                  color: darkModePrefs == false ? Colors.white : Colors.black),
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
          Divider(
            color: darkModePrefs == false ? Colors.white : Colors.grey[850],
          ),
          MaterialButton(
            minWidth: 200,
            color: darkModePrefs == false ? Colors.blue : Colors.greenAccent,
            child: Text(
              'Registrarse',
              style: TextStyle(
                  fontSize: 20.0,
                  color: darkModePrefs == false ? Colors.white : Colors.black),
            ),
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      )));
  Widget buildimage() => Image.asset('assets/images/logo.png');
  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {}); //manda a cambiar los estados
  }
}
