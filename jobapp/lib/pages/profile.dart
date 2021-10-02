import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/widgets/contact.dart';
import 'package:jobapp/widgets/skills.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jobapp/pages/class/data_user.dart';

import 'class/data_user.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
String nama='',adrs='',education='',skill='';
int  phone;
int l;
String email;
List<String>skills;

   Future getSharedPref()async{
    SharedPreferences localStorage=await SharedPreferences.getInstance();
  setState(() {
    //json=json.decode(localStorage.getString('skill'));
    nama=localStorage.getString('name')??'';
    phone=localStorage.getInt('phone')??'';
    email=localStorage.getString('email')??'';
    adrs=localStorage.getString('address')??'';
    skills=localStorage.getStringList('skill')??0;
    education=localStorage.getString('education')??'';
  });
  
  //print(skills);
  
  }
  @override
  void initState(){
    super.initState();
    getSharedPref();
    
  }
  @override
  Widget build(BuildContext context) {
    //int l=skills.length;
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
   
   // for (var i = 0; i < l; i++) {
   // print(skills[i]); 
   // }
    return Scaffold(
       body:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
             children: [  
             Stack(
                          children: [
                   Container(
  
                       width: width,
  
                       height: height*0.4,
  
                       decoration: BoxDecoration(
  
                         color:Color(0xff243748),
  
                         borderRadius: BorderRadius.only(
  
                           bottomRight:Radius.circular(25),
  
                         ),
                       ),
                     ),
                     
                     Padding(
                       padding:  EdgeInsets.only(top:height*0.35),
                       child: Container(
                         width: width*0.3,
                         height: height*0.15,
                         decoration:BoxDecoration(
                           color:Color(0xff243748),
                           borderRadius:BorderRadius.only(
                             bottomLeft:Radius.circular(50),
                             bottomRight:Radius.circular(50),
                           )
                         )
                       ),
                     ),
                     Center(
                       child: Column(
                         children: [
                           SizedBox(height:height*0.05),
                           Container(
                             width:width*0.4,
                             height:height*0.2,
                             decoration: BoxDecoration(
                              
                               shape: BoxShape.circle,
                               image: DecorationImage(image:AssetImage('assets/person.jpg'),fit: BoxFit.fill)
                             )
                           ),
                            Text('$nama',
                              style:GoogleFonts.poppins(
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                                color:Colors.white
                              )
                            ),
                            Text('Front End Mobile',
                              style:GoogleFonts.poppins(
                                fontSize:16,
                                fontWeight: FontWeight.w400,
                                color:Colors.white
                              )
                            ),
                            SizedBox(height:height*0.08),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(right:width*0.0175),
                                  child: Container(
                                    width: width*0.3,
                                    height: height*0.15,
                                    decoration: BoxDecoration(
                                     color: Colors.white,
                                     
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image:AssetImage('assets/notif.png'),fit: BoxFit.contain),
                                     
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('22',style:GoogleFonts.poppins(
                                          fontSize:18,
                                          fontWeight:FontWeight.bold,
                                          color:Colors.blue
                                        )),
                                       Text('Saved',style:GoogleFonts.poppins(
                                          fontSize:18,
                                          fontWeight:FontWeight.bold,
                                          color:Colors.blue
                                        ))
                                      ]
                                    ),
                                  ),
                                ),
                                 Padding(
                                   padding:  EdgeInsets.only(right:width*0.075),
                                   child: Container(
                                    width: width*0.3,
                                    height: height*0.15,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image:AssetImage('assets/notif.png'),fit: BoxFit.contain),
                                     
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('18',style:GoogleFonts.poppins(
                                          fontSize:18,
                                          fontWeight:FontWeight.bold,
                                          color:Colors.blue
                                        )),
                                       Text('Applied',style:GoogleFonts.poppins(
                                          fontSize:18,
                                          fontWeight:FontWeight.bold,
                                          color:Colors.blue
                                        ))
                                      ]
                                    ),
                                ),
                                 ),
                              ],
                            )
                          
                         ],
                       ),
                     ),
                    
],
             ),
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('Education',
               style:GoogleFonts.poppins(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               )
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('$education',
               style:GoogleFonts.poppins(
                 fontSize: 16,
                 fontWeight: FontWeight.w400
               )
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('System Information (2017-2021)',
               style:GoogleFonts.poppins(
                 fontSize: 16,
                 fontWeight: FontWeight.w400
               )
               ),
             ),
                 SizedBox(height:height*0.01),
                Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('Skills',
               style:GoogleFonts.poppins(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               )
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Wrap(
                 runSpacing: 5,
                 spacing: 10,
                 children: [
              for(var i in skills)
                Skills(skill:'$i'),
              
                
               
                
                
                 
                 
                
                 ],
               ),
             ),
              SizedBox(height:height*0.01),
              Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('Contact',
               style:GoogleFonts.poppins(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               )
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: 
               Contact(
                 email:'$email',
                 phone:'0$phone',
                 home:'$adrs'
               )
             ),
             
             
               
               
  
             ],
  
           ),
       )
    );
  }
}

 void _panggil()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var name=pref.getString('name');
    print(name);
  }