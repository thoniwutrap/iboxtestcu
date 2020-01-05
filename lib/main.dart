import 'package:flutter/material.dart';
import 'package:myapp/menu_page.dart';
import 'package:myapp/thrid.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tony'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/mainmenu':
            return PageTransition(child: MainMenuScreen(), type: PageTransitionType.fade);
            break;
          case '/third':
            return PageTransition(child: ThirdScreen(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool monVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Center(
          child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 100, right: 100),
        children: <Widget>[
          SizedBox(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 50, right: 50),
                      child: Text(
                        "Email address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 50, right: 50),
                    child: new TextFormField(
                      style: TextStyle(fontFamily: 'Kanit'),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 50, right: 50),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 50, right: 50),
                    child: new TextFormField(
                      style: TextStyle(fontFamily: 'Kanit'),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: monVal,
                          onChanged: (bool value) {
                            setState(() {
                              print(value);
                              monVal = value;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontFamily: 'Kanit', color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, bottom: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Sign In'),
                        onPressed: () {
                          print("dsf");
                          _incrementName();
                          print( MediaQuery.of(context).size.width);
                          Navigator.pushNamed(context, '/mainmenu');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

_incrementName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('teststr', "Thoniwut");
}