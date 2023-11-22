import 'package:flutter/material.dart';
import 'package:foodstock/models/item.dart';

class DetailProductPage extends StatelessWidget {
  final Item item;

  const DetailProductPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.itemName),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.fields.itemName}'),
            Text('Amount: ${item.fields.amount}'),
            Text('Description: ${item.fields.description}'),
          ],
        ),
      ),
    );
  }
}