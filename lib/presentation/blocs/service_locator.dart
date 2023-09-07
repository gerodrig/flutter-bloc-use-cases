import 'package:bloc_app/config/config.dart';
import 'package:get_it/get_it.dart';

import 'package:bloc_app/presentation/blocs/blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(
      PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));
  getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(GeolocationCubit(
    onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
  )..watchUserLocation());
}
