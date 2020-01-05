import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset(
            'ic_minimal.png',
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Master Data", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Kanit'),),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Add Order", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Kanit'),),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Box Arrangement", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Kanit'),),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text("Logout",style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.green
                  ),),
                  onPressed: (){},
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(
      this.title, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}