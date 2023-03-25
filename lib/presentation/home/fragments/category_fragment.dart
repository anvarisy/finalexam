import 'package:finalexam/data/category/category_repository_impl.dart';
import 'package:finalexam/data/product/product_repository_impl.dart';
import 'package:finalexam/presentation/home/home_controller.dart';
import 'package:finalexam/presentation/search/search_product_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CategoryFragment extends View{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _Category();
  }
}

class _Category extends ViewState<CategoryFragment, HomeController>{
  _Category() : super(HomeController(ProductRepositoryImpl(), CategoryRepositoryImpl()));

  @override
  // TODO: implement view
  Widget get view {
    return ControlledWidgetBuilder<HomeController>(builder: ( context, controller) {
      var values = controller.categories;
      return GridView.count(
        crossAxisCount: 3,
//    physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(1.0),
        childAspectRatio: 8.0 / 9.0,
        children: List<Widget>.generate(values.length, (index) {
          return GridTile(
              child: InkWell(
                onTap: () {
                  //TODO on tap
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchProductScreen(2, "${values[index]}")));
                },
                child: Card(
                    color: Colors.white,
                    elevation: 0,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const Icon(
                              Icons.type_specimen_outlined,
                              color: Colors.lightBlueAccent,
                              size:95
                            // imageUrl,
                            // width: 100,
                            // height: 100,
                          ),
                          Text(values[index],
                              style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'Roboto-Light.ttf',
                                  fontSize: 12))
                        ],
                      ),
                    )),
              ));
        }),
      );
    });
  }

}

