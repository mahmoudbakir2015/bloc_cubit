import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });

    on<CounterDecrement>((event, emit) {
      emit(CounterUpdate(state.count - 1));
    });
  }
}
