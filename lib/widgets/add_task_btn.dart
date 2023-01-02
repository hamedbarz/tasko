import 'package:flutter/material.dart';
import '../screens/task.dart';

class AddTaskBtn extends StatelessWidget {
  const AddTaskBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const TaskPage()));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
