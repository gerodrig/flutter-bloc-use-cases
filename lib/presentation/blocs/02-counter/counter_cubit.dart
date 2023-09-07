import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1);

  void increment(int value) => emit(state + value);
  void decrement(int value) => emit(state - value);
}
