import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:server_monitor/custom_icons_icons.dart';
import '../custom_icons_icons.dart';

class InfoBlock extends StatefulWidget {
  final value;
  const InfoBlock({Key key, this.value}) : super(key: key);

  @override
  _InfoBlockState createState() => _InfoBlockState(value);
}

class _InfoBlockState extends State<InfoBlock> {
  final _value;
  Timer _timer;
  _InfoBlockState(this._value) {
    _timer = new Timer.periodic(Duration(seconds: 10), (timer) {
      // print(_value.getServerId);
      post();
    });
  }

  void initState() {
    super.initState();
    post();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  var _data = {'cpu': 0.0, 'ram': 0.0, 'hdd': 0.0};

  void post() async {
    try {
      var header = {
        "Content-Type": "application/json",
      };
      // var url = 'http://192.168.1.5:8000/servermonitor';
      var url = _value.getServerIp;
      var response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        // print(json.decode(response.body));
        var res = json.decode(response.body);
        setState(() {
          _data['cpu'] = res['cpu'];
          _data['ram'] = res['ram'];
          _data['hdd'] = res['hdd'];
          print(_data);
        });
      } else {
        print(response.body);
      }
    } on SocketException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'Информация о сервере:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Item(icon: Icons.rotate_right, data: 30),
                  Item(
                      icon: CustomIcons.cpu,
                      data: _data['cpu'].toString() + '%'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Item(icon: CustomIcons.gpu, data: '1%'),
                  Item(
                      icon: CustomIcons.ram,
                      data: _data['ram'].toString() + '%'),
                  Item(
                      icon: CustomIcons.harddrive,
                      data: _data['hdd'].toString() + '%'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Btn(
                    text: 'Стоп',
                    color: Color.fromRGBO(244, 81, 30, 1),
                  ),
                  Btn(
                    text: 'Рестарт',
                    color: Color.fromRGBO(0, 160, 227, 1),
                  ),
                  Btn(
                    text: 'Старт',
                    color: Color.fromRGBO(76, 175, 80, 1),
                  ),
                ],
              ),
            )
          ],
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color.fromRGBO(46, 46, 46, 0.5),
            ),
          ],
          color: Color(0xFFfafafa),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final icon;
  final data;
  const Item({Key key, this.icon, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
          ),
          Text(
            '$data',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final text;
  final color;
  const Btn({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // margin: EdgeInsets.all(7),
        height: 40.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: color)),
          onPressed: () {},
          padding: EdgeInsets.all(10.0),
          color: Colors.white,
          textColor: color,
          child: Text(
            "$text",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
