import 'package:finalexam/presentation/home/fragments/category_fragment.dart';
import 'package:finalexam/presentation/home/fragments/shop_home_fragment.dart';
import 'package:finalexam/presentation/widgets/popular_menu_widget.dart';
import 'package:finalexam/presentation/widgets/search_widget.dart';
import 'package:finalexam/presentation/widgets/top_promo_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _Home();
  }

}

class _Home extends State<HomeScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Column(
      children: <Widget>[
        SearchWidget(),
        TopPromoSlider(),
        PopularMenu(),
        SizedBox(
          height: 10,
          child: Container(
            color: Color(0xFFf5f6f7),
          ),
        ),
        PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'Categories',
              ),
              Tab(
                text: 'Shops',
              )
            ], // list of tabs
          ),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Color(0xFFf5f6f7),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              Container(
                color: Colors.white24,
                child: CategoryFragment()//CategoryPage(slug: 'categories/'),
              ),
              // Container(
              //   color: Colors.white24,
              //   child: const Center(child: Text("Under Constructor"),)//BrandHomePage(slug: 'brands/?limit=20&page=1'),
              // ),
              Container(
                color: Colors.white24,
                child: ShopFragment()
              ) // class name
            ],
          ),
        ),
      ],
    ));
  }


}