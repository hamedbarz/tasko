import 'package:flutter/material.dart';
import 'package:tasko/models/task.dart';
import '../screens/task_page.dart';

class BtnAdd extends StatefulWidget {
  final Function addNewTaskFn;

  BtnAdd({required this.addNewTaskFn});

  // const BtnAdd({Key? key, required this.sssss}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BtnAddSate();
}

class _BtnAddSate extends State<BtnAdd> {
  switchToCreatetask(context) async {
    Task? result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskPage()));
    if (result != null)
      widget.addNewTaskFn(result);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => switchToCreatetask(context),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red[400], borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
