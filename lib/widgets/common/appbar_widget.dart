import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*
        title : texte, icone,image
        centerTitle
        loading : regroupement de widgets à droite de la barre de nav
        actions: regroupement de widgets à gauche de la barre de nav

      */
      title: const Text(
        'Store',
        style: TextStyle(
          color: Color.fromRGBO(255, 8, 255, 1),
          fontSize: 35,
          fontFamily: 'DMsans',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //naviguer vers un écran
            context.pushNamed('cart');
          },
          /*
          débogage :
          print : affichage de données simples
          inspect : affichae de données complexes
          */
          icon: const Icon(Icons.shopping_cart_checkout),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        )
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
