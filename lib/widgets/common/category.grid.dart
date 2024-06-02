import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';
import 'package:store/services/category-service.dart';
import 'package:store/services/products-service.dart';
import 'package:store/widgets/common/category_list.dart';

class CategoryGridWidget extends StatelessWidget {
  CategoryGridWidget({super.key});

  //instancier le service
  final CategoryService _categoryService = CategoryService();

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
      future: _categoryService.getCategory(),
      builder: (context, snapshot) {
        //si les données sont accesssibles
        if (snapshot.hasData) {
          //requireData : récupérer les données
          List<Category> data = snapshot.requireData;

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
                  'Our Categories',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CategoryList(
                      category: data[index],
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
