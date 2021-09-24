import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/src/pages/login.dart';
import 'package:plantilla_mivilsoft/src/pages/map.dart';
import 'package:plantilla_mivilsoft/src/utils/enums.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_selectedIndex == 0
            ? widget.titulo
            : menuOptions[_selectedIndex].label),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorDark),
            child: SingleChildScrollView(
              child: Text(
                "Bienvenid@",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Text(
                'Salir',
                style: Theme.of(context).textTheme.headline6,
              ))
        ],
      )),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 14.0),
          child: contentWidget[_selectedIndex]),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Maps(),
                    ));
              },
              child: const Icon(Icons.map),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {
              print("cambio de estado");
            });
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }
}
