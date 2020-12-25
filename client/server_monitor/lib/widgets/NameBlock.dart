import 'package:flutter/material.dart';

class NameBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Server name',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ip: 192.168.1.1',
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
