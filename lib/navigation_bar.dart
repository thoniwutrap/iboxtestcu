import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}


class _NavigationBarState extends State<NavigationBar> {

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    value: 1,
                    child: Text(
                      "Logistics Info",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
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
              ),
            ),
            FlatButton(
              onPressed: (){},
              child: Text("Add Order",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.teal[700],
                  fontFamily: 'Kanit')),
            ),
            FlatButton(
              onPressed: (){},
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
                      onPressed: (){},
                      color: Colors.teal[700],
                    )
                  ],
                ),
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