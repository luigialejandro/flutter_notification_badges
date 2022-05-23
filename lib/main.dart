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
  int countFavourites = 97;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          //color: Colors.red,
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                    badgeContent: Text('35'),
                    badgeColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.perm_contact_calendar),
                      iconSize: 80,
                    )),
                SizedBox(
                  height: 30,
                ),
                Badge(
                    badgeContent: Text('18'),
                    badgeColor: Colors.red,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Botón de incremento',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
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
