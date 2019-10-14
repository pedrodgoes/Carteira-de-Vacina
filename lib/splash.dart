import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'minhahome.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      imageBackground: AssetImage("assets/splash.jpeg"),
      photoSize: 100.0,
      loaderColor: Colors.black,
      navigateAfterSeconds: AfterSplash(),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/download.jpg",
                fit: BoxFit.cover,
                ),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaHome()));
                    },
                    child: Text(
                      "Vamos lá!",
                      style: TextStyle(color: Colors.blue[800], fontSize: 30.0),
                    ),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
