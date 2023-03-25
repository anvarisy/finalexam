import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/product_detail/product_detail_presenter.dart';
import 'package:finalexam/presentation/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductDetailController<V extends ProductDetailScreen> extends Controller{
  V? widget;
  Product  _product;
  RequestStatus _getProductStatus;

  Product get product=>_product;
  RequestStatus get productStatus=>_getProductStatus;

  final ProductDetailPresenter presenter;
  ProductDetailController(ProductRepository productRepository)
      : _product=Product(0, "title", "description", 0, 0, 0, 0, "brand", "category", "thumbnail", <String>[]),
        _getProductStatus = RequestStatus.loading,
        presenter = ProductDetailPresenter(productRepository),
        super();

  void doGetProductDetail(int id) => presenter.doGetProductDetail(id);

  @override
  void initListeners() {
    // TODO: implement initListeners
    presenter.getProductDetail = (product){
      _product = product;
    };
    presenter.getProductDetailStatus = (status){
      _getProductStatus = status;
      refreshUI();
    };
  }

  @override
  void onInitState() {
    WidgetsFlutterBinding.ensureInitialized().endOfFrame.whenComplete(() {
      widget = getContext().findAncestorWidgetOfExactType<V>();
      presenter.doGetProductDetail(widget?.productId??0);
    });

  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}