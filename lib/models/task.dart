
class Task {
  int? id;
  String title;
  String? desc;

  Task({this.id, required this.title, this.desc});

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      'title' : title,
      'desc' : desc
    };
  }
}
