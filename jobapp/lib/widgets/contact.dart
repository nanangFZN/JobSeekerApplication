import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
 String email;
 String phone;
 String home;
 Contact ({this.email, this.phone, this.home});
  @override
  Widget build(BuildContext context) {
     final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return  Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.email),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.01),
                         child: Text(email,
                         style:GoogleFonts.poppins(
                           fontSize: 16,
                           fontWeight: FontWeight.w400
                         )
                         ),
                       ),
                     ],
                   ),
                    Row(
                     children: [
                       Icon(Icons.phone_android),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.01),
                         child: Text(phone,
                         style:GoogleFonts.poppins(
                           fontSize: 16,
                           fontWeight: FontWeight.w400
                         )
                         ),
                       ),
                     ],
                   ),
                    Row(
                     children: [
                       Icon(Icons.home_filled),
                       Flexible(
                          child: Padding(
                           padding:  EdgeInsets.only(left:width*0.01),
                           child: Text(home,
                           style:GoogleFonts.poppins(
                             fontSize: 16,
                             fontWeight: FontWeight.w400
                           )
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               );
             
  }
}