import 'package:finalexam/domain/product/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductDetail(int id);
  Future<List<Product>> getProductByName(String name);
  Future<List<Product>> getProductByCategory(String name);
}