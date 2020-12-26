import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/models/ServersModel.dart';

import 'DrawerItem.dart';

class ServersList extends StatefulWidget {
  ServersList({Key key}) : super(key: key);

  @override
  _ServersListState createState() => _ServersListState();
}

class _ServersListState extends State<ServersList> {
  // void initState() {
  //   super.initState();
  //   loadServers();
  // }

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [
    //     DrawerItem(
    //       title: 'Сервер 1',
    //       subtitle: '192.168.1.1',
    //     ),
    //     DrawerItem(
    //       title: 'Сервер 2',
    //       subtitle: '192.168.1.2',
    //     ),
    //   ],
    // );
    // return ListView.builder(
    //   itemCount: servers.length,
    //   itemBuilder: (context, i) {
    //     return DrawerItem(
    //       title: servers[i][0],
    //       subtitle: servers[i][1],
    //     );
    //   },
    // );
    return ValueListenableBuilder(
      valueListenable: Hive.box<Server>(HiveBoxes.servers).listenable(),
      builder: (context, Box<Server> box, _) {
        if (box.values.isEmpty)
          return Center(
            child: Text("Servers list is empty"),
          );
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Server res = box.getAt(index);
            return Dismissible(
              background: Container(color: Colors.red),
              key: Key(res.id),
              onDismissed: (direction) {
                box.delete(res.id);
              },
              child: DrawerItem(
                title: res.name,
                subtitle: res.ip,
              ),
            );
          },
        );
      },
    );
  }
}
