import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: card('Cámara 1', 'Placa: POI1252')),
              Center(child: card('Cámara 2', 'Placa: TYU4578')),
              Center(child: card('Cámara 3', 'Placa: TTR4538')),
              Center(child: card('Cámara 4', 'Placa: TCV4978')),
              Center(child: card('Cámara 5', 'Placa: YSW0102')),
              Center(child: card('Cámara 6', 'Placa: LMN4319'))
            ],
          ),
        ),
      ),
    );
  }

  Widget card(String numero, String placa) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(numero),
              leading: Icon(Icons.videocam),
            ),
            ListTile(
              title: Text(placa),
            )
          ],
        ),
      );
}
