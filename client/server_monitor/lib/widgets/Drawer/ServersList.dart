import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/models/Data.dart';
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
            child: Text("Список серверов пуст"),
          );
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Server res = box.getAt(index);
            return Dismissible(
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: AlignmentDirectional.centerStart,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              key: Key(UniqueKey().toString()),
              // key: Key(index.toString()),
              onDismissed: (direction) {
                // box.delete(res.id);
                // setState(() {
                //   // res.removeAt(index);
                //   box.deleteAt(index);
                // });
                setState(() {
                  // box.deleteAt(index);
                  var server = box.getAt(index);
                  final model = Provider.of<Data>(context, listen: false);
                  if (server.id == model.getServerId)
                    model.changeServer(null, null, null);
                  box.deleteAt(index);
                });
              },
              child: DrawerItem(
                id: res.id,
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
