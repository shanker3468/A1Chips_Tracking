import 'dart:async';
import 'package:a1chips_tracking_1/Screens/Home%20Page.dart';
import 'package:a1chips_tracking_1/main.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  var islogged = true;
  @override
  void initState() {
    super.initState();
    //getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                islogged == true ? Dashboard() : MyHomePage())));
    var assetsImage = new AssetImage(
        'assets/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height: MediaQuery.of(context)
            .size
            .height); //<- Creates a widget that displays an image.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
  }

  // getStringValuesSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     islogged = prefs.getBool('LoggedIn');
  //   });
  // }
}
