import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:myapp/menu_page.dart';
import 'package:myapp/provider/auth_service.dart';
import 'package:myapp/thrid.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  if (fb.apps.length == 0) {
    try {
      fb.initializeApp(
          apiKey: "AIzaSyCdJ_Qe3PFoVuKpnV87OHXHT-062PUjpNo",
          authDomain: "codelab-8f09f.firebaseapp.com",
          databaseURL: "https://codelab-8f09f.firebaseio.com",
          projectId: "codelab-8f09f",
          storageBucket: "codelab-8f09f.appspot.com",
          messagingSenderId: "232509430134",
          appId: "1:232509430134:web:b620af1d7a99e9603cc257"
      );
    } catch(e) {
      print(e);
    }
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuth(),
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
