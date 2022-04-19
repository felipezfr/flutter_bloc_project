import 'package:flutter_bloc_project/models/client_model.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  Client client;

  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  Client client;

  RemoveClientEvent({
    required this.client,
  });
}

class ResetClientEvent extends ClientEvent {
  ResetClientEvent();
}
