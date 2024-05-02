import 'package:dio/dio.dart';

class PizzaService {
  final Dio _dio = Dio();

  Future<List<Pizza>> getPizzas() async {
    final response = await _dio.get('https://pizzas.shrp.dev/items/pizzas');
    if (response.statusCode == 200) {
      final List pizzas = response.data['data'];
      return pizzas.map((pizza) => Pizza.fromJson(pizza)).toList();
    } else {
      throw Exception('Failed to load pizzas');
    }
  }
}

class Pizza {
  final String id;
  final String name;
  final int price;
  final String base;
  final List<String> ingredients;
  final String image;
  final String category;
  final List<int> elements;

  Pizza({
    required this.id,
    required this.name,
    required this.price,
    required this.base,
    required this.ingredients,
    required this.image,
    required this.category,
    required this.elements,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      base: json['base'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
      category: json['category'],
      elements: List<int>.from(json['elements']),
    );
  }
}
