import 'package:bloc/bloc.dart';
import 'package:flutter_api/data/models/server_model.dart';
import 'package:flutter_api/data/server_repo/server_repo.dart';
import 'package:meta/meta.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  final ServerRepo serverRepo;
  late Server serverData;
  late List<Member> members;
  ServerCubit(this.serverRepo) : super(ServerInitial());
  Server getAllServerData() {
    serverRepo.getServerAllData().then((serverData) {
      emit(ServerDataLoaded(serverData));
      this.serverData = serverData;
    });
    return serverData;
  }
}
