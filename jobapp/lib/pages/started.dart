import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children:[
          Container(
            width: width,
            height:height,
            decoration: BoxDecoration(
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.end,
              children:[
                Container(
                  width: width,
                  height: height*0.75,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)
                    ),
                    gradient:LinearGradient(
                begin:Alignment.topCenter,
                end:Alignment.bottomCenter,
                colors: [Color(0xff7d7cf9),Color(0xffc621e5)]
              )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.1,),
                      Image.asset('assets/started.png'),
                      Text('Find Your \n Dream Job',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize:30,
                        fontWeight:FontWeight.bold,
                        color:Colors.white
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height*0.01),
                Center(
                    child: Container(
                      width: width*0.4,
                      height: height*0.075,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xffc621e5)
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/login');
                        },
                         child: Text('Login',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                    ),
                ),
                 SizedBox(height: height*0.01),
                Center(
                    child: Container(
                      width: width*0.4,
                      height: height*0.075,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xffc621e5)
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/register');
                        },
                         child: Text('Register',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                    ),
                )
                
                
              ]

            ),
          )
        ]
      ),
    );
  }
}