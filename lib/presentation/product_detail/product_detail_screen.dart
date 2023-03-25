
import 'dart:ffi';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalexam/data/product/product_repository_impl.dart';
import 'package:finalexam/presentation/product_detail/product_detail_controller.dart';
import 'package:finalexam/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductDetailScreen extends View{
  int productId;

  ProductDetailScreen(this.productId, {super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreen();
  }

}

class _DetailScreen extends ViewState<ProductDetailScreen, ProductDetailController>{
  _DetailScreen() : super(ProductDetailController(ProductRepositoryImpl()));

  @override
  // TODO: implement view
  Widget get view{
    return ControlledWidgetBuilder<ProductDetailController>(builder: ( context, controller){
      var product = controller.product;
      List<Widget> _images= <Widget>[];
      for(int i=0;i<product.images.length;i++){
        _images.add(Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(product.images[i], fit: BoxFit.cover, width:double.infinity),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
            ),
          )
        );
      }
      return Scaffold(
        appBar: appBarWidget(context),
        bottomNavigationBar: BottomNavBar(),
        key: globalKey,
        body:   SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    height: 270.0,
                    width: double.infinity,
                    child: Carousel(
                      images: _images,
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.purple,
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.black54.withOpacity(0.2),
                      borderRadius: true,
                      radius: Radius.circular(20),
                      moveIndicatorFromBottom: 180.0,
                      noRadiusForIndicator: true,
                    )),
              ),*/
              CarouselSlider(
                options: CarouselOptions(),
                items: _images),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Product".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    Text("${product.title}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFfd0100))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Stock".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    Text("${product.stock.round()}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFfd0100))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Price".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    Text(
                        "\$ ${product.price}"
                            .toUpperCase(),
                        style: TextStyle(
                            color: (product.price!=
                                null)
                                ? Color(0xFFf67426)
                                : Color(0xFF0dc2cd),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Discount".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    Text(
                        " ${product.discountPercentage} \%"
                            .toUpperCase(),
                        style: TextStyle(
                            color: (product.discountPercentage!=
                                null)
                                ? Color(0xFFf67426)
                                : Color(0xFF0dc2cd),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Rating".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    Text(
                        " ${product.rating}"
                            .toUpperCase(),
                        style: TextStyle(
                            color: (product.rating!=
                                null)
                                ? Color(0xFFf67426)
                                : Color(0xFF0dc2cd),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF565656))),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "${product.description}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4c4c4c))),
                  ],
                ),
              ),


              // Image.network(product.thumbnail,fit: BoxFit.fill,),
            ],
          ),
        ),
      );
    });
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.favorite_border,
            color: Color(0xFF5e5e5e),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  side: BorderSide(color: Color(0xFFfef2f2))),
              elevation: 0,
              backgroundColor: Color(0xFFfef2f2),
            ),
            onPressed: () {},
            child: Container(

              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
              child: Text("Add to cart".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFff665e))),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  side: BorderSide(color: Color(0xFFff665e))),
              backgroundColor: Color(0xFFff665e),
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
              child: Text("available at shops".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF))),
            ),
          ),
        ],
      ),
    );
  }
}