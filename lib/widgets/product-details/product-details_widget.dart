import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';

class ProductDetailsWidget extends StatelessWidget {
  Product product;
  ProductDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //watch(getter) : accéder au product stocké dans ProductProvider

    Product? product = context.watch<ProductProvider>().product;

    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(product!.image),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          '${product.price.toStringAsFixed(2)}€',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        RatingStars(
          value: product.rating['rate'],
        ),
        IconButton(
          onPressed: () {
            //maj la propriété product de ProductProvider
            context.read<CartProvider>().product = product;
            //naviguer vers un écran
            context.pushNamed('cart');
          },
          icon: const Icon(Icons.shopping_basket),
          iconSize: 50,
          padding: const EdgeInsets.all(20),
        ),
        const Text(
          'Add to cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
