import 'package:flutter/material.dart';
import 'package:tasko/screens/task.dart';

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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "کارها رو مدیریت کن",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "با App راکت کارهای شخصی خودت رو منظم کن و با مدیریت کامل به اون ها رسیدگی کن",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ), //Hero Section
                  Expanded(
                      child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(5),
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("توضیحات کار فلان هست این",
                                    style: TextStyle(color: Colors.grey[600])),
                              ],
                            ),
                            const Icon(Icons.delete,
                                color: Colors.red, size: 20),
                          ],
                        ),
                      );
                    },
                  )) //Task List
                ]),
                Positioned(
                    bottom: 10,
                    left: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskPage()));
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
