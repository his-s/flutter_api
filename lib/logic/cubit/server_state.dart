part of 'server_cubit.dart';

@immutable
abstract class ServerState {}

class ServerInitial extends ServerState {}

class ServerDataLoaded extends ServerState {
  final Server serverData;

  ServerDataLoaded(
    this.serverData,
  );
}
