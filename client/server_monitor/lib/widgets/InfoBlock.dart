import 'package:flutter/material.dart';
import 'package:server_monitor/custom_icons_icons.dart';
import '../custom_icons_icons.dart';

class InfoBlock extends StatelessWidget {
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
                  Item(icon: CustomIcons.cpu, data: '30%'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Item(icon: CustomIcons.gpu, data: '1%'),
                  Item(icon: CustomIcons.ram, data: '20%'),
                  Item(icon: CustomIcons.harddrive, data: '9%'),
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
