import 'package:flutter/material.dart';
import 'package:tasko/widgets/add_task_btn.dart';
import 'package:tasko/widgets/hero_section.dart';
import 'package:tasko/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  ), //Logo And Menu
                  const HeroSection(),
                  Expanded(
                      child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index)=> TaskItem(context: context, index: index)

                  )) //Task List
                ]),
                const Positioned(
                    bottom: 10,
                    left: 0,
                    child: AddTaskBtn())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
