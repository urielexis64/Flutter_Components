import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Components Temp'),
        ),
        body: ListView(
          children: _createShortItems(),
        ),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (String option in options) {
      final tempWidget = ListTile(
        title: Text(option),
      );

      //Cascade operator
      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _createShortItems() => options
      .map((item) => Column(children: [
            ListTile(
              subtitle: Text('data'),
              title: Text(item),
              leading: Icon(Icons.accessibility_sharp),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            Divider()
          ]))
      .toList();
}
