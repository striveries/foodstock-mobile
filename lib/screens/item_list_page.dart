import 'package:flutter/material.dart';
import 'stocklist_form.dart';
import 'menu.dart';
import 'package:foodstock/widgets/stock_card.dart';


class ItemListPage extends StatelessWidget {
  final List<Item> items; // List dari Item
  ItemListPage(this.items); // Konstruktor menerima list dari Item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Item')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(items[index].name, style: TextStyle(fontSize: 22)),
                Text(items[index].amount.toString(), style: TextStyle(fontSize: 22)),
                Text(items[index].description, style: TextStyle(fontSize: 22)),
                SizedBox(height: 10), // Memberikan sedikit ruang antar item
              ],
            );
          },
        ),
      ),
    );
  }
}
