import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {

  final BuildContext context;
  final int index;

  const TaskItem({super.key, required this.context, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const Text(
                "کار فلان",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("توضیحات کار فلان هست این",
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const Icon(Icons.delete, color: Colors.red, size: 20),
        ],
      ),
    );
  }
}
