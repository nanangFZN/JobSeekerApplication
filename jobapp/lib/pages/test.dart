import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Coba extends StatelessWidget {
  const Coba({Key key}) : super(key: key);
  final String url="http://192.168.100.5:8000/api/job";
   Future showJobs() async {
      var response=await http.get(Uri.parse(url));
      print(json.decode(response.body));
      return json.decode(response.body);
    }
  @override
  Widget build(BuildContext context) {
    showJobs();
    return Scaffold(
      body:FutureBuilder(
        future:showJobs(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context,index){
                return Text(snapshot.data['data'][index]['perusahaan']);
              });
          }else{
            return Text('tidak');
          }
        } ,)
    );
  }
}