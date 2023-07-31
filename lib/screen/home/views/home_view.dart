import 'package:ecommerce_app/screen/home/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.listProductProvider.products.isEmpty) {
          // Show a loading indicator while data is being fetched.
          return const Center(child: CircularProgressIndicator());
        } else {
          // Show the ListView with the fetched products.
          return ListView.builder(
            itemCount: controller.listProductProvider.products.length,
            itemBuilder: (context, index) {
              return Card(
                  child: CustomListItem(
                image: Image.network(
                    controller.listProductProvider.products[index].image!),
                title: controller.listProductProvider.products[index].title!,
                description:
                    controller.listProductProvider.products[index].description!,
                price: controller.listProductProvider.products[index].price!,
              ));
            },
          );
        }
      }),
    );
  }
}
