import 'package:bloc_app/config/router/app_router.dart';
import 'package:bloc_app/config/theme/app_theme.dart';
import 'package:bloc_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UsernameCubit>()),
        BlocProvider(create: (context) => getIt<RouterSimpleCubit>()),
        BlocProvider(create: (context) => getIt<CounterCubit>()),
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => getIt<GuestsBloc>()),
        BlocProvider(create: (context) => getIt<PokemonBloc>()),
        BlocProvider(create: (context) => getIt<GeolocationCubit>()),
        BlocProvider(create: (context) => getIt<HistoricLocationBloc>()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      title: 'Flutter Bloc & Cubits',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: theme.isDarkMode).getTheme(),
    );
  }
}
