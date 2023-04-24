import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = true;

  dynamic _listViewToggleItems(String name) {
    return Container(

      height: 60,
      // color: Colors.tealAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          _toggleButton(),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            _listViewToggleItems('Password'),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton() => Switch.adaptive(
      activeColor: Colors.pink,
      value: value,
      onChanged: (value) => setState(() {
            this.value = value;
          }));
}
