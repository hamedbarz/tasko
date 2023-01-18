
class Todo {
  int? id;
  String title;
  int isDone;
  int taskId;

  Todo({this.id, required this.title, required this.isDone, required this.taskId});

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      'title' : title,
      'is_done' : isDone,
      'task_id' : taskId
    };
  }

}