import 'package:flutter_api/data/models/server_model.dart';
import 'package:flutter_api/data/server_web_service/server_web_service.dart';

class ServerRepo {
  final ServerWebService serverWebService;
  ServerRepo(this.serverWebService);
  Future<Server> getServerAllData() async {
    final serverData = await serverWebService.getServerAllData();
    return Server.fromJson(serverData);
  }
}
