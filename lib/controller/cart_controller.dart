import 'package:get/get.dart';
import 'package:getx_shopping_cart/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get total => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);
  }
}
