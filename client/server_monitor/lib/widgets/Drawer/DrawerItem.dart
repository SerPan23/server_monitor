import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_monitor/models/Data.dart';

class DrawerItem extends StatelessWidget {
  final title;
  final subtitle;
  final id;
  const DrawerItem({Key key, this.title, this.subtitle, this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print("Item container clicked");
        final model = Provider.of<Data>(context, listen: false);
        model.changeServer(id, title, subtitle);
        // print(model.getServerId);
        Navigator.of(context, rootNavigator: true).pop();
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
