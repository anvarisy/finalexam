import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';
import 'package:finalexam/domain/usecase.dart';

class GetProductUseCase extends GeneralUseCase<List<Product>, void>{
  // param is void
  GetProductUseCase(ProductRepository repository):super((param)=>repository.getProducts());
}

class GetProductDetailUseCase extends GeneralUseCase<Product, int>{
  //param type is int
  // Similarity with javascript lambda pass function
  // https://dart.dev/language/constructors
  GetProductDetailUseCase(ProductRepository repository):super((param)=>repository.getProductDetail(param));
}

class GetProductByName extends GeneralUseCase<List<Product>, String>{
  GetProductByName(ProductRepository repository):super((param)=>repository.getProductByName(param));
}

class GetProductByCategory extends GeneralUseCase<List<Product>, String>{
  GetProductByCategory(ProductRepository repository):super((param)=>repository.getProductByCategory(param));
}