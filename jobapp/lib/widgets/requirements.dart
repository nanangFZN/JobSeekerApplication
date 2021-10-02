import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  String requirements;
  Requirements({this.requirements});
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return  
                   Padding(
                     padding:  EdgeInsets.only(left:width*0.075),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           width: width*0.025,
                           height: height*0.025,
                           decoration: BoxDecoration(
                             color:Colors.grey,
                             shape: BoxShape.circle
                           )
                         ),
                         Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(left:width*0.025),
                            child: Text(requirements,
                             overflow: TextOverflow.ellipsis,
                             maxLines: 2,
                             softWrap: false,
                             style: TextStyle(fontSize: 16),
                             ),
                          ),
                         )
                       ],
                     ),
                   );
  }
}