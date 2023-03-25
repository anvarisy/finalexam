

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:finalexam/domain/category/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{

  static final CategoryRepositoryImpl _instance = CategoryRepositoryImpl._internal();
  CategoryRepositoryImpl._internal();
  factory CategoryRepositoryImpl() => _instance;

  @override
  Future<List<String>> getCategories() async{
    // TODO: implement getCategories
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'),
      ).timeout(const Duration(seconds: 7));
      if (response.statusCode == 200) {
        return json.decode(response.body).cast<String>().toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }

    throw Exception();
  }

}