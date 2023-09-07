import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/config/router/app_router.dart';

class CubitRouterScreen extends StatelessWidget {
  const CubitRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cubi Router Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.read<RouterSimpleCubit>().goBack(),
        ),
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text('Benito Martinez'),
      ),
    );
  }
}
