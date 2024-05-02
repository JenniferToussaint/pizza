import 'package:flutter/material.dart';
import 'package:pizza/pizza_service.dart';

class PizzaDetails extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetails({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pizza.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
           Image.network('https://pizzas.shrp.dev/assets/${pizza.image}'),
            const SizedBox(height: 16.0),
            Text(
              pizza.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Prix: ${pizza.price}€',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Base: ${pizza.base}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Ingrédients: ${pizza.ingredients.join(', ')}',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
