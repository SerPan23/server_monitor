import 'package:hive/hive.dart';
part 'ServersModel.g.dart';

@HiveType(typeId: 0)
class Server {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String ip;

  Server({this.id, this.name, this.ip});
}
