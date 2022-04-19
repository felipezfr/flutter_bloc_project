import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/bloc/client_events.dart';
import 'package:flutter_bloc_project/bloc/client_state.dart';
import 'package:flutter_bloc_project/repositories/clients_repositories.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepo = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(clients: _clientRepo.loadClients()),
      ),
    );

    on<AddClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(clients: _clientRepo.addClient(event.client)),
      ),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(clients: _clientRepo.removeClient(event.client)),
      ),
    );

    on<ResetClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(clients: _clientRepo.resetClients()),
      ),
    );
  }
}
