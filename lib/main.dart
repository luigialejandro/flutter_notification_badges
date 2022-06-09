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
      home: const MyHomePage(title: 'Badges everywhere'),
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
  int countFavourites = 100;
  int countUp = 1;
  int countNoAnimation = 9;
  int countDiffPositioned = 35;
  int countFirstItemButton = 5;
  int countSecondItemButton = 0;
  int countContainer = 15;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        bottomNavigationBar: buildBottomBar(),
        body: Container(
          color: Colors.green[100],
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Badge(
                    badgeContent: Text(
                      '$countFavourites',
                      style: TextStyle(fontSize: 18),
                    ),
                    badgeColor: Colors.green,
                    child: IconButton(
                      onPressed: () => setState(() => countFavourites += 1),
                      icon: Icon(Icons.perm_contact_calendar),
                      iconSize: 60,
                    )),
                SizedBox(
                  height: 20,
                ),
                Badge(
                    badgeContent: Text('$countUp'),
                    badgeColor: Colors.red,
                    child: ElevatedButton(
                      onPressed: () => setState(() => countUp += 1),
                      child: Text('Botón de incremento',
                          style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
                SizedBox(
                  height: 20,
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
                          style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Badge(
                    badgeContent: Text('$countDiffPositioned'),
                    badgeColor: Colors.amberAccent,
                    //shape: BadgeShape.square,
                    position: BadgePosition.topStart(),
                    child: ElevatedButton(
                      onPressed: () => setState(() => countDiffPositioned += 1),
                      child: Text('Badge en otra posición',
                          style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    )),
                SizedBox(height: 20),
                Badge(
                  badgeContent: Text('$countContainer'),
                  badgeColor: Colors.blue,
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.brown[200],
                    child: Center(
                        child: Text('C',
                            style:
                                TextStyle(fontSize: 22, color: Colors.white))),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );

  Widget buildBottomBar() => BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: buildCustomBadge(
                counter: countUp, child: Icon(Icons.favorite_border)),
            title: Text('Favourites'),
          ),
          BottomNavigationBarItem(
              icon: buildCustomBadge(
                  counter: countNoAnimation,
                  child: Icon(Icons.notifications_active_rounded)),
              title: Text('Notificaciones')),
        ],
      );
}

Widget buildCustomBadge({
  required int counter,
  required Widget child,
}) {
  final text = counter.toString();

  return Stack(
    overflow: Overflow.visible,
    children: [
      child,
      Positioned(
          top: -6,
          right: -20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )),
    ],
  );
}
