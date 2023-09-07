import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_app/presentation/blocs/blocs.dart';
import 'package:bloc_app/config/config.dart';

class MultipleCubitsScreen extends StatelessWidget {
  const MultipleCubitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    final themeCubit = context.watch<ThemeCubit>();
    final usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubit Screen'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: themeCubit.state.isDarkMode
                ? const Icon(Icons.dark_mode_outlined, size: 100)
                : const Icon(Icons.light_mode_outlined, size: 100),
            onPressed: () {
              themeCubit.toggleTheme();
            },
          ),
          Text(usernameCubit.state, style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text('${counterCubit.state}',
                style: const TextStyle(fontSize: 100)),
            onPressed: () {
              counterCubit.increment(1);
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Random name'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          usernameCubit.setUsername(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
