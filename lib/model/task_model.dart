class TaskModel {
  String? title;
  bool? isCompleted;
  String? id;
  TaskModel({this.title, this.id, this.isCompleted});
  TaskModel copyWith({String? title, bool? isCompleted, String? id}) {
    return TaskModel(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isCompleted = json['isCompleted'] ?? false;
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (isCompleted != null) {
      data['isCompleted'] = isCompleted;
    } else {
      data['isCompleted'] = false; // Default value
    }
    data['id'] = id;
    return data;
  }
}
