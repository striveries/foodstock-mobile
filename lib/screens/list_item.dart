import 'package:flutter/material.dart';
import 'package:foodstock/screens/detail_item.dart';
import 'package:foodstock/screens/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:foodstock/models/item.dart';
import 'package:foodstock/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchItem(CookieRequest request) async {

  try {
    var response = await request.get('https://calista-sekar-tugas.pbp.cs.ui.ac.id/get-product/');

    // if (response.statusCode == 200) {
      // var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Item> list_item = [];

      for (var d in response) {
        if (d != null) {
          list_item.add(Item.fromJson(d));
        }
      }
      return list_item;
    // } else {
    //   // print('Raw Response: ${response.body}');
    //   // print('Content-Type: ${response.headers['content-type']}');

    //   throw Exception('Failed to load items. Invalid response.');
    // }
  } catch (e) {
    print('Error during fetchItem: $e');
    throw Exception('Failed to load items: $e');
  }
}


@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(request),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          var item = snapshot.data![index];

                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) =>
                                  DetailProductPage(item: item),
                                ),
                              );
                            },
                        child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.itemName}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                          }
                    );
                  }
                }
              }
        )
      );
    }
}