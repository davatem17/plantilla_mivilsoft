import 'package:flutter/material.dart';
import 'package:plantilla_mivilsoft/src/pages/login.dart';
import 'package:plantilla_mivilsoft/src/pages/map.dart';
import 'package:plantilla_mivilsoft/src/providers/app_provider.dart';
import 'package:plantilla_mivilsoft/src/utils/enums.dart';
import 'package:plantilla_mivilsoft/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool darkModePrefs = false;
  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_selectedIndex == 0
            ? widget.titulo
            : menuOptions[_selectedIndex].label),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Mivil App'), //momentaneamente
            accountEmail: Text('¡Bienvenidos!'),
            currentAccountPicture: CircleAvatar(
              child: Image.asset('assets/images/user.png'),
            ),
          ),
          ListTile(
            title: Text('Mi Cuenta'),
            leading: Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: Text('Acerca de'),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          Column(
            children: [
              darkModePrefs == null
                  ? Container()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.wb_sunny),
                            Switch(
                                value: darkModePrefs,
                                //value: darkModePrefs = false,
                                onChanged: (value) {
                                  appProvider.darkMode = value;
                                  setDarkMode(value);
                                  if (value == true) {
                                    print("Modo nocturno activado");
                                    darkModePrefs = true;
                                  } else {
                                    print("Modo nocturno desactivado");
                                    darkModePrefs = false;
                                  }

                                  Navigator.pop(context);
                                }),
                            Icon(Icons.brightness_2)
                          ],
                        )
                      ],
                    )
            ],
          ),
          ListTile(
            title: Text('Salir'),
            leading: Icon(Icons.close),
            onTap: () async {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            },
          )
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

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {}); //manda a cambiar los estados
  }
}
