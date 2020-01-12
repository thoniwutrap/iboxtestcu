import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/paint/curve_painter.dart';



class LogisticsInfoScreen extends StatefulWidget {
  @override
  _LogisticsInfoScreenState createState() => _LogisticsInfoScreenState();
}

class _LogisticsInfoScreenState extends State<LogisticsInfoScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            children: <Widget>[
               Container(
                width: 1000,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 3, color: Colors.grey, spreadRadius: 4)
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.teal[900],
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            child: Text(
                              "Logistics Info",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Kanit'
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0),
                                          side: BorderSide(color: Colors.white)),
                                      onPressed: () {},
                                      color: Colors.transparent,
                                      textColor: Colors.white,
                                      child: Text("Add".toUpperCase(),
                                          style: TextStyle(fontSize: 14,   fontFamily: 'Kanit')),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(5.0),
                                            side: BorderSide(color: Colors.white)),
                                        onPressed: () {},
                                        color: Colors.transparent,
                                        textColor: Colors.white,
                                        child: Text("Edit".toUpperCase(),
                                            style: TextStyle(fontSize: 14,   fontFamily: 'Kanit')),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 20),
                                    child: RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0),
                                          side: BorderSide(color: Colors.white)),
                                      onPressed: () {},
                                      color: Colors.transparent,
                                      textColor: Colors.white,
                                      child: Text("Delete".toUpperCase(),
                                          style: TextStyle(fontSize: 14,   fontFamily: 'Kanit')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: entries == null ? 1 : entries.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          // return the header
                          return Container(
                            height: 30,
                            child: new Row(
                              children: <Widget>[
                                Text("ID"),
                                Container(child: VerticalDivider(color: Colors.red)),
                                Text("Name"),
                              ],
                            ),
                          );
                        }
                        index -= 1;

                        // return row
                        var row = entries[index];
                        return new InkWell(
                          child: Column(
                            children: <Widget>[
                              Text("dsf"),
                              CustomPaint(

                                size: new Size(400.0, 400.0),
                                painter: new Line(),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
