import 'package:flutter/material.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/common/drawer_widget.dart';
import 'package:store/widgets/home/ads_widget.dart';
import 'package:store/widgets/home/products_grid_widget.dart';
import 'package:store/widgets/product-details/product-details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Scaffold permet d'architecturer l'application
       body : défini le contenu principal de l'écran
       AppBar : barre de navigation
       Drawer : menu coulissant
       FloatingButton : bouton flottant
     */
    return const Scaffold(
      appBar: AppbarWidget(),
      //si drawer pas là une fleche de retour va apparaitre
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
