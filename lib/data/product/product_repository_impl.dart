
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:finalexam/domain/product/entity/product.dart';
import 'package:finalexam/domain/product/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  // static final Uri _host = Uri.https('dummyjson.com', '/');
  // static const String _accessToken = '01cd0879d8cfa0510bf0b095064b7c38d65cb313aa4a35f034331ad57f211207';

/*  static Map<String, String> _headers([String? token]) => {
    // if (token!=null) 'Authorization': 'Bearer $token',
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };*/

  //singleton
  static final ProductRepositoryImpl _instance = ProductRepositoryImpl._internal();
  ProductRepositoryImpl._internal();
  factory ProductRepositoryImpl() => _instance;

  @override
  Future<Product> getProductDetail(int id) async{
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'),
      ).timeout(const Duration(seconds: 7));
      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      }
    } on TimeoutException {
      throw TimeoutException('');
    }

    throw Exception();
  }

  @override
  Future<List<Product>> getProducts() async{
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'),
      ).timeout(const Duration(seconds: 7));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }

    throw Exception();
  }

  @override
  Future<List<Product>> getProductByName(String name) async{
    // TODO: implement getProductByName

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/search?q=$name'),
      ).timeout(const Duration(seconds: 7));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }

    throw Exception();
  }

  @override
  Future<List<Product>> getProductByCategory(String name) async{
    // TODO: implement getProductByCategory
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$name'),
      ).timeout(const Duration(seconds: 7));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }

    throw Exception();
  }

}