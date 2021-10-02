import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
class FavoritList extends StatelessWidget {
  
  String title;
  String pt;
  String address;
  FavoritList({this.title, this.pt, this.address});
  final String url="http://192.168.100.5:8000/api/favorite/";
  Future showFavs() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String id=localStorage.getInt('id_user').toString();
    var response=await http.get(url+id);
    print(json.decode(response.body));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return 
           FutureBuilder(
             future: showFavs(),
             builder: (context,snapshot){
               if(snapshot.hasData){
                 return ListView.builder(
                   itemCount: snapshot.data['data'].length,
                   itemBuilder: (context,index){
                     return Column(
                       children: [
                         SizedBox(height:height*0.01),
                         Container(
                           width:width*0.9,
                           height:height*0.225,
                           decoration:BoxDecoration(
                             color: Colors.white,
                             boxShadow: [BoxShadow(
                               spreadRadius: 1,
                               color:Colors.grey,
                               blurRadius: 3
                             )],
                             borderRadius :BorderRadius.circular(25)
                           ),
                           child:Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding:  EdgeInsets.only(top:height*0.01,left:width*0.05),
                                 child: Text(snapshot.data['data'][index]['perusahaan'],
                                 style:GoogleFonts.poppins(
                                   fontSize:20,
                                   color:Colors.blue,
                                   fontWeight:FontWeight.w600,
                                 )),
                               ),
                               Padding(
                                 padding:  EdgeInsets.only(top:height*0.001,left:width*0.05),
                                 child: Text(snapshot.data['data'][index]['deskjob'],
                                 style:GoogleFonts.poppins(
                                   fontSize:18,
                                   color:Colors.black,
                                   fontWeight:FontWeight.w400,
                                 )),
                               ),
                               Padding(
                                 padding:  EdgeInsets.only(top:height*0.01,left:width*0.05),
                                 child: Text(snapshot.data['data'][index]['alamat'],
                                 style:GoogleFonts.poppins(
                                   fontSize:14,
                                   color:Colors.blue,
                                   fontWeight:FontWeight.bold,
                                 )),
                               ),
                               Padding(
                                 padding:  EdgeInsets.only(top:height*0.01,left:width*0.4),
                                 child: Text('IDR '+snapshot.data['data'][index]['salary']+'/month',
                                 style:GoogleFonts.poppins(
                                   fontSize:16,
                                   color:Colors.black,
                                   fontWeight:FontWeight.bold,
                                 )),
                               )
                             ],
                           )
                         )
                       ],
                     );
                   });
                 
               }else{
                 return Text('ERROR');
               }
             },
                        
           );
  }
}