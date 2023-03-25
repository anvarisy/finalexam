
/*
{
    "products": [
        {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            ]
        },
 */
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  double stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;


  Product(this.id, this.title, this.description, this.price,
      this.discountPercentage, this.rating, this.stock, this.brand,
      this.category, this.thumbnail,
      this.images);

  @override
  String toString() {
    return 'User{id: $id, title: $title}';
  }


/*  factory Product.fromJson(e) => Product(e['id'], e['title'], e['description'], e['price'], e['discountPercentage'],
    e['rating'],e['stock'],e['brand'],e['category'],e['thumbnail'],e['images']
  );*/
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}


