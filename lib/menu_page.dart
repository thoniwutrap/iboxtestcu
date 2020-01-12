import 'package:flutter/material.dart';
import 'package:myapp/navigation_bar.dart';
import 'package:myapp/viewpage/AddOrderScreen.dart';
import 'package:myapp/viewpage/BoxArrangementScreen.dart';
import 'package:myapp/viewpage/masterdata/AddProductScreen.dart';
import 'package:myapp/viewpage/masterdata/LogisticsInfoScreen.dart';
import 'package:myapp/viewpage/masterdata/ProductCatagoriesScreen.dart';
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

  void bottomTapped(int index) {
      setState(() {
        bottomSelectedIndex = index;
        pageController.jumpToPage(index);
      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
          Container(
          child: Row(
              children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'ic_minimal.png',
            scale: 2,
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: PopupMenuButton<int>(
          tooltip: "ข้อมูลตั้งต้น",
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text(
                "Logistics Info",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Kanit'),
              ),
            ),
            PopupMenuItem(
              value: 1,
              child: Text(
                "Product Catagories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Kanit'),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Text(
                "Products",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Kanit'),
              ),
            ),
          ],
          child: Text("Master Data",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.teal[700],
              fontFamily: 'Kanit')),
          offset: Offset(0, 100),
          onSelected: (value){
            if(value == 0){
              bottomTapped(0);
            }else if(value == 1){
              bottomTapped(1);
            }else{
              bottomTapped(2);
            }
          },
        ),
      ),
      FlatButton(
        onPressed: (){
          bottomTapped(3);
        },
        child: Text("Add Order",style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.teal[700],
            fontFamily: 'Kanit')),
      ),
      FlatButton(
        onPressed: (){
          bottomTapped(4);
        },
        child: Text("Box Arrangement",style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.teal[700],
            fontFamily: 'Kanit')),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text("Logout",style: TextStyle(
                  color: Colors.white,
                ),),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.teal[700],
              )
            ],
          ),
        ),
      )
      ],
    )
    ),
              Divider(
                color: Colors.grey,
                height: 1.0,
                thickness: 1,
              ),
              Expanded(
                child: PageView(
                  physics: new NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    pageChanged(index);
                  },
                  children: <Widget>[
                    Container(
                      child: LogisticsInfoScreen(),
                    ),
                    Container(
                      child: ProductCatagoriesScreen(),
                    ),
                    Container(
                      child: AddProductScreen(),
                    ),
                    Container(
                      child: AddOrderScreen(),
                    ),
                    Container(
                      child: BoxArrangementScreen(),
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
