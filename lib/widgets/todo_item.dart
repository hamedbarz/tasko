import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {

  final int id;
  final String title;
  final int isDone;
  Function toggleDone;
  Function deleteTodo;

  TodoItem(
      {super.key,
      required this.id,
      required this.title,
      required this.isDone,
      required this.toggleDone,
      required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleDone(id, isDone);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isDone==1 ? Colors.red[400] : Colors.grey[500],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: isDone==1
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        )
                      : null,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: isDone==1 ? Colors.red[400] : Colors.grey[800],
                      fontSize: 16,
                      decoration: isDone==1 ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  deleteTodo(id);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
