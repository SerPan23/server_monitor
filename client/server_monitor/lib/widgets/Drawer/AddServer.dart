import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/main.dart';
import 'package:server_monitor/models/ServersModel.dart';

class AddServer extends StatelessWidget {
  const AddServer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}

void testAlert(BuildContext context) {
  final nameController = TextEditingController();
  final ipController = TextEditingController();
  // Navigator.of(context, rootNavigator: true).pop();
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
      FlatButton(
        child: Text("Закрыть"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      FlatButton(
        child: Text("Добавить"),
        onPressed: () {
          // print('name: ' + nameController.text + '\nip: ' + ipController.text);
          // servers.add([nameController.text, ipController.text]);
          Box<Server> serversBox = Hive.box<Server>(HiveBoxes.servers);
          serversBox.add(Server(
              id: UniqueKey().toString(),
              name: nameController.text,
              ip: ipController.text));

          Navigator.of(context, rootNavigator: true).pop();
        },
      )
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
