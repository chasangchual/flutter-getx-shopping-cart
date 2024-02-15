import 'package:get/get.dart';
import 'package:getx_shopping_cart/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    var productData = [
      Product(id: 1, name: 'Mouse', description: 'Best gaming mouse', price: 30),
      Product(id: 2, name: 'Keyboard', description: 'Bluetooth wireless keyboard', price: 65),
      Product(id: 3, name: 'USB drive', description: '32G usb thumb drive', price: 20),
      Product(id: 4, name: 'Monitor', description: '32inch high resolution monitor', price: 45),
      Product(id: 5, name: 'USB Hub', description: '5 in 1 USB hub', price: 10),
      Product(id: 6, name: 'SSD', description: '2TB storage', price: 210),
      Product(id: 7, name: 'Wifi Router', description: '6n high speed wifi router', price: 110),
    ];

    products.assignAll(productData);
  }
}
