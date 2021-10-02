import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
     body: Column(
        children:[
          Container(
            width:width,
            height:height,
            decoration: BoxDecoration(
             gradient: LinearGradient(
               begin:Alignment.topCenter,
               end:Alignment.bottomCenter,
               colors:[Color(0xff5c73b9),Color(0xffb330e1)]
             )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                  Padding(
                    padding:  EdgeInsets.only(left:width*0.05,top:height*0.2),
                    child: Text("Let's Start Your \n Professional Career",
                    textAlign: TextAlign.center,
                    style:GoogleFonts.poppins(
                      fontSize:28,
                      fontWeight:FontWeight.bold,
                      color:Colors.white
                    )
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:width*0.2),
                    child: Container(
                      width:width*0.5,
                      height: height*0.075,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xFFc621e5)
                        ),
                         child: Text('Get Started',
                         style:GoogleFonts.poppins(
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                         )
                         )
                         ),
                    ),
                  ),
                  SizedBox(height:height*0.025),
                  Container(
                    width:width,
                    height:height*0.58635,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.only(topRight: Radius.circular(150)),
                    ),
                    child: Image.asset('assets/working.png'),
                  )
              ]
            ),
          ),
        
        ]
      ),
    );
  }
}