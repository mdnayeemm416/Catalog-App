import 'dart:convert';
import 'dart:html';

import 'package:chapter_1/models/catalogs.dart';
import 'package:chapter_1/widgets/drawer.dart';
import 'package:chapter_1/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
    loadjson();
  }

  loadjson() async {
    await Future.delayed(Duration(seconds: 2));
    final ItemJson = await rootBundle.loadString('files/item.json');
    final DecodeItem = jsonDecode(ItemJson);
    var itemData = DecodeItem['items'];
    CataLog.items =
        List.from(itemData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              title: const Center(child: Text('Flutter App')),
              backgroundColor: Colors.purpleAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: (CataLog.items != null && CataLog.items.isNotEmpty)
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16
                          ),
                      itemCount: CataLog.items.length,
                      itemBuilder: (context, index) {
                        final item = CataLog.items[index];
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: GridTile(
                              header: Container(
                                color: Colors.purpleAccent,
                                height: 25,
                                child: Center(
                                  child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(),
                                                              ),
                                ),
                              ),
                              footer: Text('${item.price}',textAlign: TextAlign.center,),
                              child: Image.network(item.image)),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.purpleAccent,
                      ),
                    ),
            )));
  }
}
