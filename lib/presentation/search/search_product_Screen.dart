import 'package:finalexam/data/product/product_repository_impl.dart';
import 'package:finalexam/presentation/product_detail/product_detail_screen.dart';
import 'package:finalexam/presentation/search/search_product_controller.dart';
import 'package:finalexam/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchProductScreen extends View{
  final int type;
  String name;

  SearchProductScreen(this.type, this.name, {super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchProductScreen();
  }
}

class _SearchProductScreen extends ViewState<SearchProductScreen, SearchProductController>{
  _SearchProductScreen() : super(SearchProductController(ProductRepositoryImpl()));

  @override
  // TODO: implement view
  Widget get view {
    return ControlledWidgetBuilder<SearchProductController>(builder: ( context, controller){
      var products = controller.product;
      return Scaffold(
          appBar: appBarWidget(context),
          key: globalKey,
          body: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(1.0),
            childAspectRatio: 8.0 / 9.0,
            children: List<Widget>.generate(products.length, (index) {
              return GridTile(
                  child: InkWell(onTap: ()=>{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(products[index].id)),
                    )},
                    child:  Card(
                        color: Colors.white,
                        elevation: 0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                products[index].thumbnail,
                                width: 100,
                                height: 100,
                              ),
                              Text(products[index].title.length>=25?products[index].title.substring(0,22)+"...":products[index].title,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Roboto-Light.ttf',
                                      fontSize: 12))
                            ],
                          ),
                        )),)
              );
            }),
          ),
      );
    });
  }
}