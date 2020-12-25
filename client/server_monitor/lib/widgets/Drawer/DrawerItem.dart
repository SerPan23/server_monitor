import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final title;
  final subtitle;
  const DrawerItem({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Item container clicked");
      },
      child: ListTile(
        title: new Text(
          "$title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: new Text("$subtitle"),
        leading: new Icon(
          Icons.computer,
          size: 29,
        ),
      ),
    );
  }
}
