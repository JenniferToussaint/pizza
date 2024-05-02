import 'package:flutter/material.dart';
import 'package:pizza/pizza_service.dart';

class PizzaMenuPage extends StatelessWidget {
  final PizzaService _pizzaService = PizzaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu des Pizzas'),
      ),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzaService.getPizzas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            final pizzas = snapshot.data!;
            return ListView.builder(
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final pizza = pizzas[index];
                return ListTile(
                  title: Text(pizza.name),
                  subtitle: Text('${pizza.price} €'),
                  onTap: () {
                    // Naviguer vers l'écran Details avec la pizza sélectionnée
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

