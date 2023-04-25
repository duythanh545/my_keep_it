import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_keep_it/setting.dart';

import '../action_keep_it/add_page.dart';

var passwordHive = Hive.box('passwordHive');
List<Map<String, dynamic>> listHive = [];

Future<void> createItem(Map<String, dynamic> newItem) async {
  await passwordHive.add(newItem);
  print('Amount data is ${passwordHive.length}');
}

Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
  await passwordHive.put(itemKey, item);
  print('updated');
}

Future<void> deleteItem(int itemKey) async {
  await passwordHive.delete(itemKey);
}

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshItems();
  }

  void refreshItems() {
    var data = passwordHive.keys.map((key) {
      var item = passwordHive.get(key);
      return {'key': key, 'title': item['title'], 'password': item['password']};
    }).toList();

    setState(() {
      listHive = data.reversed.toList();
      print(listHive.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My keep it',
          ),
          actions: [
            //addItem
            IconButton(
                onPressed: () {
                  addNewPassword(context, null);
                  refreshItems();
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ));
                },
                icon: Icon(Icons.settings)),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final currentItem = listHive[index];
              return ListTile(
                title: Text(currentItem['title']),
                subtitle: Text(currentItem['password']),
                onTap: () {
                  addNewPassword(context, currentItem['key'].toInt());
                  refreshItems();
                },
                trailing: IconButton(
                  onPressed: () {
                    deleteItem(currentItem['key']);
                    refreshItems();
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
            itemCount: listHive.length,
          ),
        ));
  }
}
