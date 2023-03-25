import 'package:finalexam/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'presentation/common/infra/router.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      title: "Flutter clean architecture",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(),
    );

  }
}
