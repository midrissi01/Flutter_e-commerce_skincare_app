
import 'package:untitled/model/produit.model.dart';
class ProduitService{
  List<Map<String,dynamic>> data = [
  {
    'name': 'Rose water',
    'price': '250',
    'description':'natural Serum for hair growth',
    'image': 'assets/rose_water.jpeg',

  },
  {

    'name': 'Serum',
    'price': '350',
    'description':'natural Serum for skin glow',
    'image': 'assets/serom1.jpg',
  },
  {
    'name': 'Argan shampoo',
    'price': '400',
    'description':'Morrocan Argan shampoo for healthy hair',
    'image':'assets/shampoo.jpeg',

  },
  {
    'name': 'Argan soap',
    'price': '30',
    'description':'Morrocan Argan soap for skin nutrition',
    'image':'assets/soap.jpg',

  },
    {
      'name': 'Serum collagen',
      'price': '450',
      'description':'Serum collagen for skin nutrition and eternal youth',
      'image':'assets/serum_et_feuille.PNG',

    },
    {
      'name': 'Hand creme',
      'price': '120',
      'description':'Serum collagen for skin nutrition and eternal youth',
      'image':'assets/creme.PNG',

    },
    {
      'name': 'Gamme khlala',
      'price': '520',
      'description':'Sets for hair protection and nutrition',
      'image':'assets/gamme.PNG',

    }
];
  List<Produit> allProduits(){
    return data.map((p) => Produit.formJson(p)).toList();
  }
}