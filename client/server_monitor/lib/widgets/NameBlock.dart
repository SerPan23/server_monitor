import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:server_monitor/data/hiveboxes.dart';
import 'package:server_monitor/models/Data.dart';
import 'package:server_monitor/models/ServersModel.dart';

class NameBlock extends StatelessWidget {
  // final model = Provider.of<Data>().;
  final value;

  const NameBlock({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.getServerName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.getServerIp,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      height: 110,
      padding: EdgeInsets.all(20),
      width: double.infinity,
    );
  }
}
