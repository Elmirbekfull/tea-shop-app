import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweentness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double turmericValue = 0.75;
  void customizeTurmeric(double newValue) {
    setState(() {
      turmericValue = newValue;
    });
  }

  double mintValue = 0.0;
  void customizeMint(double newValue) {
    setState(() {
      mintValue = newValue;
    });
  }

  // add to cart
  void addToCart() {
    Provider.of<BubbleTeaShopProvider>(context, listen: false)
        .addToCart(widget.drink);
    // direct user back to shop page
    Navigator.pop(context);

    // let user know it has been successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              icon: Icon(
                Icons.done,
                color: Colors.green,
                size: 40,
              ),
              title: Text("Успешно добавлено в корзину"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.drink.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // image
          Image.asset(widget.drink.imagePatch),
          // slider
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Сладкий",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeSweet(value)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Куркума",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                          value: turmericValue,
                          label: turmericValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeTurmeric(value)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Мята",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                          value: mintValue,
                          label: mintValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeMint(value)),
                    )
                  ],
                )
              ],
            ),
          ),
          // add to cart
          GestureDetector(
            onTap: addToCart,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Добавить в корзину",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
