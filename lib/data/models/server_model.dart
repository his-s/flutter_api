class Server {
  late String id;
  late String name;
  late List<dynamic> channels;
  List<Member>? members;
  late int presenceCount;
  Server.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    channels = json["channels"];
    members = json["members"].map((m) {
      return Member.fromJson(m);
    }).toList().cast<Member>();

    presenceCount = json["presence_count"];
  }
}

class Member {
  late String id;
  late String userName;
  late String discriminator;

  late String status;
  late String avatarUrl;
  Member.fromJson(Map<String, dynamic> json) {
      id = json["id"];
      userName = json["username"];
      discriminator = json["discriminator"];
      status = json["status"];
      avatarUrl = json["avatar_url"];
  }
}

class Game {
  late String name;
  Game.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}

class Channel {
  late String id;
  late String name;
  late int position;
  Channel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    position = json["position"];
  }
}
