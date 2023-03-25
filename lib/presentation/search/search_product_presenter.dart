

import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/domain/product/usecase/product_usecase.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchProductPresenter extends Presenter{
  late Function(List<Product> products) getProducts;
  late Function(RequestStatus state) getSearchProductStatus;
  final GetProductByName getProductByNameUseCase;
  final GetProductByCategory getProductByCategoryUseCase;

  SearchProductPresenter(ProductRepository productRepository)
      :getProductByNameUseCase = GetProductByName(productRepository),
        getProductByCategoryUseCase = GetProductByCategory(productRepository);

  void doGetProductByName(String name){
    getSearchProductStatus(RequestStatus.loading);
    getProductByNameUseCase.execute(GeneralObserver((products){
      getProducts(products);
      getSearchProductStatus(RequestStatus.success);
    }),name);
  }

  void doGetProductByCategory(String name){
    getSearchProductStatus(RequestStatus.loading);
    getProductByCategoryUseCase.execute(GeneralObserver((products){
      getProducts(products);
      getSearchProductStatus(RequestStatus.success);
    }),name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getProductByNameUseCase.dispose();
    getProductByCategoryUseCase.dispose();
  }

}