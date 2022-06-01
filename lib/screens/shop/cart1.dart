import 'package:flutter/material.dart';

class CartItem1 {
  final String id;
  final double price;
  final int quantity;
  final String title;
  CartItem1({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem1> _items = {};
  Map<String, CartItem1> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem1) {
      total += CartItem1.price * CartItem1.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exitingCartItem) => CartItem1(
                id: exitingCartItem.id,
                title: exitingCartItem.title,
                quantity: exitingCartItem.quantity + 1,
                price: exitingCartItem.price,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem1(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsValue(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (exitingCartItem) => CartItem1(
          id: exitingCartItem.id,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          quantity: exitingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
