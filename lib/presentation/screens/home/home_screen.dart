import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Bloc & Cubits',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
          title: 'A simple Block',
          subtitle: 'A simple Cubit used',
          location: '/simple-cubit',
        ),
        _CustomListTile(
            title: 'Cubit + Go_Router',
            subtitle: 'An applied use of Cubit with Go_Router',
            location: '/cubit-router'),
        _CustomListTile(
            title: 'Multiples cubits',
            subtitle: 'Multiple cubits in the same screen',
            location: '/cubit-state'),
        _CustomListTile(
            title: 'Bloc - GuestBloc',
            subtitle: 'A bloc to manage the guest state',
            location: '/guest-bloc'),
        _CustomListTile(
            title: 'Pokemon Bloc',
            subtitle: 'Bloc with futures and cache',
            location: '/pokemon-bloc'),
        _CustomListTile(
            title: 'Blocs con Blocs',
            subtitle: 'Blocs that use other blocs',
            location: '/blocs-with-blocs'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;

  const _CustomListTile(
      {required this.title, required this.subtitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
