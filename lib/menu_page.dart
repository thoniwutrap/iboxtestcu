import 'package:flutter/material.dart';
import 'package:myapp/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: PageView(
                  children: <Widget>[
                    Container(
                      color: Colors.pink,
                    ),
                    Container(
                      color: Colors.cyan,
                    ),
                    Container(
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              )
            ],
          )
        ),
    );
  }
}

getBoolValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  String strr = prefs.getString('teststr');
  print(strr);
}
