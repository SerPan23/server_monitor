import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/models/Data.dart';
import 'package:server_monitor/models/ServersModel.dart';
import 'package:http/http.dart' as http;

import 'widgets/Drawer/MyDrawer.dart';
import 'widgets/InfoBlock.dart';
import 'widgets/NameBlock.dart';
import 'custom_icons_icons.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ServerAdapter());
  await Hive.openBox<Server>(HiveBoxes.servers);
  // Provider.debugCheckInvalidValueType = null;
  // serversbox.add(Server(name: 'server', ip: '192.168.1.1'));
  runApp(
    ChangeNotifierProvider(create: (context) => Data(), child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static final navKey = new GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    // return Stack(
    //   children: [
    //     ValueListenableBuilder(
    //       valueListenable: Hive.box<Server>(HiveBoxes.servers).listenable(),
    //       builder: (context, Box<Server> box, _) {
    //         if (box.values.isEmpty)
    //           return Center(
    //             child: Text("Список серверов пуст"),
    //           );
    //         else if (Data().getServerId == null)
    //           return Center(
    //             child: Text("Сервер не выбран"),
    //           );
    //         return Container(
    //           color: Color(0xFFc5cae9),
    //           child: Column(
    //             children: [
    //               NameBlock(),
    //               InfoBlock(),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //     Positioned(
    //       child: FloatingActionButton(
    //         onPressed: () => Scaffold.of(context).openDrawer(),
    //         child: Icon(CustomIcons.server),
    //       ),
    //       bottom: 20,
    //       right: 20,
    //     ),
    //   ],
    // );
    return Stack(
      children: [
        Consumer<Data>(
          builder: (context, value, _) {
            if (value.getServerId == null) {
              return Center(
                child: Text("Сервер не выбран"),
              );
            }
            return Container(
              color: Color(0xFFc5cae9),
              child: Column(
                children: [
                  NameBlock(value: value),
                  InfoBlock(value: value),
                ],
              ),
            );
          },
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
