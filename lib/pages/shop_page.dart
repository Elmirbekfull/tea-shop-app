import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // user selected a drink order page

  void goToOrderPage(Drink drink) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OrderPage(
              drink: drink,
            )));
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
                "Эксклюзивный чайный магазин",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30,
                    shadows: [
                      Shadow(
                        color: Colors.grey.shade500, // Цвет тени
                        offset: const Offset(
                            2, 2), // Смещение тени по горизонтали и вертикали
                        blurRadius: 3.0, // Радиус размытия тени
                      ),
                    ],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.shop.length,
                      itemBuilder: (context, index) {
                        // get individual drink from shop
                        Drink individualDrink = value.shop[index];
                        // return Ui
                        return DrinkTile(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          drink: individualDrink,
                          onTap: () => goToOrderPage(individualDrink),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
