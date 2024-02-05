import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  // remove to cart
  void removeToCart(Drink drink) {
    Provider.of<BubbleTeaShopProvider>(context, listen: false)
        .removeToCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShopProvider>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text(
                "Ваша корзина",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.grey.shade500, // Цвет тени
                        offset: const Offset(
                            2, 2), // Смещение тени по горизонтали и вертикали
                        blurRadius: 3.0, // Радиус размытия тени
                      ),
                    ],
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              value.userCart.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 200, bottom: 200),
                      child: Image.asset("assets/images/emty.png"),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // get individual drink in cart first
                            Drink drink = value.userCart[index];
                            return DrinkTile(
                                drink: drink,
                                onTap: () => removeToCart(drink),
                                icon: Icon(
                                  Icons.delete,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ));
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
