class Product {
  /*
    {}: paramètres nommés
    this: paramètres promu
    required : paramètres obligatoires
  */
  int id;
  String title, description, category, image;
  num price;
  Map rating;

  //constructeur
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating});
}
