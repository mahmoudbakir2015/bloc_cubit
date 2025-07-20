part of 'counter_bloc.dart';

sealed class CounterState {
  final int count;
  CounterState(this.count);
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

final class CounterUpdate extends CounterState {
  CounterUpdate(super.count);
}
