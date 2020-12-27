import 'package:flutter/widgets.dart';

class Data with ChangeNotifier {
  String _serverid;
  String _servername;
  String _serverip;

  String get getServerId => _serverid;
  String get getServerName => _servername;
  String get getServerIp => _serverip;

  void changeServer(String id, String name, String ip) {
    _serverid = id;
    _servername = name;
    _serverip = ip;
    notifyListeners();
  }
}
