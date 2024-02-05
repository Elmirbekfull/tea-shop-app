import 'package:bubble_tea_app/models/drink.dart';
import 'package:flutter/cupertino.dart';

class BubbleTeaShopProvider extends ChangeNotifier {
  // список напиток на продажу
  final List<Drink> _shop = [
    Drink(name: "Кофе", price: "20.00 сом", imagePatch: "assets/images/2.png"),
    Drink(
        name: "Малиновый чай",
        price: "4.00 сом",
        imagePatch: "assets/images/4.png"),
    Drink(
        name: "Френч-пресс",
        price: "40.00 сом",
        imagePatch: "assets/images/2.png"),
    Drink(
        name: "Чай с лимоном",
        price: "35.00 сом",
        imagePatch: "assets/images/5.png"),
    Drink(name: "Латте", price: "20.00 сом", imagePatch: "assets/images/2.png"),
  ];
  // список напитков в карточке пользоветеля
  final List<Drink> _userCart = [];
  // get методы получения доступ в другом файле
  List<Drink> get shop => _shop;

  // get user card
  List<Drink> get userCart => _userCart;

  // add drink to card
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from card
  void removeToCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
