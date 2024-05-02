import 'package:flutter/material.dart';

import 'package:pizza/pizza_details.dart';
import 'package:pizza/pizza_service.dart';
import 'package:pizza/panier.dart';

class PizzaMenuPage extends StatefulWidget {
  const PizzaMenuPage({super.key});

  @override
  _PizzaMenuPageState createState() => _PizzaMenuPageState();
}

class _PizzaMenuPageState extends State<PizzaMenuPage> {
  final PizzaService _pizzaService = PizzaService();
  late List<Pizza> panier;

  @override
  void initState() {
    super.initState();
    panier = []; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu des Pizzas'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PanierPage(panier: panier),
                ),
              );
            },
          ),
        ],
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
                  leading: Image.network('https://pizzas.shrp.dev/assets/${pizza.image}'),
                  title: Text(pizza.name),
                  subtitle: Text('${pizza.price} €'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        panier.add(pizza);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetails(pizza: pizza),
                      ),
                    );
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
