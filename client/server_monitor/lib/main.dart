import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/models/ServersModel.dart';

import 'widgets/Drawer/MyDrawer.dart';
import 'widgets/InfoBlock.dart';
import 'widgets/NameBlock.dart';
import 'custom_icons_icons.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ServerAdapter());
  await Hive.openBox<Server>(HiveBoxes.servers);
  // serversbox.add(Server(name: 'server', ip: '192.168.1.1'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final navKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navKey,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Test app'),
        //   backgroundColor: Color.fromARGB(255, 91, 50, 159),
        // ),
        body: SafeArea(
          child: MainWidget(),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFFc5cae9),
          child: Column(
            children: [
              NameBlock(),
              InfoBlock(),
            ],
          ),
        ),
        Positioned(
          child: FloatingActionButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: Icon(CustomIcons.server),
          ),
          bottom: 20,
          right: 20,
        ),
      ],
    );
  }
}
