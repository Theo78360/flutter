import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/providers/product_provider.dart';

class CategoryDetailsWidget extends StatelessWidget {
  Category category;
  CategoryDetailsWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    //watch(getter) : accéder au product stocké dans ProductProvider

    Category? category = context.watch<CategoryProvider>().category;

    return Column(
      children: [
        Container(
          height: 300,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          category!.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
