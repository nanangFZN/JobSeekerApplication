import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/pages/class/shared_profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'class/data_user.dart';


class LoginPage extends StatefulWidget {
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future _login()async{
  if (_emailController.text.isEmpty||_passwordController.text.isEmpty) {
      Alert(context: context, title: "Please Fill Form!",type:AlertType.error).show();
      return;
      }
       final response=await http.post('http://192.168.100.5:8000/api/postlogin',body: 
       {
         'email':_emailController.text.toString(),
         'password':_passwordController.text.toString()
       });
       var body=json.decode(response.body);
      var s=(body['data']['user']['skills']);
     // print(s);
    
    
     
       if (response.statusCode==200) {
          var myList = new List<String>.from(s);
           print(myList);
         var name=body['data']['user']['name'];
         var email=body['data']['user']['email'];
          int phone=body['data']['user']['phonenumber'];
          var address=body['data']['user']['address'];
          var education=body['data']['user']['education'];
          int idUser=body['data']['user']['id'];
           
         SharedPreferences localStorage=await SharedPreferences.getInstance();
        //List<String>sk=s.map((i) => i.toString()).toList();
        //print(sk);
         //localStorage.setStringList('k',s);
         localStorage.setString('token', body['data']['token']);
         localStorage.setString('name', body['data']['user']['name']);
         localStorage.setInt('id_user', idUser);
         localStorage.setString('email', email);
         localStorage.setInt('phone',phone);
         localStorage.setString('user',json.encode(body['data']['user']));
         localStorage.setString('address',address);
         localStorage.setString('education',education);
         localStorage.setStringList('skill', myList);
         DataUser(name:name,phone:phone,email:email);
         Navigator.pushNamed(context, '/menu',arguments:DataUser(name:name,email:email,phone:phone));
       }else{
          Alert(context: context, title: 'Invalid Password or Username',type: AlertType.error).show();
       }
    }

    

  TextEditingController _emailController=new TextEditingController();

  TextEditingController _passwordController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      
      body: SingleChildScrollView(
              child: Column(
          children:[
            Container(
              width:width,
              height:height*0.6,
              decoration:BoxDecoration(
               image:DecorationImage(image: AssetImage('assets/city.png')),
               color: Color(0xff7277f1),
                borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(50),
                  bottomRight:Radius.circular(50)
                )
              ),
              child: Padding(
                padding:  EdgeInsets.only(top:height*0.45,left:width*0.1),
                child: Text('Login',
                style:GoogleFonts.acme(
                  fontSize:34,
                  fontWeight:FontWeight.bold,
                  color: Colors.white
                )),
              ),
            ),
            SizedBox(height: height*0.025),
           Container(
             width:width*0.75,
             height:height*0.075,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             child:TextFormField(
               controller: _emailController,
               decoration:InputDecoration(
                 labelText: 'Email',
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
           SizedBox(height:height*0.025),
            Container(
             width:width*0.75,
             height:height*0.075,
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(25),
             ),
             child:TextFormField(
               obscureText: true,
                enableSuggestions: false,
              autocorrect: false,
               controller: _passwordController,
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
           SizedBox(height: height*0.025),
           Container(
             width:width*0.4,
             height:height*0.075,
             child: ElevatedButton(
               onPressed: (){
                _login();
               },
               style: ElevatedButton.styleFrom(
                 primary:Color(0xff7277f1)
               ),
                child: Text('Login',style:GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.bold))),
           )

          ]
        ),
      ),
    );
  }
}
