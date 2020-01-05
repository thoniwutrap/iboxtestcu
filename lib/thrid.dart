import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('fsdfsdfsdf'),
          onPressed: () {
            print("dsf");
            print( MediaQuery.of(context).size.width);
            Navigator.pushNamed(context, '/mainmenu');
          },
        ),
      ),
    );
  }
}
