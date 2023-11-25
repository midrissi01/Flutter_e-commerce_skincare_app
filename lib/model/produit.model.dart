class Produit{
  String name;
  String price;
  String description;
  String image;

  Produit({required this.name, required this.price, required this.description, required this.image});
  factory Produit.formJson(Map<String, dynamic> json){
    return Produit(name: json['name'], price: json['price'], description:json['description'], image: json['image']);
  }

}