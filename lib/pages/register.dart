import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/pages/login.dart';
import 'package:simple_animations/simple_animations.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PlayAnimation(
                duration: Duration(milliseconds: 900),
                delay: Duration(milliseconds: (300 * 2).round()),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, child, value) {
                  return Container(
                    height: 210,
                    //210,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/curva1.png'),
                            fit: BoxFit.fill)),
                  );
                }),
            Container(
              height: _heigth * 0.2,
              width: _width,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ],
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
                          color: Colors.blue,
                          child: Text(
                            'Crear cuenta',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        Divider(),
                        MaterialButton(
                          minWidth: 200.0,
                          color: Colors.blue,
                          child: Text(
                            'Volver',
                            style: TextStyle(fontSize: 20.0),
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
}
