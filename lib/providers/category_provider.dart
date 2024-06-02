import 'package:flutter/material.dart';
import 'package:store/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  //stocker une catégorie
  Category? _category;

  //getter/setter
  Category? get category => _category;

  set category(Category? value) {
    _category = value;
    //notifyListeners = permet de maj les écouteurs du providers
    notifyListeners();
  }
}
