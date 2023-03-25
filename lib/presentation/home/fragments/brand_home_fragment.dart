
import 'package:flutter/material.dart';

class BrandHomeFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Brand();
  }
}

class _Brand extends State<BrandHomeFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("Brand"),
      ),
    );
  }

}