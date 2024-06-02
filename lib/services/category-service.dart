import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/category.dart';

class CategoryService {
  /*récupérer les produits
  Future équivalent promise en JS
  */
  Future<List<Category>> getCategory() async {
    // requête en GET
    Uri uri = Uri.parse('${Config.API_URL}/products/categories');
    http.Response response = await http.get(uri);

    //récupérer la réponse
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      //renvoyer liste d'objets
      return data
          .map((dynamic value) => Category(
                title: value['title'],
              ))
          .toList();
    } else {
      throw Error();
    }
  }
}
