import 'package:foodstock/screens/stocklist_form.dart';
import 'package:flutter/material.dart';

class InventoryItem {
  final String name;
  final IconData icon;
  final String nomorItem;

  InventoryItem(this.nomorItem, this.name, this.icon);
}

class Item {
  String name;
  int amount;
  String description;

  Item(this.name, this.amount, this.description);
}
