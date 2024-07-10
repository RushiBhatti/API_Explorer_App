import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTaskOneTab extends StatefulWidget{
  const MyTaskOneTab({super.key});

  @override
  State<MyTaskOneTab> createState() => _MyTaskOneTabState();
}

class _MyTaskOneTabState extends State<MyTaskOneTab> {

  static String _responseBody = "";
  static String _firstSpaceCraftName = "";
  static String _apiResp = "";

  Future<void> fetchData() async{

    // to verify that api will be only called one time
    // print("API Calling in TASK 1");

    const String url = "https://isro.vercel.app/api/spacecrafts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    _apiResp = response.body;
  }

  void showFirstName() async{
    if(_apiResp != ""){
      // API is called
      Map<String,dynamic> resp = json.decode(_apiResp);
      setState(() {
        _firstSpaceCraftName = "1st SpaceCraft Name :- ${resp["spacecrafts"][0]["name"]}";
      });
    }
    else{
      // API is not called
      await fetchData();
      Map<String,dynamic> resp = json.decode(_apiResp);
      setState(() {
        _firstSpaceCraftName = "1st SpaceCraft Name :- ${resp["spacecrafts"][0]["name"]}";
      });
    }

  }

  void showFullResponse() async{

    if(_apiResp == ""){
      // API is not Called
      await fetchData();
      setState(() {
        _responseBody = "All Data :\n$_apiResp";
      });
    }else{
      // API is called
      setState(() {
        _responseBody = "All Data :\n$_apiResp";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    const String taskOneQue = "TASK 1 : Fetch all data from ISRO API on button click. Print First spacecraft name "
        "‘Aryabhata’ on second button click. ";

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.only(top: 22.0,left: 10,right: 10),
            child: Text("ISRO API", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),

          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 120,
            endIndent: 120,
          ),

          const SizedBox(height: 20,),

          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              taskOneQue,
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
                    showFullResponse();
                  },
                  child: const Text("Fetch All Data")
              ),

              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  onPressed: (){
                    showFirstName();
                  },
                  child: const Text("Print First SpaceCraft Name")
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_firstSpaceCraftName,style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(_responseBody,style: const TextStyle(
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