import 'package:flutter/material.dart';
import 'pizza_service.dart';

class PanierPage extends StatelessWidget {
  final List<Pizza> panier;

  const PanierPage({Key? key, required this.panier});

  @override
  Widget build(BuildContext context) {
    Map<String, Pizza> pizzaMap = {};

    panier.forEach((pizza) {
      if (pizzaMap.containsKey(pizza.id)) {
        pizzaMap[pizza.id]!.quantity += pizza.quantity;
      } else {
        pizzaMap[pizza.id] = pizza;
      }
    });

    double total = pizzaMap.values.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity);

    List<Pizza> uniquePizzas = pizzaMap.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: uniquePizzas.length,
              itemBuilder: (context, index) {
                final pizza = uniquePizzas[index];
                return ListTile(
                  leading: Image.network(
                      'https://pizzas.shrp.dev/assets/${pizza.image}'),
                  title: Text(pizza.name),
                  subtitle: Text('${pizza.price} € x ${pizza.quantity}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total du panier : $total €',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
