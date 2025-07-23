import 'package:bloc_cubit/model/task_model.dart';
import 'package:equatable/equatable.dart';

sealed class ToDoStateBloc extends Equatable {
  final List<TaskModel> tasks;
  const ToDoStateBloc(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

final class ToDoInitial extends ToDoStateBloc {
  ToDoInitial() : super([]);
}

final class UpdateTask extends ToDoStateBloc {
  const UpdateTask(super.tasks);
}
