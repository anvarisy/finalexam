

import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/search/search_product_Screen.dart';
import 'package:finalexam/presentation/search/search_product_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchProductController<V extends SearchProductScreen> extends Controller{
  V? widget;
  List<Product>  _products;
  RequestStatus _queryStatus;

  List<Product> get product=>_products;
  RequestStatus get productStatus=>_queryStatus;

  final SearchProductPresenter presenter;
  SearchProductController(ProductRepository productRepository)
      : _products=[],
        _queryStatus = RequestStatus.loading,
        presenter = SearchProductPresenter(productRepository),
        super();

  void doSearchProductByName(String name) => presenter.doGetProductByName(name);
  void doSearchProductByCategory(String name) => presenter.doGetProductByCategory(name);

  @override
  void initListeners() {
    // TODO: implement initListeners
    presenter.getProducts = (product){
      _products = product;
    };
    presenter.getSearchProductStatus = (status){
      _queryStatus = status;
      refreshUI();
    };
  }

  @override
  void onInitState() {
    WidgetsFlutterBinding.ensureInitialized().endOfFrame.whenComplete(() {
      widget = getContext().findAncestorWidgetOfExactType<V>();
      if(widget?.type==1){
        presenter.doGetProductByName(widget?.name??"");
      }else{
        presenter.doGetProductByCategory(widget?.name??"");
      }

    });

  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}