import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/widgets/bottomnavigation.dart';
import 'package:jobapp/widgets/favorit_list.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class SaveJob extends StatelessWidget {
 String pt;
 String address;
 String salary;
 SaveJob({this.pt, this.address, this.salary}); 
 
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:FavoritList(title: 'a',pt:'w',address:'s')
    );
  }
}