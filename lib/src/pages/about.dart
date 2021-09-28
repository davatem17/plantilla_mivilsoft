import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),
            Text('Todos los derechos reservados a Mivilsoft S.A')
          ],
        ),
      ),
    );
  }
}
