import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int countFavourites = 35;
  int countUp = 18;
  int countNoAnimation = 100;
  int countDiffPositioned = 15;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.green[100],
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                    badgeContent: Text(
                      '$countFavourites',
                      style: TextStyle(fontSize: 18),
                    ),
                    badgeColor: Colors.green,
                    child: IconButton(
                      onPressed: () => setState(() => countFavourites += 1),
                      icon: Icon(Icons.perm_contact_calendar),
                      iconSize: 80,
                    )),
                SizedBox(
                  height: 30,
                ),
                Badge(
                    badgeContent: Text('$countUp'),
                    badgeColor: Colors.red,
                    child: ElevatedButton(
                      onPressed: () => setState(() => countUp += 1),
                      child: Text('Botón de incremento',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Badge(
                    badgeContent: Text(
                      '$countNoAnimation',
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeColor: Colors.orange,
                    shape: BadgeShape.square,
                    child: ElevatedButton(
                      onPressed: () => setState(() => countNoAnimation -= 1),
                      child: Text('Botón de decremento',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Badge(
                    badgeContent: Text('$countDiffPositioned'),
                    badgeColor: Colors.amberAccent,
                    //shape: BadgeShape.square,
                    position: BadgePosition.topStart(),
                    child: ElevatedButton(
                      onPressed: () => setState(() => countNoAnimation += 1),
                      child: Text('Badge en otra posición',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
}
