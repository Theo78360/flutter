import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/product.dart';

class ProductsService {
  /*récupérer les produits
  Future équivalent promise en JS
  */
  Future<List<Product>> getProducts() async {
    // requête en GET
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response response = await http.get(uri);

    //récupérer la réponse
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      //renvoyer liste d'objets
      return data
          .map((dynamic value) => Product(
              id: value['id'],
              title: value['title'],
              description: value['description'],
              category: value['category'],
              image: value['image'],
              price: value['price'],
              rating: value['rating']))
          .toList();
    } else {
      throw Error();
    }
  }
}
