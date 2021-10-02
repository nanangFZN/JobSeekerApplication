import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:jobapp/pages/details.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecentJob extends StatelessWidget {
  String job;
  String pt;
  String address;
  String salary;
  RecentJob({this.job,this.pt,this.address,this.salary});
   final String url="http://192.168.100.5:8000/api/job";
  Future showJobs() async {
    var response=await http.get(Uri.parse(url));
   
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
     final width=MediaQuery.of(context).size.width;
      final height=MediaQuery.of(context).size.height;
    return 
            Center(
              child: FutureBuilder(
                future:showJobs(),
                builder: (context,snapshot){
                  if (snapshot.hasData) {
                    return  ListView.builder(
                       physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.only(bottom:height*0.01),
                            child: InkWell(
                              onTap: (){
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(job:snapshot.data['data'][index])));
                              },
                       child: Container(
                  width: width*0.9,
                  height:height*0.15,
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                              spreadRadius: 0.5,
                              color:Colors.grey,
                              blurRadius: 4
                        )
                      ]
                  ),
                  child: Row(
                      children: [
                        Container(
                              width: width*0.3,
                              height: height*0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(image:AssetImage('assets/programmer.jpg'),fit:BoxFit.fill),
                                borderRadius: BorderRadius.circular(15)
                              )
                        ),
                        Expanded(
                               child: Column(  
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  
                                   Padding(
                                     padding:  EdgeInsets.only(top:height*0.015),
                                     child: Text(snapshot.data['data'][index]['position'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      
                                      ),
                                  ),
                                   ),
                                  Text(snapshot.data['data'][index]['perusahaan'],style: GoogleFonts.poppins(fontSize:16)),
                                   Text(snapshot.data['data'][index]['alamat'],style: GoogleFonts.poppins(fontWeight:FontWeight.bold),),
                                    Text(snapshot.data['data'][index]['salary'],style: GoogleFonts.poppins(fontWeight:FontWeight.bold)),
                                ],
                              ),
                        )
                      ],
                  ),
                ),
                            ),
                          );
                        },
                      
                    );
                  }else{
                    return SpinKitDoubleBounce(
                      color:Colors.grey,
                      size:50,
                      
                    );
                  }
                },
                           
              ),
            
      
    );
  }
}