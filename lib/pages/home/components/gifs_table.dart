import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:share/share.dart';

class GifsTable extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final BuildContext context;
  final String search;

  const GifsTable({Key key, this.snapshot, this.context, this.search})
      : super(key: key);

  @override
  Widget build(context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemCount: _getCount(snapshot.data["data"]),
      itemBuilder: (context, index) {
        if (search == null || index < snapshot.data["data"].length) {
          return GestureDetector(
            child: Image.network(
              snapshot.data["data"][index]["images"]["fixed_height"]["url"],
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Get.toNamed(
                "/gif_page",
                arguments: snapshot.data["data"][index],
              );
            },
            onLongPress: () {
              Share.share(snapshot.data["data"][index]["images"]["fixed_height"]
                  ["url"]);
            },
          );
        } else {
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white, size: 70.0),
                  Text(
                    "Carregar mais...",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ],
              ),
              onTap: () {
                /* setState(() {
                _offSet += 19;
              }); */
              },
            ),
          );
        }
      },
    );
  }

  int _getCount(List data) {
    if (search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }
}
