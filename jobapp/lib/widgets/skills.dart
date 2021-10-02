import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Skills extends StatelessWidget {
  String skill;
  
  Skills({this.skill});
  
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
                     width: width*0.275,
                     height: height*0.035,
                     decoration: BoxDecoration(
                       color:Colors.grey,
                     ),
                     child: Center(
                       child: Text(skill,
                       style:GoogleFonts.poppins(
                         fontSize: 12,
                         fontWeight: FontWeight.w400
                       )
                       ),
                     ),
                   
    );
  }
}
