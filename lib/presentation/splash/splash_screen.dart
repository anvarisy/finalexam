import 'dart:async';
import 'package:finalexam/presentation/common/infra/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Splash();
  }

}

class _Splash extends State<SplashScreen>{
  startSplash() async {
    return Timer(const Duration(seconds: 2), (){
      /*
      if(pref.getUserData().isNotEmpty){
        Navigator.pushReplacementNamed(context, AppRouter.ROUTE_HOME);
      }else{
        Navigator.pushReplacementNamed(context, AppRouter.ROUTE_LOGIN);
      }
       */
      Navigator.pushReplacementNamed(context, AppRouter.HOME);
    });
  }

  @override
  void initState() {
    super.initState();
    startSplash();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Center(
        child: Stack(
          children: <Widget>[
            Text(
              'A-SHOP',
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.blue[700]!,
              ),
            ),
            // Solid text as fill.
            Text(
              'A-SHOP',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[300],
              ),
            ),
          ],
        )),
      ),
    );
  }

}