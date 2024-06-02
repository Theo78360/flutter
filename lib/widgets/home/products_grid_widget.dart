import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:store/models/product.dart';
import 'package:store/services/products-service.dart';
import 'package:store/widgets/home/product_item_grid.dart';

class ProductsGridWidget extends StatelessWidget {
  ProductsGridWidget({super.key});

  //instancier le service
  final ProductsService _productsService = ProductsService();

  @override
  Widget build(BuildContext context) {
    // inspect(_productsService.getProducts());
    /*
      widget FutureBuilder : à utiliser obligé avec future
      future : cibler la future
      builder : permet de boucler sur les res renvoyés par la future
      >param snapshot contient les données de la future
     */
    return FutureBuilder(
      future: _productsService.getProducts(),
      builder: (context, snapshot) {
        //si les données sont accesssibles
        if (snapshot.hasData) {
          //requireData : récupérer les données
          List<Product> data = snapshot.requireData;

          //inspect(data);
          /*
            shrinkwrap : imbriquer les elements dans la grille
            itemCount : nombre d'éléments dan sla grille
          */
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  'Our products',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItemGrid(
                      product: data[index],
                    );
                  },
                ),
              ],
            ),
          );
        }
        //sinon
        return const CircularProgressIndicator();
      },
    );
  }
}
