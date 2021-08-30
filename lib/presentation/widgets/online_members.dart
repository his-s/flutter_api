import 'package:flutter/material.dart';
import 'package:flutter_api/data/models/server_model.dart';

class OnlineMembers extends StatelessWidget {
  OnlineMembers(this.members);
  final List<Member> members;
  String shortnessName(String name) {
    if (name.length > 9) {
      return name.substring(0, 9);
    }
    return name;
  }

  Color getStatusColor(String status) {
    if (status == "online") {
      return Colors.green;
    }
    return Colors.orangeAccent;
  }

  Widget customToolTib(Member member, Widget child) {
    return Tooltip(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      message: member.status.toUpperCase(),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: child,
    );
  }

  getStatus() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: members.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        foregroundImage: NetworkImage(
                          members[index].avatarUrl,
                        ),
                      ),
                      customToolTib(
                        members[index],
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor:
                                getStatusColor(members[index].status),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(shortnessName(members[index].userName)),
                ],
              ),
            );
          }),
    );
  }
}
