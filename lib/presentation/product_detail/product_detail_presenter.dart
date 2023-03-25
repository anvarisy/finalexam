import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/domain/product/usecase/product_usecase.dart';
import 'package:finalexam/presentation/common/request_enum.dart';
import 'package:finalexam/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductDetailPresenter extends Presenter{
  late Function(Product product) getProductDetail;
  late Function(RequestStatus state) getProductDetailStatus;
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailPresenter(ProductRepository productRepository) :getProductDetailUseCase = GetProductDetailUseCase(productRepository);

  void doGetProductDetail(int id){
    getProductDetailStatus(RequestStatus.loading);
    getProductDetailUseCase.execute(GeneralObserver((productDetail){
      getProductDetail(productDetail);
      getProductDetailStatus(RequestStatus.success);
    }),id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getProductDetailUseCase.dispose();
  }

}