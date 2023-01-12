import 'package:flutter/material.dart';

import '../models/task.dart';
import '../screens/task_page.dart';

class TaskItem extends StatelessWidget {
  Function updateTaskItemFn;
  Function deleteTaskItemFn;
  final BuildContext context;
  final int index;
  final Task task;

  TaskItem(
      {super.key,
      required this.context,
      required this.index,
      required this.task,
      required this.updateTaskItemFn,
      required this.deleteTaskItemFn});

  switchToUpdateTask(BuildContext context) async {
    Task? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => TaskPage(newTask: task)));
    if (result != null) {
      updateTaskItemFn(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switchToUpdateTask(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(task.desc ?? "",
                    style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            GestureDetector(
                onTap: () {
                  deleteTaskItemFn(task);
                },
                child: Icon(Icons.delete, color: Colors.red, size: 20)),
          ],
        ),
      ),
    );
  }
}
