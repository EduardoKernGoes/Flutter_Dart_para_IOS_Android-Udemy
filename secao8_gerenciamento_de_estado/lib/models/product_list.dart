import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secao8_gerenciamento_de_estado/data/dummy_data.dart';
import 'package:secao8_gerenciamento_de_estado/models/product.dart';

class ProductList with ChangeNotifier{
  final _url = 'https://shop-cod3r-de72a-default-rtdb.firebaseio.com/products.json';
  List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;

  List<Product> get items {
    if(_showFavoriteOnly){
      return _items.where((prod) => prod.isFavorite).toList();
    }
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void showFavoriteOnly(){
    _showFavoriteOnly = true;
    notifyListeners();
  }
  void showAll(){
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product){
    http.post(
      Uri.parse(_url),
      body: jsonEncode({
        "name": product.title,
        "description": product.description,
        "price": product.price,
        "imageUrl": product.imageUrl,
        "isFavorite": product.isFavorite,
      })
    );

    _items.add(product);
    notifyListeners();
  }
}