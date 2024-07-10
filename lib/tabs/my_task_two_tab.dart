import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyTaskTwoTab extends StatefulWidget{
  const MyTaskTwoTab({super.key});

  @override
  State<MyTaskTwoTab> createState() => _MyTaskTwoTabState();
}

class _MyTaskTwoTabState extends State<MyTaskTwoTab> {
  static String punchLine = "";
  static String setUp = "";

  Future<void> printJoke() async{

    const String url = "https://official-joke-api.appspot.com/jokes/random";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    Map<String,dynamic> resp = json.decode(response.body);
    setState(() {
      setUp = "SetUp :- ${resp["setup"]}";
      punchLine = "PunchLine :- ${resp["punchline"]}";
    });
  }

  @override
  Widget build(BuildContext context) {

    const String taskTwoQue = "TASK 2 - Random Jokes API : "
        "On button click print new random jokes ( setup + punchline ) from given API.";

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.only(top: 22.0,left: 10,right: 10),
            child: Text("Random Jokes API", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),

          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 70,
            endIndent: 70,
          ),

          const SizedBox(height: 20,),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              taskTwoQue,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  onPressed: (){
                    printJoke();
                  },
                  child: const Text("Print Joke")
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(setUp,style: const TextStyle(
                  fontSize: 16,
                ),),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(punchLine,style: const TextStyle(
                  fontSize: 16,
                ),),
              ),

            ],
          ),

        ],
      ),
    );
  }
}