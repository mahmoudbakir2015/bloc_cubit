import 'package:bloc_cubit/model/task_model.dart';

sealed class ToDoStateBloc {
  final List<TaskModel> tasks;
  const ToDoStateBloc(this.tasks);
}

final class ToDoInitial extends ToDoStateBloc {
  ToDoInitial() : super([]);
}

final class UpdateTask extends ToDoStateBloc {
  UpdateTask(super.tasks);
}
