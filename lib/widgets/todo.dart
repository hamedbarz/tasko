import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  //const TodoItem({Key? key}) : super(key: key);

  String title;
  bool isDone;

  TodoItem({super.key, required this.title, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isDone ? Colors.red[400] : Colors.grey[500],
              borderRadius: BorderRadius.circular(5),
            ),
            child: isDone ? Icon(Icons.check, color: Colors.white, size: 14,) : null,
          ),
          Text(title,
            style: TextStyle(
                color: isDone ? Colors.red[400] : Colors.grey[800],
                fontSize: 16,
                decoration: isDone ? TextDecoration.lineThrough : null
            ),
          ),
        ],
      ),
    );
  }
}
