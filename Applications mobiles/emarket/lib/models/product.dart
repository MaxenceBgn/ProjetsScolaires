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
  num rating;
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

  static Dio dio = Dio();

  static Future<List<Product>> fetchProducts() async {
    List<Product> productsList = [];
    try {
      Response response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        dynamic jsonData = response.data;

        // Vérifie si jsonData est un objet JSON plutôt qu'une liste JSON
        if (jsonData is Map<String, dynamic>) {
          // Extrait la liste de produits du JSON
          dynamic jsonProducts = jsonData['products'];

          // Vérifiez si jsonProducts est une liste JSON valide
          if (jsonProducts is List<dynamic>) {
            List<Product> products = jsonProducts
                .map((json) => Product.fromJson(json as Map<String, dynamic>))
                .toList();

            productsList.addAll(products);
          } else {
            print(
                'Erreur: Le JSON ne contient pas une liste de produits valide');
          }
        } else {
          print('Erreur: Le JSON ne contient pas un objet de données valide');
        }
      } else {
        print(
            'Échec de la requête GET. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors de la requête GET : $error');
    }
    return productsList;
  }
}
