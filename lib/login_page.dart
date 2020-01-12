import 'package:flutter/material.dart';
import 'package:myapp/provider/auth_service.dart';
import 'package:myapp/provider/user_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserRepository>(
      builder: (_) => UserRepository.instance(),
      child: mLoginScreen(),
    );
  }
}


class mLoginScreen extends StatefulWidget {
  mLoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<mLoginScreen> {
  bool monVal = false;
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<UserRepository>(context);
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
                              controller: emailController,
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
                              controller: passwordController,
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
                                  signIn(appState);
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

  void signIn(UserRepository auth) async{
    bool isSuccess = await auth.signIn(context,emailController.text,passwordController.text);
    if(isSuccess){
      print("success");
      Navigator.pushNamed(context, '/mainmenu');
    }else{
      print("failed");
      Navigator.pushNamed(context, '/mainmenu');
    }
  }

}
