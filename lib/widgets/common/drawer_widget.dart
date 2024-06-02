import 'package:flutter/material.dart';
import 'package:store/models/category.dart';
import 'package:store/services/category-service.dart';
import 'package:provider/provider.dart';
import 'package:store/widgets/common/category.grid.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryService.getCategory(),
      builder: (context, snapshot) {
        //si les données sont accesssibles
        if (snapshot.hasData) {
          //requireData : récupérer les données
          List<Category> data = snapshot.requireData;

          return Drawer(
            child: Container(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CloseButton(),
                      CategoryGridWidget(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        //sinon
        return const CircularProgressIndicator();
      },
    );
  }
}
