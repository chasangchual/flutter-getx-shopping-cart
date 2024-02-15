import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controller/cart_controller.dart';
import 'package:getx_shopping_cart/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.products[index].name, style: TextStyle(fontSize: 24)),
                                    Text(controller.products[index].description, style: TextStyle(fontSize: 12))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          cartController.addToCart(controller.products[index]);
                                        },
                                        child: Text('Add to cart'))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          SizedBox(
            height: 25,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total Amount: ${controller.total}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
          SizedBox(
            height: 140,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text('${controller.count} items', style: TextStyle(fontSize: 20, color: Colors.white));
        }),
        icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.white),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
