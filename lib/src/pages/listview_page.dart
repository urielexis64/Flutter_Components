import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _numbersList = List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxPosition = _scrollController.position.maxScrollExtent;
      if (currentPosition == maxPosition) {
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lists')),
      body: Stack(
        children: [_createList(), _createLoading()],
      ),
    );
  }

  Widget _createList() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: FadeInImage(
              height: 200,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 200),
              image: NetworkImage(
                  'https://picsum.photos/500/300/?image=${_numbersList[index]}'),
              placeholder: AssetImage('assets/loadingImage.gif'),
            ),
          );
        });
  }

  void _add10() {
    for (var i = 1; i <= 10; i++) {
      _numbersList.add(++_lastItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    return Timer(Duration(seconds: 1), httpResponse);
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 300), curve: Curves.ease);

    _add10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
