sealed class ToDoEvent {}

final class AddTaskEvent extends ToDoEvent {
  final String title;

  AddTaskEvent(this.title);
}

final class RemoveTaskEvent extends ToDoEvent {
  final String id;

  RemoveTaskEvent(this.id);
}

final class ToggleTaskCompletionEvent extends ToDoEvent {
  final String id;

  ToggleTaskCompletionEvent(this.id);
}
