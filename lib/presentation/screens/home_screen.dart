import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/data/models/server_model.dart';
import 'package:flutter_api/logic/cubit/server_cubit.dart';
import 'package:flutter_api/presentation/widgets/channels.dart';
import 'package:flutter_api/presentation/widgets/online_members.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Server serverData;
  late List<Member> members;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ServerCubit>(context).getAllServerData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
      builder: (context, state) {
        if (state is ServerDataLoaded) {
          serverData = state.serverData;
          return Scaffold(
            appBar: AppBar(
              title: Text(serverData.name),
            ),
            body: Container(
              child: Column(
                children: [
                  OnlineMembers(serverData.members),
                  ListTile(
                    title: Text("Channels "),
                  ),
                  Channels(channels: serverData.channels),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
