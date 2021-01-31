import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://townsquare.media/site/295/files/2020/10/hetfield.jpg?w=980&q=75'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loadingImage.gif'),
          image: NetworkImage(
              'https://www.futuro.cl/wp-content/uploads/2013/08/7c9544e195a78b3f93fc5c24d7d16a01.jpg'),
        ),
      ),
    );
  }
}
