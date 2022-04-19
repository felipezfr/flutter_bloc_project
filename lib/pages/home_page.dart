import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/client_bloc.dart';
import 'package:flutter_bloc_project/bloc/client_events.dart';
import 'package:flutter_bloc_project/bloc/client_state.dart';
import 'package:flutter_bloc_project/models/client_model.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return ['Joao', 'Maria', 'Snow', 'Abilio'].elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.add(AddClientEvent(client: Client(nome: randomName())));
            },
          ),
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: () {
              bloc.add(ResetClientEvent());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc, ClientState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ClientInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ClientSuccessState) {
                final clientsList = state.clients;
                return ListView.separated(
                  itemCount: clientsList.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: ClipRRect(
                        child: Text(clientsList[index].nome.substring(0, 1)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    title: Text(clientsList[index].nome),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        bloc.add(RemoveClientEvent(client: clientsList[index]));
                      },
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
