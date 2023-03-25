import 'package:finalexam/presentation/search/search_product_Screen.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final tvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          ),
          child: TextField(
            controller: tvController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: IconButton(icon: Icon(Icons.search),
              onPressed: () {
                //print(tvController.value.text);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchProductScreen(1, "${tvController.value.text}")));
                },),
              fillColor: Color(0xFFF2F4F5),
              hintStyle: new TextStyle(color: Colors.grey[600]),
              hintText: "What would your like to buy?",
            ),
            autofocus: false,
          )),
    );
  }
}