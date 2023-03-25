import 'package:finalexam/domain/category/repository/category_repository.dart';
import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/home/home_presenter.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller{
  List<Product> _products;
  RequestState _getProductState;

  List<String> _categories;
  RequestState _getCategoryState;

  List<Product> get products => _products;
  RequestState get productState => _getProductState;

  List<String> get categories => _categories;
  RequestState get categoryState=> _getCategoryState;

  final HomePresenter homePresenter;
  HomeController(ProductRepository productRepository, CategoryRepository categoryRepository)
      : _products = [],
        _getProductState = RequestState.none,
        _categories = [],
        _getCategoryState = RequestState.none,
        homePresenter = HomePresenter(productRepository, categoryRepository),
        super();

   @override
  void initListeners() {
     homePresenter.getProducts = (products) {
       _products = products;
     };
     homePresenter.getProductState = (state) {
       _getProductState = state;
       refreshUI();
     };
     homePresenter.getCategories = (categories){
       _categories = categories;
     };

     homePresenter.getCategoryState = (state){
       _getCategoryState = state;
       refreshUI();
     };

  }
    void doGetProducts() => homePresenter.doGetProducts();
    void doGetCategories()=>homePresenter.doGetCategories();

  @override
  void onInitState() {
    homePresenter.doGetProducts();
    homePresenter.doGetCategories();
  }

  @override
  void onDisposed() {
    homePresenter.dispose();
    super.onDisposed();
  }

}