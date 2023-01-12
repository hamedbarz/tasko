import 'package:flutter/material.dart';
import 'package:tasko/providers/database/database_core.dart';
import 'package:tasko/providers/database/task_db.dart';
import 'package:tasko/widgets/btn_add.dart';
import 'package:tasko/widgets/hero_section.dart';
import 'package:tasko/widgets/task_item.dart';

import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  String test = 'startApp';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskDB taskDb = TaskDB();
  List<Task> taskList = [];

  addTaskToList(Task newTask) async {
    setState(() {
      taskList.add(newTask);
    });

    int id = await taskDb.add(newTask);
    print(id.toString());
  }

  updateTaskItem(Task taskItem) {
    List<Task> newTaskList = taskList.map((oldItemTask) {
      if (oldItemTask.id == taskItem.id) {
        return taskItem;
      } else {
        return oldItemTask;
      }
    }).toList();
    setState(() {
      taskList = newTaskList;
    });

    taskDb.update(taskItem.id ?? 0, taskItem);
  }

  deleteTaskItem(Task taskItem) {
    setState(() {
      taskList.removeWhere((item) => item.id == taskItem.id);
    });
    taskDb.delete(taskItem.id);
  }

  @override
  void initState() {
    super.initState();
    widget.test = 'initState';
    print("_______________________initState____________________________");
    TaskDB().getAll().then((List<Task> value) {
      setState(() {
        taskList = value;
      });
    });
    print(
        "_______________________initState after DB ____________________________");
  }

  @override
  Widget build(BuildContext context) {
    print("_______________________build____________________________");
    print(widget.test);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Stack(
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Image(
                        image: AssetImage("assets/images/tasko_logo.png"),
                        width: 40,
                        height: 40,
                      ),
                      Icon(Icons.menu, size: 32),
                    ],
                  ),
                  //Logo And Menu
                  const HeroSection(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (context, index) => TaskItem(
                              context: context,
                              index: index,
                              task: taskList[index],
                              updateTaskItemFn: updateTaskItem,
                              deleteTaskItemFn: deleteTaskItem)))
                  //Task List
                ]),
                Positioned(
                    bottom: 10,
                    left: 0,
                    child: BtnAdd(addNewTaskFn: addTaskToList))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
