import 'dart:collection';

import 'package:flutter/material.dart';

class Pet {
  String petName = "";
  String imagePath = "";
  String aboutPet = "";
  double petPrice = 0.00;

  Pet(this.petName, this.imagePath, this.petPrice);
}

class Store {
  String storeName = "";
  String imagePath = "";
  String location = "";
  List<Pet> listOfPets = [];

  Store(this.storeName, this.imagePath, this.location, this.listOfPets);
}

class CartModel extends ChangeNotifier {
  final List<Pet> _cartItems = [];

  UnmodifiableListView<Pet> get cartItems => UnmodifiableListView(_cartItems);

  double getTotalPrice() {
    int i;
    double totalPrice = 0;
    for (i = 0; i < cartItems.length; i++) {
      totalPrice += cartItems[i].petPrice;
    }

    return totalPrice;
  }

  void addPetItem(Pet item) {
    _cartItems.add(item);

    notifyListeners();
  }

  void removeAll() {
    _cartItems.clear();

    notifyListeners();
  }
}
