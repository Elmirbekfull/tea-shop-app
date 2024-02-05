import 'package:bubble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrinkTile extends StatelessWidget {
  void Function()? onTap;
  final Drink drink;
  final Widget icon;
  DrinkTile(
      {super.key,
      required this.drink,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ListTile(
            title: Text(
              drink.name,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              drink.price,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            leading: Image.asset(
              drink.imagePatch,
            ),
            trailing: icon),
      ),
    );
  }
}
