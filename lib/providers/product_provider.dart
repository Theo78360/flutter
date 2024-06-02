import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductProvider extends ChangeNotifier {
  //stocker un produit
  Product? _product;

  //getter/setter
  Product? get product => _product;

  set product(Product? value) {
    _product = value;
    //notifyListeners = permet de maj les écouteurs du providers
    notifyListeners();
  }
}
