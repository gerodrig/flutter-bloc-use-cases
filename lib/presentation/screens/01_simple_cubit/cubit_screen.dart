import 'package:bloc_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_app/presentation/blocs/blocs.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: BlocBuilder<UsernameCubit, String>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, username) {
                return Text(
                  username,
                  style: const TextStyle(fontSize: 24),
                );
              })),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[900],
          child: const Icon(Icons.refresh_outlined, color: Colors.white),
          onPressed: () {
            context
                .read<UsernameCubit>()
                .setUsername(RandomGenerator.getRandomName());
          }),
    );
  }
}
