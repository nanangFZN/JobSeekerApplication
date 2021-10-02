import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/widgets/requirements.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatefulWidget {
  final Map job;
  Details({@required this.job});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
   String arrayText =  widget.job['requirement'];
  
  var tagsJson = jsonDecode(arrayText);
  List<String> tags = tagsJson != null ? List.from(tagsJson) : null;
  int length=tags.length;
  for (var i = 0; i < length; i++) {
    print(tags[i]);
  }
  Future _favorites() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
     int idj=widget.job['id'];
    int idu=localStorage.getInt('id_user');
    String idUser=idu.toString();
    String idJob=idj.toString();
    String url = 'http://192.168.100.5:8000/api/favorite';
    final response = await http.post(url,body:{
        'id_user':idUser,
        'id_job':idJob,
    });
    var data=json.decode(response.body);
    print(data);
  }
  

    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff7277f1),
      body: ListView(
              children: [
              Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
            children:[
  
             Padding(
               padding:  EdgeInsets.only(left:width*0.1),
               child: Text('Job Details',style: GoogleFonts.poppins(
                   fontSize:24,
                   fontWeight:FontWeight.bold,
                   color:Colors.white
               ),),
             ),
             Container(
               width:width,
               height:height*0.3,
               decoration: BoxDecoration(
                   image:DecorationImage(image: AssetImage('assets/detail.png'))
               ),
             ),
             Container(
               width:width,
               height:height*0.6026,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius:BorderRadius.only(
                     topRight:Radius.circular(150)
                   )
               ),
               child: SingleChildScrollView(
                                child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05,top:height*0.025),
                         child: Text('Software Engineering',
                         style:GoogleFonts.poppins(
                           fontSize:14,
                           color:Colors.pink
                         )),
                       ),
                       SizedBox(height:height*0.01),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05,),
                         child: Text(widget.job['position'],
                         style:GoogleFonts.poppins(
                           fontSize:22,
                           fontWeight:FontWeight.bold
                         )),
                       ),
                       SizedBox(height:height*0.01),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05,),
                         child: Text( widget.job['alamat']+' , Indonesia',
                         style:GoogleFonts.poppins(
                           fontSize:16,
                           fontWeight:FontWeight.w400
                         )),
                       ),
                        SizedBox(height:height*0.01),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05,),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text('Full Time',
                             style:GoogleFonts.poppins(
                               fontSize:18,
                               fontWeight:FontWeight.bold,
                               color:Colors.grey
                             )),
                             Text('IDR '+widget.job['salary']+'/month',
                             style:GoogleFonts.poppins(
                               fontSize:18,
                               fontWeight:FontWeight.bold,
                               color:Colors.grey
                             )),

                           ],
                         ),
                       ),
                       SizedBox(height:height*0.005),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05),
                         child: Text('Requirements',
                         style:GoogleFonts.poppins(
                           fontSize: 16,
                           fontWeight:FontWeight.bold,
                         )),
                       ),
                      SizedBox(height:height*0.005),
                     
                     for(var i in tags)
                     Requirements(requirements:i.toString()),
                      
                     
                      SizedBox(height:height*0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.4,
                            height: height*0.075,
                            child: ElevatedButton(
                              onPressed: (){},
                               child: Text('Apply')),
                          ),
                          Container(
                            width: width*0.4,
                            height: height*0.075,
                            decoration: BoxDecoration(
                              border: Border.all(color:Colors.blue)
                            ),
                            child:TextButton.icon(
                              onPressed: (){
                                _favorites();
                                Navigator.pushNamed(context, '/menu');
                              },
                               icon: Icon(Icons.save),
                               label: Text('Simpan'),
                               style: TextButton.styleFrom(
                                 
                               ),
                               )
                          )
                        ],
                      )
                     ],
                 ),
               ),
             )
  
            ]
  
          ),
               
],
      ),
    );
  }
}