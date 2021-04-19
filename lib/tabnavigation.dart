import 'package:flutter/material.dart';
import 'package:tabnavigation/wallet.dart';
import 'wallet.dart';
import 'home.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Media extends _HomeState {}

class _HomeState extends State<Home> {
  String name = "hello";
  int index = 0;
  final List<Widget> pages = [Homes(), Wallet(), Setting()];
  final tabs = [
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('wallet'),
    ),
    Center(
      child: Text('settings'),
    )
  ];
  // void onClick(int index) {
  // index = ind;
  // }

  onClick(int ind) {
    setState(() {
      index = ind;
      if (index == 0) {
        print('This is Home Page');
      } else if (index == 1) {
        print('This is Wallet Page');
      } else if (index == 2) {
        print('This is Settings Page');
      } else {
        print('Click a valid icon');
      }
      // print(ind);
      // if (index == 1) {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Wallet()));
      // } else {
      //   print('hello');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Navigation'),

        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      ),
      floatingActionButton: BackButton(
        color: (Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: 'Wallet',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.brown),
        ],
        currentIndex: index,
        onTap: onClick,
        fixedColor: Colors.green,
      ),
      // child: Column(
      //   children: <Widget>[
      //     TextFormField(),
      //     Container(
      //       alignment: Alignment.center,
      //       child: Text('HomePage'),
      //     ),
      //     ElevatedButton(
      //       child: Text("wallet"),
      //       onPressed: () => Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => Wallet())),
      //     ),
      //     widgetOptions.elementAt(index),
      //   ],
      // ),
      // ),
    );
  }
}
