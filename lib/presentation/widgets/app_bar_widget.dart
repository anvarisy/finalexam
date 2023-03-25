import 'package:finalexam/presentation/user/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: const Text("A-SHOP", style: TextStyle(color: Colors.white, fontSize: 24),),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        },
        icon: Icon(FontAwesomeIcons.user),
        color: Colors.white,
      ),
    ],
  );
}