import 'package:flutter/material.dart';
import 'package:flutter_api/data/server_repo/server_repo.dart';
import 'package:flutter_api/data/server_web_service/server_web_service.dart';
import 'package:flutter_api/logic/cubit/server_cubit.dart';
import 'package:flutter_api/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(ServerRepo(ServerWebService())));
}

class MyApp extends StatelessWidget {
  final ServerRepo serverRepo;

  MyApp(this.serverRepo);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ServerCubit(serverRepo),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
