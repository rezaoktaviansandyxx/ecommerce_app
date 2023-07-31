import 'package:ecommerce_app/screen/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItem extends GetView<HomeController> {
  const CustomListItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.price})
      : super(key: key);

  final Widget image;
  final String title;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: image,
        ),
        Expanded(
            flex: 3,
            child:
                _ListItem(title: title, description: description, price: price))
      ]),
    );
  }
}

// ignore: unused_element
class _ListItem extends GetView<HomeController> {
  const _ListItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.price})
      : super(key: key);

  final String title;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 5),
        Text(
          '\$ $price',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ]),
    );
  }
}
