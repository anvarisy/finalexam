
import 'package:finalexam/domain/category/repository/category_repository.dart';
import 'package:finalexam/domain/category/usecase/category_usecase.dart';
import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/domain/product/usecase/product_usecase.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter{
  late Function(List<String> category) getCategories;
  late Function(RequestState state) getCategoryState;

  late Function(List<Product> product) getProducts;
  late Function(RequestState state) getProductState;
  final GetProductUseCase getProductUseCase;
  final GetCategoryUseCase getCategoryUseCase;

  HomePresenter(ProductRepository productRepository, CategoryRepository categoryRepository) :
        getProductUseCase = GetProductUseCase(productRepository),
        getCategoryUseCase = GetCategoryUseCase(categoryRepository);

  void doGetProducts() {
    getProductState(RequestState.loading);
    getProductUseCase.execute(GeneralObserver((products){
      getProducts(products);
      getProductState(RequestState.loaded);
    }));
  }

  void doGetCategories(){
    getCategoryState(RequestState.loading);
    getCategoryUseCase.execute(GeneralObserver((categories){
      getCategories(categories);
      getCategoryState(RequestState.loaded);
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getProductUseCase.dispose();
    getCategoryUseCase.dispose();
  }
}
