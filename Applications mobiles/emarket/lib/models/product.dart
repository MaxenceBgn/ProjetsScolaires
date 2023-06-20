import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  int rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Dio dio = Dio();

  void fetchProducts() async {
    try {
      Response response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        dynamic jsonData = response.data;
        List<dynamic> jsonProducts = jsonData as List<dynamic>;

        List<Product> products = jsonProducts
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();

        returnProductList(products);
      } else {
        print(
            'Échec de la requête GET. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors de la requête GET : $error');
    }
  }

  List<Product> returnProductList(List<Product> list) {
    return list;
  }
}
