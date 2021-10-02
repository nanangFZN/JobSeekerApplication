import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _address=new TextEditingController();
  TextEditingController _skill=new TextEditingController();
  TextEditingController _education=new TextEditingController();
 
  TextEditingController _nameController=new TextEditingController();

  TextEditingController _emailController=new TextEditingController();

  TextEditingController _phoneController=new TextEditingController();

  TextEditingController _passwordController=new TextEditingController();

  Future _register()async{
       final response=await http.post('http://192.168.100.5:8000/api/postregister',body: 
       {
         'name':_nameController.text,
         'phonenumber':_phoneController.text,
         'email':_emailController.text,
         'education':_education.text,
         'address':_address.text,
         'skills':_skill.text,
         'password':_passwordController.text
       });
       var data=json.decode(response.body);
      int phone=int.parse(_phoneController.text);
      var token=data['data']['remember_token'];
        var s=[_skill.text];
       if (response.statusCode==200) {
         var myList=new List<String>.from(s);
       SharedPreferences localStorage=await SharedPreferences.getInstance();
         localStorage.setString('token',token);
         localStorage.setString('name', _nameController.text);
         localStorage.setInt('phone', phone);
         localStorage.setString('address',_address.text);
         localStorage.setString('education',_education.text);
         localStorage.setString('email',_emailController.text);
         localStorage.setStringList('skill', myList);
         Navigator.pushNamed(context, '/menu');
       }else{
          Alert(context: context, title: 'DataError',type: AlertType.error).show();
       }
    }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      body:SingleChildScrollView(
              child: Column(
          children:[
            Container(
              width:width,
              height:height*0.3,
              decoration:BoxDecoration(
               image:DecorationImage(image: AssetImage('assets/stuck.png')),
               color: Color(0xff7277f1),
                borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(50),
                  bottomRight:Radius.circular(50)
                )
              ),
              child: Padding(
                padding:  EdgeInsets.only(top:height*0.35,left:width*0.1),
                child: Text('Register',
                style:GoogleFonts.acme(
                  fontSize:34,
                  fontWeight:FontWeight.bold,
                  color: Colors.white
                )),
              ),
            ),
            Padding(
                padding:  EdgeInsets.only(top:height*0.01),
                child: Text('Register',
                style:GoogleFonts.acme(
                  fontSize:25,
                  fontWeight:FontWeight.bold,
                  color: Colors.purple
                )),
              ),
             SizedBox(height: height*0.015),
           Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             child:TextFormField(
               controller: _nameController,
               decoration:InputDecoration(
                 labelText: 'FullName',
                 prefixIcon: Icon(Icons.person,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
            SizedBox(height: height*0.015),
           Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             child:TextFormField(
               controller: _emailController,
               keyboardType: TextInputType.emailAddress,
               decoration:InputDecoration(
                 labelText: 'Email',
                 prefixIcon: Icon(Icons.email,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
            SizedBox(height: height*0.015),
           Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             child:TextFormField(
               controller: _phoneController,
               keyboardType: TextInputType.phone,
               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               textInputAction: TextInputAction.done,
               decoration:InputDecoration(
                 labelText: 'Phone',
                 prefixIcon: Icon(Icons.phone,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
            SizedBox(height:height*0.015),
            Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             
             child:TextFormField(
               controller: _education,
              
               decoration:InputDecoration(
                 labelText: 'Last Education',
                 prefixIcon: Icon(Icons.school_rounded,color: Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
            SizedBox(height:height*0.015),
            Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             
             child:TextFormField(
               controller: _address,
             
               decoration:InputDecoration(
                 labelText: 'Address',
                 prefixIcon: Icon(Icons.home,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
            SizedBox(height:height*0.015),
            Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             
             child:TextFormField(
               controller: _skill,
              
               decoration:InputDecoration(
                 labelText: 'Skill',
                 prefixIcon: Icon(Icons.book_online,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
           SizedBox(height:height*0.015),
            Container(
             width:width*0.75,
             height:height*0.05,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             
             child:TextFormField(
               controller: _passwordController,
               obscureText: true,
                enableSuggestions: false,
              autocorrect: false,
               decoration:InputDecoration(
                 labelText: 'Password',
                 prefixIcon: Icon(Icons.vpn_key,color:Colors.purple),
                 labelStyle: TextStyle(color: Colors.purple),
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25)
                   
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.purple),
                     borderRadius: BorderRadius.circular(25)
                   ),
                  enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.purple, width: 1),
                       borderRadius: BorderRadius.circular(25)
                      ),
               )
             ) ,
           ),
           
           SizedBox(height: height*0.015),
           Container(
             width:width*0.4,
             height:height*0.075,
             child: ElevatedButton(
               onPressed: (){
                _register().then((value) {
                  SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
                  Navigator.pushNamed(context, '/menu');
                });
               },
               style: ElevatedButton.styleFrom(
                 primary:Color(0xff7277f1)
               ),
                child: Text('Register',style:GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.bold))),
           ),
            

          ]
        ),
      ),
    );
  }
}