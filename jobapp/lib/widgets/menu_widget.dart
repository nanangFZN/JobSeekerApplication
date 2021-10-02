import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/pages/class/data_user.dart';
import 'package:jobapp/widgets/categories.dart';
import 'package:jobapp/widgets/recent_job.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
 
 
  @override
  Widget build(BuildContext context) {
    
    final width=MediaQuery.of(context).size.width;
      final height=MediaQuery.of(context).size.height;
    return Scaffold(
     body:ListView(
     
       children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:[
             Container(
               width:width*0.4,
               height:height*0.1,
               decoration: BoxDecoration(
                 image:DecorationImage(image:AssetImage('assets/logojob.png'),fit:BoxFit.cover)
               ),
             ),
             Center(
  
                   child: Container(
  
                     width:width*0.75,
  
                     height:height*0.075,
  
                     decoration: BoxDecoration(
  
                       boxShadow: [BoxShadow(
  
                         blurRadius: 1,
  
                         color: Colors.white,
  
                         spreadRadius: 1
  
                       )]
  
                     ),
  
                     child: TextFormField(
  
                       decoration: InputDecoration(
  
                         hintText: 'Search',
  
                         prefixIcon: Icon(Icons.search),
  
                         border:OutlineInputBorder(
  
                           
  
                           borderRadius:BorderRadius.circular(25)
  
                         ),
  
                         focusedBorder: OutlineInputBorder(
  
                           borderSide:BorderSide(color:Colors.grey),
  
                           borderRadius:BorderRadius.circular(25)
  
                         )
  
                       ),
  
                     ),
  
                   ),
  
                 ),
                SizedBox(height: height*0.025,),
  
                 Padding(
  
                   padding:  EdgeInsets.only(left:width*0.05),
  
                   child: Text('Categories',
  
                   style:GoogleFonts.poppins(
  
                     fontSize:20,
  
                     fontWeight: FontWeight.bold
  
                   )),
  
                 ),
  
                 SizedBox(height: height*0.015,),
  
                 SingleChildScrollView(
  
                   scrollDirection: Axis.horizontal,
  
                    child: Row(
  
                     children:[
  
                      Categories(title:'Website Developer'),
  
                      Categories(title:'Mobile Developer'),
  
                       Categories(title:'Front End Mobile'),
  
                       Categories(title:'Front End Website'),
  
                       Categories(title:'UI/UX Designer'),
  
                     ]
  
                   ),
  
                 ),
                  Padding(
  
                   padding:  EdgeInsets.only(left:width*0.05,top:height*0.015),
  
                   child: Text('Recent Job',
  
                   style:GoogleFonts.poppins(
  
                     fontSize: 20,
  
                     fontWeight: FontWeight.bold,
  
                   )
  
                   ),
  
                 ),
            SizedBox(height: height*0.01,),
             RecentJob()
           ]
         )
       ],)
    );
  }
}