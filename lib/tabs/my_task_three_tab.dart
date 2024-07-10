import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyTaskThreeTab extends StatefulWidget{
  const MyTaskThreeTab({super.key});

  @override
  State<MyTaskThreeTab> createState() => _MyTaskThreeTabState();
}

class _MyTaskThreeTabState extends State<MyTaskThreeTab> {
  static String totalNoOfNews = "";
  static String firstNewsTitle = "";
  static String apiResp = "";

  Future<void> fetchNews() async{

    // to verify that api will be only called one time
    // print("API Calling in TASK 3");

    const String url = "https://inshortsapi.vercel.app/news?category=sports";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    apiResp = response.body;
  }

  void showFirstNewsTitle() async{
    if(apiResp != ""){
      // API is called
      Map<String,dynamic> resp = json.decode(apiResp);
      setState(() {
        firstNewsTitle = "First News Title : \n${resp["data"][0]["title"]}";
      });
    }
    else{
      // API is not called
      await fetchNews();
      Map<String,dynamic> resp = json.decode(apiResp);
      setState(() {
        firstNewsTitle = "First News Title : \n${resp["data"][0]["title"]}";
      });
    }

  }

  void showTotalNoOfNews() async{

    if(apiResp == ""){
      // API is not Called
      await fetchNews();
      Map<String,dynamic> resp = json.decode(apiResp);
      setState(() {
        int len = resp["data"].length;
        totalNoOfNews = "Total No of News : ${len.toString()}";
      });
    }else{
      // API is called
      Map<String,dynamic> resp = json.decode(apiResp);
      setState(() {
        int len = resp["data"].length;
        totalNoOfNews = "Total No of News : ${len.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    const String taskThreeQue = "TASK 3 - Realtime Live News API ( InShorts API ) : "
        "On First button click print total number of news in given API. "
        "On Second button click print First new’s title.";

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.only(top: 22.0,left: 10,right: 10),
            child: Text("News ( InShorts ) API", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),

          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 60,
            endIndent: 60,
          ),

          const SizedBox(height: 20,),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              taskThreeQue,
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
                    showTotalNoOfNews();
                  },
                  child: const Text("See Total No of News")
              ),

              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  onPressed: (){
                    showFirstNewsTitle();
                  },
                  child: const Text("See First News Title")
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(totalNoOfNews,style: const TextStyle(
                  fontSize: 16,
                ),),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(firstNewsTitle,style: const TextStyle(
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