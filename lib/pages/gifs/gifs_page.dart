import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GifsPage extends StatelessWidget {
  final Map gifData;

  const GifsPage({Key key, this.gifData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gifData["title"], style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              color: Colors.white,
              onPressed: () {
                Share.share(gifData["images"]["fixed_height"]["url"]);
              }),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
