import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessible_forward_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void showAlert(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Alert'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('Hi, this is an alert!'), FlutterLogo(size: 100)],
        ),
        actions: [
          FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('CANCEL')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('OK'))
        ],
      ),
    );
  }
}
