import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(isDarkMode: darkMode));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode(bool darkMode) {
    emit(const ThemeState(isDarkMode: true));
  }

  void setLightMode(bool lightMode) {
    emit(const ThemeState(isDarkMode: false));
  }
}
