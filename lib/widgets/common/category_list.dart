import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/category.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/services/category-service.dart';

class CategoryList extends StatelessWidget {
  //récupérer la cagégorie envoyé par la liste
  Category category;
  CategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          category.title,
          overflow: TextOverflow.ellipsis,
        ),
        OutlinedButton(
            onPressed: () {
              //maj la propriété product de ProductProvider
              context.read<CategoryProvider>().category = category;
              //naviguer vers un écran
              context.pushNamed('category-details');
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                side: BorderSide.none,
                shape: const BeveledRectangleBorder()),
            child: const Text('View')),
      ],
    );
  }
}
