import 'package:flutter_bloc_project/models/client_model.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: 'Felipe'),
      Client(nome: 'Matheus'),
      Client(nome: 'Poliana'),
      Client(nome: 'Simba'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }

  List<Client> resetClients() {
    _clients.clear();
    return _clients;
  }
}
