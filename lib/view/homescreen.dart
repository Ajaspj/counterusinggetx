import 'package:counterusinggetx/controller/cartcontroller.dart';
import 'package:counterusinggetx/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final Cartcontroller cartController = Get.put(Cartcontroller());

    cartController.fetchdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.list.isEmpty) {
          return Center(
            child: Text('No items in the cart'),
          );
        }

        return ListView.separated(
          itemCount: cartController.list.length,
          itemBuilder: (BuildContext context, int index) {
            Carts c = cartController.list[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cart ID: ${c.id}"),
                    Text("User ID: ${c.userId}"),
                    Text("Total Quantity: ${c.totalQuantity}"),
                    Text("Total Products: ${c.totalProducts}"),
                    Text("Discounted Total: ${c.discountedTotal}"),
                    SizedBox(height: 10),
                    if (c.products != null && c.products!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: c.products!.map((product) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${product.thumbnail}"))),
                                    ),
                                    Text("Product ID: ${product.id}"),
                                    Text("Product Name: ${product.title}"),
                                    Text("Quantity: ${product.quantity}"),
                                    Text("Price: ${product.price}"),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    if (c.products == null || c.products!.isEmpty)
                      Text('No products in this cart'),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        );
      }),
    );
  }
}
