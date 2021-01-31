import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          _card1(),
          SizedBox(
            height: 30.0,
          ),
          _card2(),
          SizedBox(
            height: 30.0,
          ),
          _card1(),
          SizedBox(
            height: 30.0,
          ),
          _card2(),
          SizedBox(
            height: 30.0,
          ),
          _card1(),
          SizedBox(
            height: 30.0,
          ),
          _card2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _card1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          ListTile(
            title: Text("Title 1"),
            subtitle: Text("Subtitle 1"),
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _card2() {
    final card = Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/loadingImage.gif'),
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('I have no idea what I\'m doing'))
        ],
      ),
    );

    return Container(
      child: card,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 12.0,
            spreadRadius: 0,
            offset: Offset(2, 6))
      ]),
    );
  }
}
