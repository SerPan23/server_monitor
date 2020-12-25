import 'package:flutter/material.dart';

import 'widgets/InfoBlock.dart';
import 'widgets/NameBlock.dart';
import 'custom_icons_icons.dart';

void main() {
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
        drawer: Drawer(
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
                Divider(
                  height: 0.1,
                ),
                Expanded(
                  child: ListView(
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
                  ),
                ),
                Divider(
                  height: 0.1,
                ),
                InkWell(
                  onTap: () {
                    final context = MyApp.navKey.currentState.overlay.context;
                    //Navigator.pop(context, true);
                    testAlert(context);
                  },
                  child: ListTile(
                    title: new Text(
                      "Добавить сервер",
                    ),
                    leading: new Icon(
                      Icons.add,
                      size: 29,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void testAlert(BuildContext context) {
    final nameController = TextEditingController();
    final ipController = TextEditingController();
    var alert = AlertDialog(
      scrollable: true,
      title: Text('Добавить сервер'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Название',
                  // icon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: 'IP',
                  // icon: Icon(Icons.computer),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        RaisedButton(
            child: Text("Добавить"),
            onPressed: () {
              print('name: ' +
                  nameController.text +
                  '\nip: ' +
                  ipController.text);
              Navigator.of(context, rootNavigator: true).pop();
            })
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
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
        // Positioned(
        //   child: IconButton(
        //     icon: Icon(CustomIcons.server),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
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

class DrawerItem extends StatelessWidget {
  final title;
  final subtitle;
  const DrawerItem({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
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
      ),
    );
  }
}
