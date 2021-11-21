import 'package:flutter/material.dart';

class ListItem {
  final String mess;
  var item = <Widget>[];
  ListItem({required this.mess});
  List listItem() {
    for (var i = 0; i < 10; i++) {
      item.add(ListItem(mess: 'listView $i').testLietView());
    }
    return item;
  }

  Widget testLietView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.amber,
          child: Text(
            mess,
          ),
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
      ],
    );
  }
}
