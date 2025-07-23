import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });

    on<CounterDecrement>((event, emit) {
      emit(CounterUpdate(state.count - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdate(json['count']);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {'count': state.count};
  }
}
