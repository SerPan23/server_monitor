import 'package:flutter/material.dart';

import 'DrawerItem.dart';

class ServersList extends StatefulWidget {
  ServersList({Key key}) : super(key: key);

  @override
  _ServersListState createState() => _ServersListState();
}

class _ServersListState extends State<ServersList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerItem(
          title: 'Сервер 1',
          subtitle: '192.168.1.1',
        ),
        DrawerItem(
          title: 'Сервер 2',
          subtitle: '192.168.1.2',
        ),
      ],
    );
  }
}
