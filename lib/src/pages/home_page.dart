import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return ListView(
      children: _itemsList(),
    );
  }

  List<Widget> _itemsList() {
    return [
      ListTile(title: Text('adsasd')),
      Divider(),
      ListTile(title: Text('adsasd')),
      Divider(),
      ListTile(title: Text('adsasd')),
      Divider(),
    ];
  }
}
