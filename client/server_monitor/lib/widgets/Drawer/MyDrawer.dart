import 'package:flutter/material.dart';
import 'package:server_monitor/widgets/Drawer/AddServer.dart';
import '../../custom_icons_icons.dart';
import 'ServersList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: new Text(
                "Сервера",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              leading: new Icon(
                CustomIcons.server,
                size: 30,
              ),
            ),
            Divider(height: 0.1),
            Expanded(child: ServersList()),
            Divider(height: 0.1),
            AddServer(),
          ],
        ),
      ),
    );
  }
}
