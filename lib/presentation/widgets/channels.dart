import 'package:flutter/material.dart';
import 'package:flutter_api/data/models/server_model.dart';

class Channels extends StatelessWidget {
  final List<Channel> channels;

  const Channels({Key? key, required this.channels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    channels.sort((a, b) => a.position.compareTo(b.position));
    return Container(
      child: Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: channels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                tileColor: Colors.black12,
                leading: Icon(Icons.volume_up_rounded),
                title: Text(channels[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}
