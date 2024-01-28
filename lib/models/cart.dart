import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(name:'Zoom Freak', price:'236', imagePath:'lib/images/nike joyride.jpg',
        description:'Forward thinking design'),
    Shoe(name:'Air Jordans', price:'2206', imagePath:'lib/images/nike air max.jpg',
        description:'It\'s all here with us'),
    Shoe(name:'KD Treys', price:'240',imagePath: 'lib/images/nike invincible.jpg',
        description:'A secure mid foot strap'),
    Shoe(name:'Kyrie 6', price:'190',imagePath: 'lib/images/nike sneakers.jpg',
        description:'Bouncy cushioning paired with yet foam'),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemToCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();

  }
}
