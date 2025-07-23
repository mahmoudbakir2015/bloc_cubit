part of 'to_do_cubit.dart';

sealed class ToDoState extends Equatable {
  final List<TaskModel> tasks;
  const ToDoState(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

final class ToDoInitial extends ToDoState {
  ToDoInitial() : super([]);
}

final class UpdateTask extends ToDoState {
  const UpdateTask(super.tasks);
}
