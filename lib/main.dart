//importation des packages
//bibliothèque de design
import 'package:flutter/material.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/services/router_service.dart';
import 'package:provider/provider.dart';

//fonction main : point d'entrée de l'application
void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
        ],
        child: const Store(),
      ),
    );

// widget (composant) Store : représente l'appli
class Store extends StatelessWidget {
  const Store({super.key});

  // méthode build permet de définir l'interface visuelle du widget
  /*
    architecture :
      MaterialApp : représente l'application
        Scaffold : permet d'architecturer l'application
        > premier écran
    principaux widgets : 
    - SingleChildScrollView : créer un ascenseur
    - Row : alignement horizontal de plusieurs widgets
    - Column : alignement vertcical de plusieurs widgets
    - Text ; afficher un texte
    - Icone : afficher un icone
    - Image : afficher une image
    - OutlinedButton: bouton
    - Container : créer un bloc

  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Store",
      // home: const HomeScreen(),
      routerConfig: RouterService.getRouter(),
    );
  }
}
