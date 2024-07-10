import 'package:api_infolabz_intern/tabs/my_task_one_tab.dart';
import 'package:api_infolabz_intern/tabs/my_task_three_tab.dart';
import 'package:api_infolabz_intern/tabs/my_task_two_tab.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("API Tasks by Rushi"),
            bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.rocket_launch_rounded),
                    text: "Task 1",
                  ),
                  Tab(
                    icon: Icon(Icons.tag_faces_sharp),
                    text: "Task 2",
                  ),
                  Tab(
                    icon: Icon(Icons.newspaper_rounded),
                    text: "Task 3",
                  ),
                ]),
          ),
          body: const TabBarView(
              children: [
                MyTaskOneTab(),
                MyTaskTwoTab(),
                MyTaskThreeTab()
              ]),
        ));
  }
}
