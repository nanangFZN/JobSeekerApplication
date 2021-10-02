import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
 String title;
 Categories({this.title});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
      final height=MediaQuery.of(context).size.height;
    return   Padding(
               padding:  EdgeInsets.only(left:width*0.025),
               child: InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, '/coba');
                 },
                                child: Container(
                   width:width*0.4,
                   height:height*0.25,
                   decoration:BoxDecoration(
                     border: Border.all(color:Colors.grey),
                     color:Colors.white,
                     borderRadius:BorderRadius.circular(25),
                     boxShadow: [BoxShadow(
                       spreadRadius: 0.5,
                       color:Colors.grey,
                       blurRadius: 0.5
                       
                     )]
                   ),
                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height:height*0.01),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.025),
                         child: Text(title,
                         style:GoogleFonts.poppins(
                           fontSize:14,
                           fontWeight:FontWeight.bold
                         )),
                       ),
                      
                      Center(
                        child: Container(
                          width:width*0.35,
                          height:height*0.175,
                          decoration: BoxDecoration(
                            image: DecorationImage(image:AssetImage('assets/php.jpg'),fit:BoxFit.fill),
                            borderRadius:BorderRadius.circular(25)
                          )
                        ),
                      )
                     ],
                   )
                 ),
               ),
             );
  }
}